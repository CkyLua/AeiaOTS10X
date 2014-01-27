local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local random_texts = {'Look at \'em sea serpents.', 'Watch out for the cult guys.', 'What is so interesting about this place anyway?', 'Someone spotted three headed dragons out there.'}
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
		"Speak", 
		"Ready to go?",
		"Do you want to go {back}?"
	}
	npcHandler:setMessage(MESSAGE_GREET, msg[math.random(1, #msg)])
	talkState[talkUser] = 0
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())