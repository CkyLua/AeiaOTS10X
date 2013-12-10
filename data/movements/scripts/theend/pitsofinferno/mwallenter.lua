function onStepIn(cid, item, frompos, item2, topos) 
local playerPosition = getPlayerPosition(cid) 
local newPosition = {x=847, y=1274, z=9}
if item.uid == 10239 then
		getThingfromPos(playerPosition) 
		doSendMagicEffect(playerPosition, 2) 
		doTeleportThing(cid, newPosition) 
		doSendMagicEffect(newPosition, 10) 
	end
return TRUE	
end