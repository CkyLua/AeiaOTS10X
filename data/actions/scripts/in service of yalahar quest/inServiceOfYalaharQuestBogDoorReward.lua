function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3079) then
		if(getPlayerStorageValue(cid, 25) == 1 and getPlayerStorageValue(cid, 24) == 1 and getPlayerStorageValue(cid, 23) == 1) then
			if(item.itemid == 1257) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1258)
			end
		end
	end
	return true
end