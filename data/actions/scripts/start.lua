function onUse(cid, item, frompos, item2, topos)
	if item.uid == 1750 then
		doPlayerAddItem(cid,2160,1)
		doPlayerAddExp(uid,4200)
	else
		return 0
	end
return 1
end