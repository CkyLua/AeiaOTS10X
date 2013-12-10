function onUse(cid, item, fromPosition, itemEx, toPosition)
local gatePosition = {x=883, y=1220, z=10, stackpos=1}
local getgate = getThingfromPos(gatePosition)
	if(item.uid == 10287 or item.uid == 10257 and item.itemid == 1945 and getgate.itemid == 1304) then
		doRemoveItem(getgate.uid, 1)
		doTransformItem(item.uid, item.itemid+1)
	elseif item.itemid == 1946 then
		doTransformItem(item.uid, item.itemid-1)
	else
		doPlayerSendCancel(cid, "Sorry not possible.")
	end
return TRUE
end