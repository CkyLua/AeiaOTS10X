function onStepIn(cid, item, frompos, item2, topos) 
local playerPosition = getPlayerPosition(cid) 
local newPosition = {x=910, y=1266, z=8} 
if(item.uid >= 10240 and item.uid <= 10250) then
		getThingfromPos(playerPosition) 
		doSendMagicEffect(playerPosition, 2) 
		doTeleportThing(cid, newPosition) 
		doSendMagicEffect(newPosition, 10) 
	end
return TRUE	
end