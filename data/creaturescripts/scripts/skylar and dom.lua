local config = {
   timeToRemove = 45, -- seconds
   message = "You did it! You hve killed the gods! As a result their life force has created a teleporter to take you to the magical trasure room! Better go now because it looks like it will disapear in a few seconds.",
   teleportId = 1387,  --9773
   
   brothers = {
     ["Dominique"] = {pos={ x=1457, y=834, z=2, stackpos=1 },aid=13050, brother = "Dominique"},
     ["Skylar"] = {pos={ x=1457, y=835, z=2, stackpos=1 },aid=13050, brother = "Skylar"}, --posotion of the spawned tp
   brothersArea = {
     fromPos = {x = 1457, y = 25, z = 2},
     toPos = {x = 8, y = 8, z = 0}
     }
   }
}
local function removal(position)
		doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
	return true
end

function onKill(cid, target, lastHit)
	if(config.brothers[getCreatureName(target)]) then
		local t = config.brothers[getCreatureName(target)]
		local brother = getCreatureByName(t.brother)
		if(isMonster(brother) == true) then
		if(isInRange(getCreaturePosition(brother), config.brothers.brothersArea.fromPos, config.brothers.brothersArea.toPos) == true) then
	return true
end

else



local position = t.pos
	doCreateTeleport(config.teleportId, {x = 8, y = 8, z = 0}, t.pos)  --destination?
	doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
	addEvent(removal, config.timeToRemove * 1000, position)
end
	return true
end  
	return true
end