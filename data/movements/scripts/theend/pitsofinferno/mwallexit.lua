function onStepIn(cid, item, frompos, item2, topos) 
local playerPosition = getPlayerPosition(cid) 
local newPosition = {x=847, y=1278, z=9}  
	if item.uid == 10202 then
		getThingfromPos(playerPosition) 
		doSendMagicEffect(playerPosition, 2) 
		doTeleportThing(cid, newPosition) 
		doSendMagicEffect(newPosition, 10) 
	end
return TRUE	
end