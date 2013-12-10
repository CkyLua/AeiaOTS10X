function onUse(cid, item, frompos, item2, topos)
local gatePosition = {x=915, y=1273, z=10, stackpos=1}
local getgate = getThingfromPos(gatePosition)
	if(item.uid == 10256 and item.itemid == 1945 and getgate.itemid == 1304) then
		doRemoveItem(getgate.uid, 1)
		doTransformItem(item.uid, item.itemid+1)
	elseif(item.uid == 10256 and item.itemid == 1946 and getgate.itemid == 0) then
		doCreateItem(1304, 1, gatePosition)
		doTransformItem(item.uid, item.itemid-1)
	else
		doPlayerSendCancel(cid, "Sorry not possible.")
	end
return TRUE
end