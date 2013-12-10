local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local item1 = 12668
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'task')) then
selfSay('I have a few tasks for you, complete them and you get a reward (task 1, task 2, task 3.)', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'task 1')) then
selfSay('The basement of the castle has been invaded by sea sepents, kill the serpent king and bring me the {swamp leaf}.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'swamp leaf') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,160) > 0) then
selfSay('You already completed this task.', cid)
else
if(doPlayerRemoveItem(cid, item1, 1) == TRUE) then
setPlayerStorageValue(cid,160,1)
doPlayerAddExperience(cid,50000)
selfSay('Thank you very much for this leaf.', cid)
else
selfSay('You dont have what I asked for...', cid)
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'task 2')) then
selfSay('Kill 20 of those crazy followers by the temple ({I killed them}). ', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'I killed them') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,160) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,161) > 0) then
selfSay('You already completed this task.', cid)
else
if (getPlayerStorageValue(cid,35297) > 19) then
setPlayerStorageValue(cid,161,1)
doPlayerAddExperience(cid,150000)
doPlayerAddItem(cid, 2492, 1)
selfSay('Gereat!', cid)
else
selfSay('You have not killed them yet.', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'task 3')) then
selfSay('Kill {10 archangels}... ', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, '10 archangels') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,161) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,162) > 0) then
selfSay('You already completed this task.', cid)
else
if (getPlayerStorageValue(cid,35095) > 9) then
setPlayerStorageValue(cid,162,1)
doPlayerAddExperience(cid,500000)
doPlayerAddItem(cid, 11414, 1)
selfSay('You have done well, here\'s your reward, as promised.', cid)
else
selfSay('Did you kill them?', cid)
end
end
end
return true
end
---------------------------------------------------------
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  