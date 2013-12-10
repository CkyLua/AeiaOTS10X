function onUse(cid, item, fromPosition, itemEx, toPosition)
local newposition = {x=855, y=1406, z=13}
	if item.itemid == 1746 and item.uid == 10272 then
		doTeleportThing(cid, newposition)
		doSendMagicEffect(newposition, 10)
		doSendMagicEffect(fromPosition, 6)
	end
	return TRUE
end