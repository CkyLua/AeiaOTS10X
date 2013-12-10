function onUse(cid, item, fromPosition, itemEx, toPosition)
local newposition = {x=847, y=1280, z=9}
	if(item.uid == 10200 and item.itemid == 1409) then
		doSendMagicEffect(fromPosition, 2)
		doTeleportThing(cid, newposition)
		doSendMagicEffect(newposition, 10)
	end
return TRUE
end  