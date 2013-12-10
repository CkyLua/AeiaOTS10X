function onUse(cid, item, frompos, item2, topos)
-- <begin> Alreth's mana runes ---------------------------------
-- Title: Advanced mana runes
-- Author: Alreth (emil@janesten.com)
-- Tibia: 7.5 (update variables smallruneid and bigruneid for newer version compability)
-- Script: 1.25, 2006-06-29 00:15
-- Description: Two types of manarunes, normal and big, with nice effects. You can easily
-- set how much mana each give. The mana given is stored in an storagevalue
-- and if a GM uses the rune on a player, he will see the total mana the player
-- has gotten from the mana runes.

-- SETTINGS --
minMana = 1200 -- Enter minimum mana possible to gain
maxMana = 39000 -- Enter maximum mana possible to gain
bigmana = 3 -- Enter bigmana multiplier for big mana rune (how many times more mana does bigmana rune give compared to normal)
storevalue = 1000 -- Enter the data key that will be used for exhaustion (has to be a unique value that isn't already used in quests or other scripts)
exhaustion = 0 -- Enter the time in seconds that character is exhausted for
smallruneid = 2300 -- Itemid of the normal mana rune
bigruneid = 2300 -- Itemid of the big mana rune
storetotal = 444 -- Enter the data key where total mana recieved is stored in
gmaccess = 1 -- Enter the lowest accesslevel that an GM can have (gm = char that do not use mana for spells, usually invincible)
-- END OF SETTINGS --

if (item.itemid == smallruneid) then
-- Normal mana rune (with my settings: 80-120 mana, 100 on average)
exhast = exhaust(cid, storevalue, exhaustion)
if (exhast == 0) then
doPlayerSendCancel(cid, "You are exhausted.")
else
if (getPlayerAccess(item2.uid) < gmaccess) then

-- Decrease charges - remove if 0
if (item.type > 1) then
doChangeTypeItem(item.uid, item.type-1)
elseif (getPlayerAccess(cid) < gmaccess) then
doRemoveItem(item.uid, 1)
end

mana = math.random(minMana, maxMana)
if (topos.x ~= getPlayerPosition(cid).x or topos.y ~= getPlayerPosition(cid).y or topos.z ~= getPlayerPosition(cid).z) then
doPlayerSendTextMessage(item2.uid, 20, getPlayerName(cid).." gave you "..mana.." mana.")
doSendMagicEffect(topos, 14)

doPlayerSendTextMessage(cid, 20, "You gave "..getPlayerName(item2.uid).." "..mana.." mana.")
doSendMagicEffect(getPlayerPosition(cid), 12)

storemana = getPlayerStorageValue(item2.uid, 444) + mana
setPlayerStorageValue(item2.uid, 444, storemana)
else
doPlayerSendTextMessage(item2.uid, 20, "You recieved "..mana.." mana.")
doSendMagicEffect(topos, 14)

storemana = getPlayerStorageValue(cid, 444) + mana
setPlayerStorageValue(cid, 444, storemana)
end

if (getPlayerAccess(cid) >= gmaccess) then
doPlayerSendTextMessage(cid, 16, getPlayerName(item2.uid).." has gotten "..getPlayerStorageValue(item2.uid, 444).." mana from mana runes.")
end

doPlayerAddMana(item2.uid, mana)
else
doPlayerSendCancel(cid, "You can only use this rune on players.")
end
end
return 1

elseif (item.itemid == bigruneid) then
-- Normal mana rune (with my settings: 240-360 mana, 300 on average)

exhast = exhaust(cid, storevalue, exhaustion)
if (exhast == 0) then
doPlayerSendCancel(cid, "You are exhausted.")
else
if (getPlayerAccess(item2.uid) < gmaccess) then
-- Decrease charges - remove if 0
if (item.type > 1) then
doChangeTypeItem(item.uid, item.type-1)
elseif (getPlayerAccess(cid) < gmaccess) then
doRemoveItem(item.uid, 1)
end

mana = math.random(minMana*bigmana, maxMana*bigmana)
if (topos.x ~= getPlayerPosition(cid).x or topos.y ~= getPlayerPosition(cid).y or topos.z ~= getPlayerPosition(cid).z) then
doPlayerSendTextMessage(item2.uid, 20, getPlayerName(cid).." gave you "..mana.." mana.")
doSendMagicEffect(topos, 14)

doPlayerSendTextMessage(cid, 20, "You gave "..getPlayerName(item2.uid).." "..mana.." mana.")
doSendMagicEffect(getPlayerPosition(cid), 12)

storemana = getPlayerStorageValue(item2.uid, 444) + mana
setPlayerStorageValue(item2.uid, 444, storemana)
else
doPlayerSendTextMessage(item2.uid, 20, "You recieved "..mana.." mana.")
doSendMagicEffect(topos, 14)

storemana = getPlayerStorageValue(cid, 444) + mana
setPlayerStorageValue(cid, 444, storemana)
end

if (getPlayerAccess(cid) >= gmaccess) then
doPlayerSendTextMessage(cid, 16, getPlayerName(item2.uid).." has gotten "..getPlayerStorageValue(item2.uid, 444).." mana from mana runes.")
end

doPlayerAddMana(item2.uid, mana)
else
doPlayerSendCancel(cid, "You can only use this rune on players.")
end
end
return 1

else
return 0
end
end
-- <end> Alreth's mana runes ---------------------------------


-- <begin> Alreth's exhaustion function ---------------------------------
-- Title: Exhaustion function
-- Author: Alreth (emil@janesten.com)
-- Tibia: 7.5+ (update variables smallruneid and bigruneid for newer version compability)
-- Script: 1.1, 2006-06-24 01:31
-- Description: Function to add exhaustion to action scripts. Exhausted-function (v1.1) - OpenTibia Fans
-- Returns 1 if not exhausted and 0 if exhausted
-- This function can be cut out and pasted into data\actions\lib\actions.lua (will then be available from all scripts)

function exhaust(cid, storevalue, exhausttime)
newExhaust = os.time()
oldExhaust = getPlayerStorageValue(cid, storevalue)
if (oldExhaust == nil or oldExhaust < 0) then
oldExhaust = 0
end
if (exhausttime == nil or exhausttime < 0) then
exhausttime = 1
end
diffTime = os.difftime(newExhaust, oldExhaust)
if (diffTime >= exhausttime or diffTime < 0) then
setPlayerStorageValue(cid, storevalue, newExhaust)
return 1
else
return 0
end
end
-- <end> Alreth's exhaustion function ---------------------------------