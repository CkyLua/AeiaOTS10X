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

        local eventName = ""
        local ticket = 0
        local pos = {x=0, y=0, z=0}
        if getPlayerLevel(cid) > 100 then
                eventName = "demon castle"
                pos = {x=1049, y=1408, z=11} --Pozycja zamku
                ticket = 12661 --ID demon castle ticketu
        end


        if(msgcontains(msg, 'enter') or msgcontains(msg, 'event')) then

                if getPlayerLevel(cid) < 100 then
                        selfSay('You must have a level of 100 or greater to enter the Demon Castle.', cid)
                        talkState[talkUser] = 1
                end

                if getPlayerEventType(cid) == 1 then
                        selfSay('Do you have a ticket to the Demon Castle?', cid)
                        talkState[talkUser] = 1
                else
                        selfSay('You can not enter the Demon Castle now.', cid)
                        talkState[talkUser] = 0
                end
        elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
                if getPlayerEventType(cid) == 1 then
                        if getPlayerLevel(cid) > 19 then
                                if getPlayerItemCount(cid, ticket) > 0 then
                                        selfSay('Good luck.', cid)
                                        doTeleportThing(cid, pos)
                                        talkState[talkUser] = 0
                                else
                                        selfSay('You dont have a ticket for the Demon Castle.', cid)
                                        talkState[talkUser] = 0
                                end
                        else
                                selfSay('You must have a level of 100 or greater to enter the Demon Castle.', cid)
                                talkState[talkUser] = 0
                        end
                else
                        selfSay('You cannot enter the demon castle.', cid)
                        talkState[talkUser] = 0
                end
                return TRUE
        end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 