function onUse(cid, item, fromPosition, itemEx, toPosition)
	local gatePosition = {x=917, y=1252, z=10}
	local getgate = getThingFromPos(gatePosition)
	local bridge = 1284
	local lava = 598
	if(item.uid == 10254) then
		if(item.itemid == 1945) then
			doTransformItem(getgate.uid, bridge)
			doTransformItem(item.uid, item.itemid+1)
		elseif(item.itemid == 1946) then
			doTransformItem(getgate.uid, lava)
			doTransformItem(item.uid, item.itemid-1)
		else
			doPlayerSendCancel(cid,"Sorry not possible.")
		end
	end
	return TRUE
end