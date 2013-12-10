function onUse(cid, item, fromPosition, itemEx, toPosition)
	local firstWall = {x=1251, y=893, z=5, stackpos=1}
	local secondWall = {x=1252, y=893, z=5, stackpos=1}
	local secondLever = {x=1248, y=889, z=4, stackpos=1}
	local getSecondLever = getThingfromPos(secondLever)
	local getFirstWall = getThingfromPos(firstWall)
	local getSecondWall = getThingfromPos(secondWall)
	if(item.uid == 7003) then
		if(item.itemid == 1945) then
			doTransformItem(secondLever.uid, 1946)
			doTransformItem(item.uid, 1946)
			doRemoveItem(getFirstWall.uid, 1)
			doRemoveItem(getSecondWall.uid, 1)
		elseif(item.itemid == 1946) then
			doTransformItem(secondLever.uid, 1945)
			doTransformItem(item.uid, 1945)
			doCreateItem(1052, 1, firstWall)
			doCreateItem(1052, 1, secondWall)		
		else
			doPlayerSendCancel(cid,"Sorry, not possible.")
		end
	end
	return TRUE
end