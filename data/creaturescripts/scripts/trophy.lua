function onAdvance(cid, type, oldlevel, newlevel)
	if (oldlevel ~= newlevel and type == SKILL__LEVEL) then
		if (newlevel >= 1500 and getPlayerStorageValue(cid, 44578) == -1) then
			doPlayerAddItem(cid, 10127, 1)
			setPlayerStorageValue(cid, 44578, 1)
		end
	end
return true
end