function onStepIn(cid, item, pos)

	local ice = {x=189, y=165, z=7}
	local earth = {x=355, y=281, z=7}
	local fire = {x=331, y=337, z=12}
	local energy = {x=391, y=375, z=6}
	
	if getPlayerLookDir(cid) == 0 then
		newdir = 2
		newdir2 = 2
	elseif getPlayerLookDir(cid) == 1 then
		newdir = 3
		newdir2 = 3
	elseif getPlayerLookDir(cid) == 2 then
		newdir = 0
		newdir2 = 0
	else
		newdir = 1
		newdir2 = 1
	end

	if item.actionid == 7829 then
		if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,ice)
			doSendMagicEffect(ice,10)
			setPlayerStorageValue(cid, 15118, 1)
		else
			doCreatureSay(cid, "Only Druids of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	elseif item.actionid == 7830 then
		if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,earth)
			doSendMagicEffect(earth,10)
			setPlayerStorageValue(cid, 15130, 1)
		else
		doCreatureSay(cid, "Only Druids of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	elseif item.actionid == 7831 then
		if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,fire)
			doSendMagicEffect(fire,10)
			setPlayerStorageValue(cid, 15154, 1)
		else
		doCreatureSay(cid, "Only Sorcerers of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	elseif item.actionid == 7832 then
			if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,energy)
			doSendMagicEffect(energy,10)
			setPlayerStorageValue(cid, 15142, 1)
		else
			doCreatureSay(cid, "Only Sorcerers of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	end
end