local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local random_texts = {'Welcome to my favourite roof.', 'Come closer and enjoy view with me.', 'Feeling lost? Maybe a view from above helps.', 'Praise our magic. It saved us many times.'}
local random_texts_chance = 40 -- percent
local random_texts_interval = 5 -- seconds
local talkState = {}
local function round(num, idp)
    local mult = 10^(idp or 0)
    if num >= 0 then return math.floor(num * mult + 0.5) / mult
    else return math.ceil(num * mult - 0.5) / mult end
end
random_word_princess = 0

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()
	if(random_word_princess < os.time()) then
		random_word_princess = (os.time() + random_texts_interval)
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
		"Be greeted, my subject.", 
		"I'm glad to see you, " .. getPlayerName(cid) .. ".", 
		"Welcome, " .. getPlayerName(cid) .. ".", 
		"Hello, " .. getPlayerName(cid) .. ". What brings you here?", 
		"Come closer, " .. getPlayerName(cid) .. "."
	}
	npcHandler:setMessage(MESSAGE_GREET, msg[math.random(1, #msg)])
	talkState[talkUser] = 0
	return true
end

local node1 = keywordHandler:addKeyword({'promot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you to royal status as a reward for donating 20000 gold pieces to Enigma Kingdom finances. Did you brought money with you?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, level = 20, promotion = 1, text = 'Welcome to Enigma elite. Don\'t abuse your status, we\'re something more than leaders.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright, come back when change your mind.', reset = true})
local node2 = keywordHandler:addKeyword({'stat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you to royal status as a reward for donating 20000 gold pieces to Enigma Kingdom finances. Did you brought money with you?'})
	node2:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, level = 20, promotion = 1, text = 'Welcome to Enigma elite. Don\'t abuse your status, we\'re something more than leaders.'})
	node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright, come back when change your mind.', reset = true})
--[[
local node2 = keywordHandler:addKeyword({'epic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can epicize you for 200000 gold coins. Do you want me to epicize you?'})
	node2:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 200000, level = 120, promotion = 2, text = 'Congratulations! You are now epicized.'})
	node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})
]]--
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, 'map') or msgcontains(msg, 'mark')) then
	selfSay('Come to railing. I will show you all building from here. Do you see them?', cid)
	talkState[talkUser] = 1
	end
	if msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		local marks = {
		{mark = 5, pos = {x = 256, y = 256, z = 7}, desc = "Enigma City Temple"},
		{mark = 10, pos = {x = 287, y = 254, z = 7}, desc = "Depot with bank"},
		{mark = 13, pos = {x = 303, y = 247, z = 7}, desc = "Food store"},
		{mark = 8, pos = {x = 278, y = 236, z = 7}, desc = "Smithery"},
		{mark = 8, pos = {x = 271, y = 226, z = 7}, desc = "Distance weapons shop"},
		{mark = 13, pos = {x = 268, y = 241, z = 7}, desc = "Jewellery, magic shop and music instruments shop"},
		{mark = 13, pos = {x = 303, y = 247, z = 7}, desc = "Food store and magic shop"},
		{mark = 7, pos = {x = 252, y = 242, z = 7}, desc = "Tools and furniture"},
		{mark = 13, pos = {x = 258, y = 237, z = 7}, desc = "Creature products and fashion"},
		{mark = 9, pos = {x = 234, y = 215, z = 7}, desc = "Boat"},
	}
	local f_addMark = doPlayerAddMapMark
	if(not f_addMark) then f_addMark = doAddMapMark end
	for _, m  in pairs(marks) do
		f_addMark(cid, m.pos, m.mark, m.desc ~= nil and m.desc or "")
	end
	selfSay('Here you are.', cid)
	talkState[talkUser] = 0
	end
	if (msgcontains(msg, "no") and talkState[talkUser] == 1) or (msgcontains(msg, "no") and talkState[talkUser] == 9) then
	selfSay('May God guide your path then.', cid)
	talkState[talkUser] = 0
	end
	if msgcontains(msg, "heal") then
		if getCreatureCondition(cid, CONDITION_FIRE) == TRUE then
			npcHandler:say("You are burning. I will use water on you.", cid)
			doRemoveCondition(cid, CONDITION_FIRE)
			doSendMagicEffect(getCreaturePosition(cid), 14)
		elseif getCreatureCondition(cid, CONDITION_POISON) == TRUE then
			npcHandler:say("You are poisoned. I will cure you.", cid)
			doRemoveCondition(cid, CONDITION_POISON)
			doSendMagicEffect(getCreaturePosition(cid), 13)
		elseif getCreatureCondition(cid, CONDITION_ENERGY) == TRUE then
			npcHandler:say("You are electrificed. I will help you.", cid)
			doRemoveCondition(cid, CONDITION_ENERGY)
			doSendMagicEffect(getCreaturePosition(cid), 12)
		elseif getCreatureCondition(cid, CONDITION_PARALYZE) == TRUE then
			npcHandler:say("You are paralyzed. I will cure you.", cid)
			doRemoveCondition(cid, CONDITION_PARALYZE)
			doSendMagicEffect(getCreaturePosition(cid), 14)
		elseif getCreatureCondition(cid, CONDITION_DROWN) == TRUE then
			npcHandler:say("You are drowing. I will help you.", cid)
			doRemoveCondition(cid, CONDITION_DROWN)
			doSendMagicEffect(getCreaturePosition(cid), 12)
		elseif getCreatureCondition(cid, CONDITION_FREEZING) == TRUE then
			npcHandler:say("You are cold! I will burn you.", cid)
			doRemoveCondition(cid, CONDITION_FREEZING)
			doSendMagicEffect(getCreaturePosition(cid), 15)

		elseif getCreatureCondition(cid, CONDITION_DAZZLED) == TRUE then
			npcHandler:say("You are dazzled! Do not mess with holy creatures anymore!", cid)
			doRemoveCondition(cid, CONDITION_DAZZLED)
			doSendMagicEffect(getCreaturePosition(cid), 47)
		elseif getCreatureCondition(cid, CONDITION_CURSED) == TRUE then
			npcHandler:say("You are cursed! I will remove it.", cid)
			doRemoveCondition(cid, CONDITION_CURSED)
			doSendMagicEffect(getCreaturePosition(cid), 47)
		elseif getCreatureHealth(cid) < 65 then
			npcHandler:say("You are looking really bad. Let me heal your wounds.", cid)
			doCreatureAddHealth(cid, 65 - getCreatureHealth(cid))
			doSendMagicEffect(getCreaturePosition(cid), 12)
		elseif getCreatureHealth(cid) < 2000 then
			npcHandler:say("I did my best to fix your wounds.", cid)
			doCreatureAddHealth(cid, 2000 - getCreatureHealth(cid))
			doSendMagicEffect(getCreaturePosition(cid), 12)
		else
			local msgheal = {
				"You aren't looking really bad, " .. getCreatureName(cid) .. ". I only help in cases of real emergencies. Raise your health simply by eating {food}.", 
				"Come on, just tell me if you need something. Don't be shy due to my social rank and guardians.", 
				"Your health is in good state, child.", 
				"If you are sick find a medic.", 
				"I have bigger problems than your scratched armor."
			}
			npcHandler:say("" .. msgheal[math.random(1, #msgheal)] .. "", cid)
		end
	end
	if(msgcontains(msg, 'white') and msgcontains(msg, 'magic')) then
	selfSay('This book is very helpful sometimes.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'expert') and msgcontains(msg, 'spell')) then
	selfSay('You don\'t appear very skilled. Try easier spells first.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'stationary') and msgcontains(msg, 'shield')) then
	selfSay('Do you see that huge hive? This spell may protect us from them one day.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'age') and msgcontains(msg, 'spell')) then
	selfSay('I don\'t cast it upon requests! Everyone deserves a justice. I\'m not going to cast it on you!', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'soft') and msgcontains(msg, 'wings')) then
	selfSay('That such waste of magic power! Last time {Alice} cast it its user, she fell to water due to ignoring our warnings. We are more careful now.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'lightbringer')) then
	selfSay('They are very rare creatures. My father had one, but someone has stolen it.', cid)
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
