local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local random_texts = {'I always knew that being captain will be bad choice.', 'Don\'t touch everything you see!', 'I am ruined, go away!', 'What are you looking at?'}
local random_texts_chance = 40 -- percent
local random_texts_interval = 5 -- seconds
local talkState = {}
random_word_fth = 0

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()
	if(random_word_fth < os.time()) then
		random_word_fth = (os.time() + random_texts_interval)
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
		"What... do... you... WANT?!", 
		"Nothing to see here, " .. getPlayerName(cid) .. ". Entire sea is closed for us, go away.", 
		"Can you leave me alone? I am packing my things.", 
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