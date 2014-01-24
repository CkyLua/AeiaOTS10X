local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local random_texts = {'Just feel that wind.', 'What a sunny day to slain some sea creatures!', 'I hope that lizards didn\'t see us.'}
local random_texts_chance = 10 -- percent
local random_texts_interval = 5 -- seconds
local talkState = {}
random_word_fths = 0

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()
	if(random_word_fths < os.time()) then
		random_word_fths = (os.time() + random_texts_interval)
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
		"The water is cold a bit, but should be good for you.", 
		"So, " .. getPlayerName(cid) .. " are you ready to dive?", 
		"I hope that lizards didn\'t see us.", 
		"Welcome.", 
		"I hope at least you have better day than me."
	}
	npcHandler:setMessage(MESSAGE_GREET, msg[math.random(1, #msg)])
	talkState[talkUser] = 0
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())