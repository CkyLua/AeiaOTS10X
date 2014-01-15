function onUse(cid, item, fromPosition, itemEx, toPosition)
	local newposition = {x=847, y=1280, z=9}
	if(item.uid == 10200 and item.itemid == 1409) then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doTeleportThing(cid, newposition)
		doSendMagicEffect(newposition, CONST_ME_TELEPORT)
	end
	return true
end  