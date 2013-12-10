function onUse(cid, item, fromPosition, itemEx, toPosition)
local newposition = {x=818, y=1280, z=12}
	if item.uid >= 10260 and item.uid <= 10270 and item.itemid == 1945 then
		doTransformItem(item.uid, item.itemid+1)
		doSendMagicEffect(fromPosition, 2)
		doTeleportThing(cid, newposition)
		doSendMagicEffect(toPosition, 10)
		doTransformItem(item.uid, item.itemid+1)
	elseif item.uid >= 10260 and item.uid <= 10270 and item.itemid == 1946 then
		doTransformItem(item.uid, item.itemid-1)
	else
		doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
	end
return TRUE
end  
