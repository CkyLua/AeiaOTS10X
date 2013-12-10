local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local voc = {}

function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid


         if(msgcontains(msg, 'swieta woda') or msgcontains(msg, 'holy water')) then
		queststatus = getPlayerStorageValue(cid,3731)
		if queststatus == -1 then
                if (getPlayerStorageValue(cid,195) == 1) then
                        selfSay('Thank you very much!, Here\'s your reward.', cid)
                        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
                        doPlayerAddExperience(cid, 25000000)
				doPlayerAddItem(cid,5741,1)
				doPlayerAddItem(cid,2505,1)
                        talkState[talkUser] = 0
				setPlayerStorageValue(cid,195,4)
				setPlayerStorageValue(cid,3731,1)
               else
                        selfSay('I need holy water from the castle to regain strength, if you bring it you will be rewarded! ({holy water})', cid)
                        talkState[talkUser] = 0
			end
			else
				selfSay('You already helped me.', cid)
                end
        end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 