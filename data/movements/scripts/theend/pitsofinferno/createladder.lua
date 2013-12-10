function onStepIn(cid, item, position, fromPosition)
	local ladder = {x=910, y=1268, z=10, stackpos=1}
	local getLadder = getThingfromPos(ladder)
	if(item.uid == 10225 and isPlayer(cid) == TRUE) then
		doCreateItem(1386, 1, ladder)
	end
	return TRUE
end

function onStepOut(cid, item, position, fromPosition)
	local ladder = {x=910, y=1268, z=10, stackpos=1}
	local getLadder = getThingfromPos(ladder)
	if(item.uid == 10225 and isPlayer(cid) == TRUE) then
		doRemoveItem(getLadder.uid, 1)
	end
	return TRUE
end