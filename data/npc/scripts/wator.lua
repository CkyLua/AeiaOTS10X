local focuses = {}
local function isFocused(cid)
for i, v in pairs(focuses) do
if(v == cid) then
return true
end
end
return false
end
local function addFocus(cid)
if(not isFocused(cid)) then
table.insert(focuses, cid)
end
end
local function removeFocus(cid)
for i, v in pairs(focuses) do
if(v == cid) then
table.remove(focuses, i)
break
end
end
end
local function lookAtFocus()
for i, v in pairs(focuses) do
if(isPlayer(v) == TRUE) then
doNpcSetCreatureFocus(v)
return
end
end
doNpcSetCreatureFocus(0)
end
function onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
if(isFocused(cid)) then
selfSay("Hmph!")
focus = 0
if(isPlayer(cid) == TRUE) then --Be sure he's online
closeShopWindow(cid)
end
end
end
function onCreatureSay(cid, type, msg)
queststatus = getPlayerStorageValue(cid,4701)
if((msg == "hi") or (msg == "Hi") and not (isFocused(cid))) then
selfSay("I am here only catch fish...", cid)
addFocus(cid)
elseif((isFocused(cid)) and (msg == "see you" or msg == "cya" or msg == "bye")) then
selfSay("BYE!!!", cid, TRUE)
closeShopWindow(cid)
focus = 0
removeFocus(cid)
end
queststatus = getPlayerStorageValue(cid,4701)
if((msg == "quest") and (isFocused(cid)) and (queststatus == -1)) then
selfSay("I do not have any jobs for you.", cid)
end
queststatus = getPlayerStorageValue(cid,4701)
if((msg == "I killed wator") and (isFocused(cid))(queststatus == 1)) then
selfSay("Contrast! Maybe have failed this noble task!", cid)
selfSay("OH! Here have this as a reward!", cid)--nagrode sami sobie dodacie
doPlayerAddItem(cid,2523,1)
setPlayerStorageValue(cid,4701,2)
end
end
function onPlayerCloseChannel(cid)
if(isFocused(cid)) then
selfSay("Hmph!")
closeShopWindow(cid)
focus = 0
end
end
function onPlayerEndTrade(cid)
selfSay("It was a pleasure doing business with you.", cid)
end
function onThink()
for i, focus in pairs(focuses) do
if(isCreature(focus) == FALSE) then
removeFocus(focus)
else
local distance = getDistanceTo(focus) or -1
if((distance > 4) or (distance == -1)) then
selfSay("Hmph!")
closeShopWindow(focus)
removeFocus(focus)
end
end
end
lookAtFocus()
end