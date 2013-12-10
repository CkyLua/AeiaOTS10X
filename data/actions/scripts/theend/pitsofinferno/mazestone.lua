function onUse(cid, item, fromPosition, itemEx, toPosition)
local stonePosition = {x=908, y=1266, z=8, stackpos=1}
local getstone = getThingfromPos(stonePosition)
	if(item.uid == 10286 and item.itemid == 1945 and getstone.itemid == 1304) then
		doRemoveItem(getstone.uid, 1)
		doTransformItem(item.uid, item.itemid+1)
	elseif(item.uid == 10286 and item.itemid == 1946 and getstone.itemid == 0) then
		doCreateItem(1304, 1, stonePosition)
		doTransformItem(item.uid, item.itemid-1)
	else
		doPlayerSendCancel(cid, "Sorry not possible.")
	end
return TRUE
end