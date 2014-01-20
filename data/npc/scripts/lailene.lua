local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local random_texts = {'Perfect coats for beginners and spellbooks!', '<mumbles> This one looks interesting.', 'Anything you need - here!', 'If you are looking for a flight, head to the roof.'}
local random_texts_chance = 40 -- percent
local random_texts_interval = 5 -- seconds
random_word_lailene = 0

local talkState = {}
local function round(num, idp)
    local mult = 10^(idp or 0)
    if num >= 0 then return math.floor(num * mult + 0.5) / mult
    else return math.ceil(num * mult - 0.5) / mult end
end

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()
	if(random_word_lailene < os.time()) then
		random_word_lailene = (os.time() + random_texts_interval)
		if(math.random(1, 100) < random_texts_chance) then
			selfSay(random_texts[math.random(1, #random_texts)])
		end
	end
	npcHandler:onThink()
end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end
		function greetCallback(cid)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local msg = {
		"Be greeted.", 
		"I'm glad to see you, " .. getPlayerName(cid) .. ".", 
		"Welcome, " .. getPlayerName(cid) .. ".", 
		"Hello, " .. getPlayerName(cid) .. ". What brings you here?", 
		"Come closer, " .. getPlayerName(cid) .. "."
	}
	local mages = {1, 2, 5, 6}
	if (isInArray(mages, getPlayerVocation(cid))) then
	npcHandler:setMessage(MESSAGE_GREET, msg[math.random(1, #msg)])
	else
	npcHandler:setMessage(MESSAGE_GREET, "You don't look like a magician, not as beginner either. What do you want?")
	end
	talkState[talkUser] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if (msgcontains(msg, "no") and talkState[talkUser] == 9) then
	selfSay('May God guide your path then.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'white') and msgcontains(msg, 'magic')) then
	selfSay('I found this book interesting.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'expert') and msgcontains(msg, 'spell')) then
	selfSay('You don\'t appear very skilled. Try easier spells first.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'stationary') and msgcontains(msg, 'shield')) then
	selfSay('This spell may protect us from the hive attacks one day.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'age') and msgcontains(msg, 'spell')) then
	selfSay('This one is very hard to learn, even for me.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'soft') and msgcontains(msg, 'wings')) then
	selfSay('No, I don\'t fulfill stupid requests!', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'lightbringer')) then
	selfSay('I think royal family had one, ask princess.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'cloudwalking')) then
	local spelldur = round((getPlayerStorageValue(cid, 22444)-os.time())/3600)
		if getPlayerStorageValue(cid,22444) < os.time() then
			if getPlayerLevel(cid) > 499 and getPlayerMoney(cid) > 4999 then
			selfSay('The cloudwalking spell is simpler alternative of {soft wings} spell, but it\'s more dangerous also. You have to watch youself - if you fall from a cloud, nothing can save you. This spell lasts for three days. Do you want me to cast it on you for a small donation of 5000 gold?', cid)
			talkState[talkUser] = 9
			else
			selfSay('The cloudwalking spell is simpler alternative of {soft wings} spell, but it\'s more dangerous also. You have to watch youself - if you fall from a cloud, nothing can save you. This spell lasts for three days.', cid)
			talkState[talkUser] = 0
			end
		else
			if getPlayerLevel(cid) > 499 and getPlayerMoney(cid) > 4999 then
			if spelldur == 1 then rt = '' else rt = 's' end
			selfSay('It seems you still have ' .. spelldur .. ' hour' .. rt .. ' of spell left. Do you want to extend your spell for 5000 gold? It will work for three days from now.', cid)			talkState[talkUser] = 9
			else
			selfSay('The cloudwalking spell is simpler alternative of {soft wings} spell, but it\'s more dangerous also. You have to watch youself - if you fall from a cloud, nothing can save you. This spell lasts for three days. You have ' .. spelldur .. ' hour' .. rt .. ' of spell left.', cid)
			talkState[talkUser] = 0
			end		
		end
	end
	if msgcontains(msg, "yes") and talkState[talkUser] == 9 then
	if(doPlayerRemoveMoney(cid, 5000)) then
	doCreatureSetStorage(cid, 22444, os.time() + (86400 * 3))
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
	selfSay('So be it! I hope you know what you are doing.', cid)
	talkState[talkUser] = 0
	else
	selfSay('Come back when you decide to bring me donation for serious. I don\'t work with cheaters.', cid)
	talkState[talkUser] = 0
	end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


