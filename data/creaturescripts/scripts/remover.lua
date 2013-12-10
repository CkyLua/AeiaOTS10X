function onAdvance(cid, type, oldlevel, newlevel)
if (oldlevel ~= newlevel and type == SKILL__LEVEL) then
if (newlevel >= 500 and getPlayerStorageValue(cid, 44567) == -1) then
doPlayerAddItem(cid, 10142, 1)
doPlayerAddItem(cid, 2264, 3)
setPlayerStorageValue(cid, 44567, 1)
end
end
return true
end
