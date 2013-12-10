function onStepIn(cid, item, fromPosition, itemEx, toPosition) 
local newPosition = {x=898, y=1221, z=9} 
	if(item.uid == 10251 or item.uid == 10252 or item.uid == 10253) then
		getThingfromPos(fromPosition) 
		doSendMagicEffect(fromPosition, CONST_ME_FIREAREA) 
		doTeleportThing(cid, newPosition) 
		doSendMagicEffect(newPosition, 10) 
	end
return TRUE	
end