------STORAGE-------
------100 do 104-------
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local item1 = 2666
local item2 = 2152
local item3 = 2667
local item4 = 2476
local item5 = 2386
local item7 = 7591
local item9 = 2472
local item10 = 6548
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'tasks')) then
selfSay('Well, you\'ve decided to help me, I have a few tasks for you, after you will get a reward. (to start missions {JOB1} enter one by one, {JOB2} ..)', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'job1')) then
selfSay('Bring me 10 pieces of {meat}.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'meat') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,100) > 0) then
selfSay('You already helped me with this.', cid)
else
if(doPlayerRemoveItem(cid, item1, 10) == TRUE) then
setPlayerStorageValue(cid,100,1)
doPlayerAddExp(cid,5000)
selfSay('Thank you very much for that meat.', cid)
else
selfSay('I need 10 pieces of meat..', cid)
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'job2')) then
selfSay('Bring me 50 platinum {coins}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'coins') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,100) < 1) then
selfSay('First, bring me 10 pieces of meat.', cid)
else
if (getPlayerStorageValue(cid,101) > 0) then
selfSay('You already helped me with this.', cid)
else
if(doPlayerRemoveItem(cid, item2, 5) == TRUE) then
setPlayerStorageValue(cid,101,1)
doPlayerAddExp(cid,7000)
selfSay('Thanks for the money.', cid)
else
selfSay('You dont have the money...', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'job3')) then
selfSay('I will need some 15 fish.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'fish') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,101) < 1) then
selfSay('First, bring me 10 pieces of meat and 50 platinum coins.', cid)
else
if (getPlayerStorageValue(cid,102) > 0) then
selfSay('You already helped me with this.', cid)
else
if(doPlayerRemoveItem(cid, item3, 15) == TRUE) then
setPlayerStorageValue(cid,102,1)
doPlayerAddExp(cid,10000)
selfSay('Thanks!', cid)
else
selfSay('You dont have 15 fish..', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'job4')) then
selfSay('Bring me {knight armor} please,I cant travle with out it...', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'knight armor') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,102) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,103) > 0) then
selfSay('You already helped me with this.', cid)
else
if(doPlayerRemoveItem(cid, item4, 1) == TRUE) then
setPlayerStorageValue(cid,103,1)
doPlayerAddExp(cid,20000)
selfSay('Thanks for the armor.)', cid)
else
selfSay('You dont have what I asked for...', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'job5')) then
selfSay('I need an {axe} to cut wood. ', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'axe') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,103) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,104) > 0) then
selfSay('You already helped me with this.', cid)
else
if(doPlayerRemoveItem(cid, item5, 1) == TRUE) then
setPlayerStorageValue(cid,104,1)
doPlayerAddExp(cid,30000)
doPlayerAddItem(cid, 2466, 1)
doPlayerAddItem(cid, 5462, 1)
selfSay('Oh thank you very much. Ready for more?', cid)
else
selfSay('You dont have the axe...', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'job6')) then
selfSay('Kill {30 dragons} and come back to me. ', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, '30 dragons') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,104) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,105) > 0) then
selfSay('You already helped me with this.', cid)
else
if (getPlayerStorageValue(cid,35004) > 29) then
setPlayerStorageValue(cid,105,1)
doPlayerAddExp(cid,50000)
doPlayerAddItem(cid, 2492, 1)
selfSay('Thanks!', cid)
else
selfSay('You did not kill 30 dragons...', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'job7')) then
selfSay('I need something to heal myself, bring me a {great health potion}...', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'great health potion') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,105) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,106) > 0) then
selfSay('You already helped me with this.', cid)
else
if(doPlayerRemoveItem(cid, item7, 1) == TRUE) then
setPlayerStorageValue(cid,106,1)
doPlayerAddExp(cid,80000)
doPlayerAddItem(cid, 2160, 5)
selfSay('Thank you, this really comes in handy ;].', cid)
else
selfSay('So where is it?', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'job8')) then
selfSay('Now something more difficult. Kill {10 demons} and come back for the reward. ', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, '10 demons') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,106) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,107) > 0) then
selfSay('You already helped me with this.', cid)
else
if (getPlayerStorageValue(cid,35006) > 9) then
setPlayerStorageValue(cid,107,1)
doPlayerAddExp(cid,100000)
selfSay('Thanks!.', cid)
else
selfSay('You have not killed {10 demons}...', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'job9')) then
selfSay('Try to get me some magic plate armor ({MPA})...', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'MPA') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,107) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,108) > 0) then
selfSay('You already helped me with this.', cid)
else
if(doPlayerRemoveItem(cid, item9, 1) == TRUE) then
setPlayerStorageValue(cid,108,1)
doPlayerAddExp(cid,200000)
doPlayerAddItem(cid, 2160, 10)
selfSay('Wow this is nice, thanks!', cid)
else
selfSay('Get a magic plate armor {MPA}...', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'job10')) then
selfSay('I will need some s {20 demonic stones}...', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, '20 demonic stones') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,108) < 1) then
selfSay('Follow my previous instructions...', cid)
else
if (getPlayerStorageValue(cid,109) > 0) then
selfSay('You already helped me with this.', cid)
else
if(doPlayerRemoveItem(cid, item10, 20) == TRUE) then
setPlayerStorageValue(cid,109,1)
doPlayerAddExp(cid,300000)
doPlayerAddItem(cid, 2160, 15)
selfSay('Fantastic!', cid)
else
selfSay('You dont have {20 demonic stones}...', cid)
end
end
end
return true
end
----------------------------------------------------------

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  
