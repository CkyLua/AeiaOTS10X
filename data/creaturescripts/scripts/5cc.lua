function onAdvance(cid, type, oldlevel, newlevel)
if (oldlevel ~= newlevel and type == SKILL__LEVEL) then
if (newlevel >= 50 and getPlayerStorageValue(cid, 44562) == -1) then
doPlayerAddItem(cid, 2160, 5)
setPlayerStorageValue(cid, 44562, 1)
end
end
return true
end