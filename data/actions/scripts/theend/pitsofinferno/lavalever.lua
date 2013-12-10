function onUse(cid, item, fromPosition, itemEx, toPosition)
	local firstTilePosition = {x=592, y=1419, z=14, stackpos=0}
	local tile1 = getThingFromPos(firstTilePosition)
	local secondTilePosition = {x=593, y=1419, z=14, stackpos=0}
	local tile2 = getThingFromPos(secondTilePosition)
	local thirdTilePosition = {x=592, y=1418, z=14, stackpos=0}
	local tile3 = getThingFromPos(thirdTilePosition)
	local fourthTilePosition = {x=593, y=1418, z=14, stackpos=0}
	local tile4 = getThingFromPos(fourthTilePosition)
	local walkable = 407
	local unwalkable = 599
	if(item.uid == 10285 and item.itemid == 1945 and tile1.itemid == unwalkable and tile2.itemid == unwalkable and tile3.itemid == unwalkable and tile4.itemid == unwalkable) then
		doTransformItem(tile1.uid, walkable)
		doTransformItem(tile2.uid, walkable)
		doTransformItem(tile3.uid, walkable)
		doTransformItem(tile4.uid, walkable)
		doTransformItem(item.uid,1946)
	elseif(item.uid == 10285 and item.itemid == 1946 and tile1.itemid == walkable and tile2.itemid == walkable and tile3.itemid == walkable and tile4.itemid == walkable) then
		doTransformItem(tile1.uid, unwalkable)
		doTransformItem(tile2.uid, unwalkable)
		doTransformItem(tile3.uid, unwalkable)
		doTransformItem(tile4.uid, unwalkable)
		doTransformItem(item.uid, 1945)
	else 
		doPlayerSendCancel(cid, "Sorry, not possible.") 
	end
	return TRUE
end