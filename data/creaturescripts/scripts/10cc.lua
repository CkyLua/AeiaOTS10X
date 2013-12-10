function onAdvance(cid, type, oldlevel, newlevel)
if (oldlevel ~= newlevel and type == SKILL__LEVEL) then
if (newlevel >= 100 and getPlayerStorageValue(cid, 44563) == -1) then
doPlayerAddItem(cid, 2160, 10)
setPlayerStorageValue(cid, 44563, 1)
end
end
return true
end
