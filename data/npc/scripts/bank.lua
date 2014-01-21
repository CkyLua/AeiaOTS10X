local config = {
	pin = false, -- players can protect their money with pin code (like in cash machines) (true/false)
	pinMinLength = 4, -- minimum pin length
	pinMaxLength = 4, -- maximum pin length
	pinStorage = 3006, -- only if pin enabled (used to store player pin)
	transferDisabledVocations = {0} -- disable non vocation characters
}

local talkState = {}
local count = {}
local transfer = {}
local pin = {}
local random_texts = {'Your gold safe at here, <snickers>!', 'Me take all gold! Good care! Give! Give!', 'Problems with market? Read the blackboard.'}
local random_texts_chance = 40 -- percent
local random_texts_interval = 5 -- seconds
random_word_bank = 0
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()
	if(random_word_bank < os.time()) then
		random_word_bank = (os.time() + random_texts_interval)
		if(math.random(1, 100) < random_texts_chance) then
			selfSay(random_texts[math.random(1, #random_texts)])
		end
	end
	npcHandler:onThink()
end

if(config.pin) then
	bank_pin = {
		get = function(cid)
			return getPlayerStorageValue(cid, config.pinStorage)
		end,

		set = function(cid, code)
			return setPlayerStorageValue(cid, config.pinStorage, code)
		end,

		logged = function(cid)
			return pin[cid] == bank_pin.get(cid)
		end,

		validate = function(code)
			if(not isNumber(code)) then
				return false
			end

			local length = tostring(code):len()
			return (length >= config.pinMinLength and length <= config.pinMaxLength)
		end
	}
end

if(not getPlayerBalance) then
	getPlayerBalance = function(cid)
		local result = db.getResult("SELECT `balance` FROM `players` WHERE `id` = " .. getPlayerGUID(cid))
		if(result:getID() == -1) then
			return false
		end

		local value = tonumber(result:getDataString("balance"))
		result:free()
		return value
	end

	doPlayerSetBalance = function(cid, balance)
		db.executeQuery("UPDATE `players` SET `balance` = " .. balance .. " WHERE `id` = " .. getPlayerGUID(cid))
		return true
	end

	doPlayerWithdrawMoney = function(cid, amount)
		local balance = getPlayerBalance(cid)
		if(amount > balance or not doPlayerAddMoney(cid, amount)) then
			return false
		end

		doPlayerSetBalance(cid, balance - amount)
		return true
	end

	doPlayerDepositMoney = function(cid, amount)
		if(not doPlayerRemoveMoney(cid, amount)) then
			return false
		end

		doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
		return true
	end

	doPlayerTransferMoneyTo = function(cid, target, amount)
		local balance = getPlayerBalance(cid)
		if(amount > balance) then
			return false
		end

		local tid = getPlayerByName(target)
		if(tid > 0) then
			doPlayerSetBalance(tid, getPlayerBalance(tid) + amount)
		else
			if(playerExists(target) == false) then
				return false
			end

			db.executeQuery("UPDATE `player_storage` SET `value` = `value` + '" .. amount .. "' WHERE `player_id` = (SELECT `id` FROM `players` WHERE `name` = '" .. escapeString(player) .. "') AND `key` = '" .. balance_storage .. "'")
		end

		doPlayerSetBalance(cid, getPlayerBalance(cid) - amount)
		return true
	end
end

local function getPlayerVocationByName(name)
	local result = db.getResult("SELECT `vocation` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if(result:getID() == -1) then
		return false
	end

	local value = result:getDataString("vocation")
	result:free()
	return value
end

local function isValidMoney(money)
	return (isNumber(money) and money > 0 and money < 4294967296)
end

local function getCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if(isValidMoney(money)) then
		return money
	end
	return -1
end

function greetCallback(cid)
	talkState[cid], count[cid], transfer[cid], pin[cid] = 0, nil, nil, nil
	return true
end

function creatureSayCallback(cid, type, msg)

	if(not npcHandler:isFocused(cid)) then
		return false
	end

---------------------------- pin -------------------------
	if(config.pin) then
		if(talkState[cid] == "verify-pin") then
			talkState[cid] = 0
			pin[cid] = getCount(msg)
			if(not bank_pin.logged(cid)) then
				selfSay("Invalid pin code entered.", cid)
				return true
			end

			selfSay("You have been successfully logged in.", cid)
		elseif(talkState[cid] == "new-pin") then
			talkState[cid] = 0

			if(bank_pin.get(cid) ~= -1 and not bank_pin.logged(cid)) then
				selfSay("You need to log into your account first.", cid)
				talkState[cid] = "verify-pin"
				return true
			end

			if(msgcontains(msg, 'reset') or msgcontains(msg, 'remove') or msgcontains(msg, 'clear')) then
				selfSay("Pin code lock has been removed.", cid)
				pin[cid] = nil
				bank_pin.set(cid, -1)
				return true
			end

			pin[cid] = getCount(msg)
			if(bank_pin.validate(pin[cid])) then
				selfSay("Pin code successfully changed.", cid)
				bank_pin.set(cid, pin[cid])
			else
				local str = ""
				if(config.pinMinLength ~= config.pinMaxLength) then
					str = config.pinMinLength .. " - " .. config.pinMaxLength
				else
					str = config.pinMinLength
				end

				selfSay("Invalid pin code entered. Your pin should contain " .. str .. " digits", cid)
			end

			return true
		elseif(msgcontains(msg, 'balance') or
			msgcontains(msg, 'deposit') or
			msgcontains(msg, 'withdraw') or
			msgcontains(msg, 'transfer')) then
				if(bank_pin.get(cid) ~= -1 and not bank_pin.logged(cid)) then
					selfSay("and your pin code is?", cid)
					talkState[cid] = "verify-pin"
					return true
				end

				talkState[cid] = 0
		elseif(msgcontains(msg, 'login')) then
			talkState[cid] = "verify-pin"
			return true
		elseif(msgcontains(msg, 'pin')) then
			selfSay("What pin you wish to have now?", cid)
			talkState[cid] = "new-pin"
			return true
		end
	end
---------------------------- help ------------------------
	if msgcontains(msg, 'advanced') then
		if isInArray(config.transferDisabledVocations, getPlayerVocation(cid)) then
			selfSay("Enigma City has advanced bank system preventing mistakes such as money glitches and values below 0. If you find any mistake record and report it, you will be rewarded.", cid)
		else
			selfSay("Enigma City has advanced bank system preventing mistakes such as money glitches and values below 0. If you find any mistake record and report it, you will be rewarded.", cid)
		end
		talkState[cid] = 0
	elseif msgcontains(msg, 'help') or msgcontains(msg, 'functions') then
		selfSay("You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.", cid)
		talkState[cid] = 0
	elseif msgcontains(msg, 'bank') then
		npcHandler:say("We can change money for you. You can also access your bank account.", cid)
		talkState[cid] = 0
	elseif msgcontains(msg, 'job') then
		npcHandler:say("Me work in this store! Me keep your gold safe, <snickers>!", cid)
		talkState[cid] = 0
---------------------------- balance ---------------------
	elseif msgcontains(msg, 'balance') then
		talkState[cid] = 0
		if getPlayerBalance(cid) >= 100000000 then
			selfSay("I think you must be one of the richest inhabitants of Tibia! Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
		else
			if getPlayerBalance(cid) >= 10000000 then
				selfSay("You have made ten millions and it still grows! Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
			else
				if getPlayerBalance(cid) >= 1000000 then
					selfSay("Nice, You have made your first million and it grows! Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
				else
					if getPlayerBalance(cid) >= 100000 then
						selfSay("You certainly have made a pretty penny. Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
					else
						selfSay("Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
					end
				end
			end
		end
---------------------------- deposit ---------------------
	elseif msgcontains(msg, 'deposit all') and getPlayerMoney(cid) > 0 then
		count[cid] = getPlayerMoney(cid)
		if not isValidMoney(count[cid]) then
			selfSay("Sorry, but you can't deposit that much.", cid)
			talkState[cid] = 0
			return false
		end

		if count[cid] < 1 then
			selfSay("Fool! Your purse is empty!", cid)
			talkState[cid] = 0
		else
			selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
			talkState[cid] = 2
		end
	elseif msgcontains(msg, 'deposit') then
		selfSay("Please tell me how much gold it is you would like to deposit.", cid)
		talkState[cid] = 1
	elseif talkState[cid] == 1 then
		count[cid] = getCount(msg)
		if isValidMoney(count[cid]) then
			selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
			talkState[cid] = 2
		else
			selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
			talkState[cid] = 0
		end
	elseif talkState[cid] == 2 then
		if msgcontains(msg, 'yes') then
			if getPlayerMoney(cid) >= tonumber(count[cid]) then
				doPlayerDepositMoney(cid, count[cid])
				selfSay("Me added " .. count[cid] .. " gold to your balance. Your current balance is " .. getPlayerBalance(cid) .. ".", cid)
			else
				selfSay("Give gold! Give, give me! Now!", cid)
			end
		elseif msgcontains(msg, 'no') then
			selfSay("Then why you even asked! <gives you an evil look>", cid)
		end
		talkState[cid] = 0
---------------------------- withdraw --------------------
	elseif msgcontains(msg, 'withdraw') then
		selfSay("Please tell me how much gold you would like to withdraw.", cid)
		talkState[cid] = 6
	elseif talkState[cid] == 6 then
		count[cid] = getCount(msg)
		if isValidMoney(count[cid]) then
			selfSay("Are you sure you wish to withdraw " .. count[cid] .. " gold from your bank account?", cid)
			talkState[cid] = 7
		else
			selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
			talkState[cid] = 0
		end
	elseif talkState[cid] == 7 then
		if msgcontains(msg, 'yes') then
			if not doPlayerWithdrawMoney(cid, count[cid]) then
				selfSay("You don't have that much gold. Your gold is " .. getPlayerBalance(cid) .. "! This bank doesn't support borrows!", cid)
				talkState[cid] = 0
			else
				selfSay("Here, " .. count[cid] .. " gold.", cid)
				talkState[cid] = 0
			end
		elseif msgcontains(msg, 'no') then
			selfSay("Then why you even asked! <gives you an evil look>", cid)
			talkState[cid] = 0
		end
---------------------------- transfer --------------------
	elseif msgcontains(msg, 'transfer') then
		selfSay("How much gold you want to transfer?", cid)
		talkState[cid] = 11
	elseif talkState[cid] == 11 then
		count[cid] = getCount(msg)
		if getPlayerBalance(cid) < count[cid] then
			selfSay("You don't have that much gold!", cid)
			talkState[cid] = 0
			return true
		end

		if isValidMoney(count[cid]) then
			selfSay("Who would you like transfer " .. count[cid] .. " gold to?", cid)
			talkState[cid] = 12
		else
			selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
			talkState[cid] = 0
		end
	elseif talkState[cid] == 12 then
		transfer[cid] = msg

		if getCreatureName(cid) == transfer[cid] then
			selfSay("No, NO! Fill in this field with person who receives your gold!", cid)
			talkState[cid] = 0
			return true
		end

		if isInArray(config.transferDisabledVocations, getPlayerVocation(cid)) then
			selfSay("Your account is blocked from transfers. You are too young.", cid)
			talkState[cid] = 0
		end

		if playerExists(transfer[cid]) then
			selfSay("So you would like to transfer " .. count[cid] .. " gold to \"" .. transfer[cid] .. "\" ?", cid)
			talkState[cid] = 13
		else
			selfSay("Check this name again, \"" .. transfer[cid] .. "\" isn't vaild person.", cid)
			talkState[cid] = 0
		end
	elseif talkState[cid] == 13 then
		if msgcontains(msg, 'yes') then
			local targetVocation = getPlayerVocationByName(transfer[cid])
			if not targetVocation or isInArray(config.transferDisabledVocations, targetVocation) or not doPlayerTransferMoneyTo(cid, transfer[cid], count[cid]) then
				selfSay("You cannot transfer money to this account.", cid)
			else
				selfSay("" .. count[cid] .. " gold transferred to \"" .. transfer[cid] .."\".", cid)
				transfer[cid] = nil
			end
		elseif msgcontains(msg, 'no') then
			selfSay("Then why you even asked! <gives you an evil look>", cid)
		end
		talkState[cid] = 0
---------------------------- money exchange --------------
	elseif msgcontains(msg, 'change gold') then
		npcHandler:say("How many platinum coins would you like to get?", cid)
		talkState[cid] = 14
	elseif talkState[cid] == 14 then
		if getCount(msg) == -1 or getCount(msg) == 0 then
			npcHandler:say("No, No! No think me stupid in math! <gives you an evil look>", cid)
			talkState[cid] = 0
		else
			count[cid] = getCount(msg)
			npcHandler:say("" .. count[cid] * 100 .. " gold into " .. count[cid] .. " platinum, correct?", cid)
			talkState[cid] = 15
		end
	elseif talkState[cid] == 15 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, 2148, count[cid] * 100) then
				doPlayerAddItem(cid, 2152, count[cid])
				npcHandler:say("Here.", cid)
			else
				npcHandler:say("No, No! No think me stupid in math! <gives you an evil look>", cid)
			end
		else
			npcHandler:say("Then why you even asked! <gives you an evil look>", cid)
		end
		talkState[cid] = 0
	elseif msgcontains(msg, 'change platinum') then
		npcHandler:say("Me change {gold} or {crystal}?", cid)
		talkState[cid] = 16
	elseif talkState[cid] == 16 then
		if msgcontains(msg, 'gold') then
			npcHandler:say("How many platinum coins would you like to change into gold?", cid)
			talkState[cid] = 17
		elseif msgcontains(msg, 'crystal') then
			npcHandler:say("How many crystal coins would you like to get?", cid)
			talkState[cid] = 19
		else
			npcHandler:say("Then why you even asked! <gives you an evil look>", cid)
			talkState[cid] = 0
		end
	elseif talkState[cid] == 17 then
		if getCount(msg) == -1 or getCount(msg) == 0 then
			npcHandler:say("No, No! No think me stupid in math! <gives you an evil look>", cid)
			talkState[cid] = 0
		else
			count[cid] = getCount(msg)
			npcHandler:say("" .. count[cid] .. " platinum into " .. count[cid] * 100 .. " gold, correct?", cid)
			talkState[cid] = 18
		end
	elseif talkState[cid] == 18 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, 2152, count[cid]) then
				npcHandler:say("Here.", cid)
				doPlayerAddItem(cid, 2148, count[cid] * 100)
			else
				npcHandler:say("No, No! No think me stupid in math! <gives you an evil look>", cid)
			end
		else
			npcHandler:say("Then why you even asked! <gives you an evil look>", cid)
		end
		talkState[cid] = 0
	elseif talkState[cid] == 19 then
		if getCount(msg) == -1 or getCount(msg) == 0 then
			npcHandler:say("Then why you even asked! <gives you an evil look>", cid)
			talkState[cid] = 0
		else
			count[cid] = getCount(msg)
			npcHandler:say("" .. count[cid] * 100 .. " platinum into " .. count[cid] .. " crystal, correct?", cid)
			talkState[cid] = 20
		end
	elseif talkState[cid] == 20 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, 2152, count[cid] * 100) then
				npcHandler:say("Here you are.", cid)
				doPlayerAddItem(cid, 2160, count[cid])
			else
				npcHandler:say("No, No! No think me stupid in math! <gives you an evil look>", cid)
			end
		else
			npcHandler:say("Then why you even asked! <gives you an evil look>", cid)
		end
		talkState[cid] = 0
	elseif msgcontains(msg, 'change crystal') then
		npcHandler:say("How many crystal coins would you like to change into platinum?", cid)
		talkState[cid] = 21
	elseif talkState[cid] == 21 then
		if getCount(msg) == -1 or getCount(msg) == 0 then
			npcHandler:say("Then why you even asked! <gives you an evil look>", cid)
			talkState[cid] = 0
		else
			count[cid] = getCount(msg)
			npcHandler:say("" .. count[cid] .. " crystal into " .. count[cid] * 100 .. " platinum, correct?", cid)
			talkState[cid] = 22
		end
	elseif talkState[cid] == 22 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, 2160, count[cid])  then
				npcHandler:say("Here you are.", cid)
				doPlayerAddItem(cid, 2152, count[cid] * 100)
			else
				npcHandler:say("No, No! No think me stupid in math! <gives you an evil look>", cid)
			end
		else
			npcHandler:say("Then why you even asked! <gives you an evil look>", cid)
		end
		talkState[cid] = 0
	elseif msgcontains(msg, 'change') then
		npcHandler:say("Different coin types, gold, platinum, crystal. 100 equeals 1 next value. To change tell change with value.", cid)
		talkState[cid] = 0
	end

	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
