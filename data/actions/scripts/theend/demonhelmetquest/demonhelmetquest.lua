function onUse(cid, item, fromPosition, itemEx, toPosition)
	local gatePosition = {x=1170, y=981, z=11, stackpos=1}
	local getGate = getThingFromPos(gatePosition)
	if(item.uid == 10000) then
		if(item.itemid == 1945 and getGate.itemid == 1355) then
			doRemoveItem(getGate.uid, 1)
			doTransformItem(item.uid, item.itemid+1)
		elseif(item.itemid == 1946 and getGate.itemid == 0) then
			doCreateItem(1355, 1, gatePosition)
			doTransformItem(item.uid, item.itemid-1)
		else
			doPlayerSendCancel(cid, "Sorry not possible.")
		end
	end
	return TRUE
end