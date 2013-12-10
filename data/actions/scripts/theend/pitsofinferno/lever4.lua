function onUse(cid, item, fromPosition, itemEx, toPosition)
local gatePosition = {x=893, y=1280, z=10, stackpos=1}
local getgate = getThingfromPos(gatePosition)
	if(item.uid == 10207 and item.itemid == 1945 and getgate.itemid == 6289) then
		doRemoveItem(getgate.uid,1)
		doTransformItem(item.uid,item.itemid+1)
	elseif(item.uid == 10207 and item.itemid == 1946 and getgate.itemid == 0) then
		doCreateItem(6289,1,gatePosition)
		doTransformItem(item.uid,item.itemid-1)
	else
		doPlayerSendCancel(cid,"Sorry not possible.")
	end
return TRUE
end