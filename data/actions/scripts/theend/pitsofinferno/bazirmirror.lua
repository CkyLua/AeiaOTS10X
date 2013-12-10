function onUse(cid, item, fromPosition, itemEx, toPosition)
local newposition = {x=855, y=1417, z=12}
	if(item.uid == 10273 and item.itemid == 1850) then
		doTeleportThing(cid, newposition)
		doSendMagicEffect(toPosition, 10)
		doSendMagicEffect(fromPosition, 6)
	end
return TRUE
end