local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local item1 = 11413
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'help')) then
selfSay('Fffchh! Are you are looking to go to hell? After a proper job, maybe I\'ll let you in ... ({task})', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'task')) then
selfSay('Your task is to kill 75 of these cursed creatures, which are archangels .. after killing them come back to me. ({75 archangels})', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, '75 archangels') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,140) > 0) then
selfSay('You already completed this task.', cid)
else
if (getPlayerStorageValue(cid,35095) > 74) then
setPlayerStorageValue(cid,140,1)
doPlayerAddExperience(cid,1200000)
selfSay('Fchh! From now on, you can use the teleport leading to hell...', cid)
else
selfSay('Did you kill the {75 archangels}?', cid)
end
end
return true
end
---------------------------------------------------------
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  

