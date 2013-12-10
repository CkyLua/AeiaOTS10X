function onStepIn(cid, item, fromPosition, itemEx, toPosition)  
	local newPosition = {x=863, y=1366, z=14} 
	if(item.uid == 10271) then
		getThingFromPos(getPlayerPosition(cid)) 
		doSendMagicEffect(fromPosition, 2) 
		doTeleportThing(cid, newPosition) 
		doSendMagicEffect(newPosition, 10) 
	end
	return TRUE
end