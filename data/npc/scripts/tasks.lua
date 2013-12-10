local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
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
selfSay('I have thee tasks for you. (task 1, task 2, task 3.)', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'task 1')) then
selfSay('For now soething simple, kill {25 rotworms}.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, '25 rotworms') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,360) > 0) then
selfSay('You already completed this task.', cid)
else
if (getPlayerStorageValue(cid,35003) > 24) then
setPlayerStorageValue(cid,360,1)
doPlayerAddExperience(cid,120000)
doPlayerAddItem(cid, 2160, 2)
selfSay('Thanks!', cid)
else
selfSay('You did not do as I asked...', cid)
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'task 2')) then
selfSay('Something a tad harder now, kill {20 dragons}. ', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, '20 dragons') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,360) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,361) > 0) then
selfSay('You already completed this task.', cid)
else
if (getPlayerStorageValue(cid,35004) > 19) then
setPlayerStorageValue(cid,361,1)
doPlayerAddExperience(cid,200000)
doPlayerAddItem(cid, 2160, 5)
selfSay('Good work!!!', cid)
else
selfSay('You did not do as I asked...', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'task 3')) then
selfSay('Kill {25 dragon lords}... ', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, '25 dragon lords') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,361) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,362) > 0) then
selfSay('You already completed this task.', cid)
else
if (getPlayerStorageValue(cid,35005) > 9) then
setPlayerStorageValue(cid,362,1)
doPlayerAddExperience(cid,300000)
doPlayerAddItem(cid, 2160, 5)
selfSay('Thanks!', cid)
else
selfSay('You did not do as I asked...', cid)
end
end
end
return true
end
---------------------------------------------------------
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  