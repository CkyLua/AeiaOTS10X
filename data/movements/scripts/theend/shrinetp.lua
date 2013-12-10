function onStepIn(cid, item, position, fromPosition)
	local config = {
		iceShrine = {x=1124, y=1035, z=7},
		fireShrine = {x=1132, y=948, z=10},
		energyShrine = {x=1285, y=880, z=12},
		earthShrine = {x=1082, y=1079, z=8},
		temple = {x=1000, y=1000, z=7}
	}
	if(item.actionid == 7704) then
		if(isDruid(cid) == TRUE and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE) then
			doTeleportThing(cid, config.iceShrine)
			doSendMagicEffect(config.iceShrine, 10)
		else
			doPlayerSendCancel(cid, "Sorry, not possible.")
			doPlayerSendCancel(cid, "Only premium druids of level 30 or higher are able to enter this portal.")
			doTeleportThing(cid, fromPosition, TRUE)
		end
	elseif(item.actionid == 7705) then
		if(isDruid(cid) == TRUE and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE) then
			doTeleportThing(cid, config.earthShrine)
			doSendMagicEffect(config.earthShrine, 10)
		else
			doPlayerSendCancel(cid, "Only premium druids of level 30 or higher are able to enter this portal.")
			doTeleportThing(cid, fromPosition, TRUE)
		end
	elseif(item.actionid == 7706) then
		if(isSorcerer(cid) == TRUE and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE) then
			doTeleportThing(cid, config.fireShrine)
			doSendMagicEffect(config.fireShrine, 10)
		else
			doPlayerSendCancel(cid, "Only premium sorcerers of level 30 or higher are able to enter this portal.")
			doTeleportThing(cid, fromPosition, TRUE)
		end
	elseif(item.actionid == 7707) then
		if(isSorcerer(cid) == TRUE and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE) then
			doTeleportThing(cid, config.energyShrine)
			doSendMagicEffect(config.energyShrine, 10)
		else
			doPlayerSendCancel(cid, "Only premium sorcerers of level 30 or higher are able to enter this portal.")
			doTeleportThing(cid, fromPosition, TRUE)
		end
	elseif(item.actionid == 7708) then
		doTeleportThing(cid, config.temple)
		doSendMagicEffect(config.temple, 10)
	else
		doPlayerSendTextMessage(cid, 22, "Sorry, not possible.")
		doTeleportThing(cid, fromPosition, TRUE)
	end
	return TRUE
end