local specialQuests = { [2001] = 30015, [2002] = 7248, [2003] = 50090, [2004] = 42361, [2005] = 42371, [2006] = 42381}
local questsExperience = { [30015] = 100000, [7248] = 150000 }

function onUse(cid, item, fromPosition, itemEx, toPosition)
local storage = specialQuests[item.actionid]
if(not storage) then
storage = item.uid
if(storage > 65535) then
return false
end
end

if(getPlayerStorageValue(cid, storage) > 0) then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The " .. getItemName(item.itemid) .. " is empty.")
return true
end

local items = {}
local reward = 0

local size = isContainer(item.uid) and getContainerSize(item.uid) or 0
if(size == 0) then
reward = doCopyItem(item, false)
else
for i = 0, size do
local tmp = getContainerItem(item.uid, i)
if(tmp.itemid > 0) then
table.insert(items, tmp)
end
end
end

size = table.maxn(items)
if(size == 1) then
reward = doCopyItem(items[1], true)
end

local result = ""
if(reward ~= 0) then
local ret = getItemDescriptions(reward.itemid)
if(reward.type > 1 and isItemRune(reward.itemid)) then
result = reward.type .. " charges " .. ret.name
elseif(reward.type > 1 and isItemStackable(reward.itemid)) then
result = reward.type .. " " .. ret.plural
else
result = ret.article .. " " .. ret.name
end
else
if(size > 20) then
reward = doCopyItem(item, false)
elseif(size > 8) then
reward = getThing(doCreateItemEx(1988, 1))
else
reward = getThing(doCreateItemEx(1987, 1))
end

for i = 1, size do
local tmp = doCopyItem(items, true)
if(doAddContainerItemEx(reward.uid, tmp.uid) ~= RETURNVALUE_NOERROR) then
print("[Warning] QuestSystem:", "Could not add quest reward")
else
local ret = ", "
if(i == 2) then
ret = " and "
elseif(i == 1) then
ret = ""
end

result = result .. ret
ret = getItemDescriptions(tmp.itemid)
if(tmp.type > 1 and isItemRune(tmp.itemid)) then
result = result .. tmp.type .. " charges " .. ret.name
elseif(tmp.type > 1 and isItemStackable(tmp.itemid)) then
result = result .. tmp.type .. " " .. ret.plural
else
result = result .. ret.article .. " " .. ret.name
end
end
end
end

if(doPlayerAddItemEx(cid, reward.uid, false) ~= RETURNVALUE_NOERROR) then
if getPlayerFreeCap(cid) < getItemWeightByUID(reward.uid) then
result = "You have found " .. result .. " weighing " .. string.format("%.2f", getItemWeightByUID(reward.uid)) .. " oz. You have no capacity."
else
result = "You have found " .. result .. ", but you have no room to take it."
end
else
result = "You have found " .. result .. "."
setPlayerStorageValue(cid, storage, 1)
if(questsExperience[storage] ~= nil) then
doPlayerAddExpEx(cid, questsExperience[storage])
end
end

doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, result)
return true
end