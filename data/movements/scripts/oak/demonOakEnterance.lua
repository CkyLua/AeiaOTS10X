function onStepIn(cid, item, position, toPosition)
	local noPosition = {x=375, y=385, z=7}
	if getGlobalStorageValue(54301) == 84 then
	setPlayerStorageValue(cid, 35738, 1)
	doSendMagicEffect(getThingPos(item.uid), CONST_ME_BATS)
	doCreatureSay(cid, "THE DARK POWERS ARE WITH YOU, COME AND GET YOUR REWARD!", TALKTYPE_MONSTER_YELL, false, cid, (oakPositions.demonOak or getCreaturePosition(cid)))
	setGlobalStorageValue(54301, math.random(1, 100))
	else
		if getPlayerStorageValue(cid, 35738) == 1 then
			if getCreatureStorage(cid, oakStorages.treeCut) == 1 then
			doCreatureSetStorage(cid, oakStorages.treeCut, 0)
			doCreatureSay(cid, "GET BACK HERE AND FREE ME!", TALKTYPE_MONSTER_YELL, false, cid, (oakPositions.demonOak or getCreaturePosition(cid)))
			end
		return true
		else
			if getPlayerItemCount(cid, 10305) > 0 then
				doSendMagicEffect(getThingPos(item.uid), CONST_ME_HOLYAREA)
						setPlayerStorageValue(cid, 35738, 1)
						doPlayerRemoveItem(cid, 10305, 1)
			else
				doTeleportThing(cid, noPosition, true)
				doSendMagicEffect(noPosition, CONST_ME_BATS)
				doSendMagicEffect(noPosition, CONST_ME_SMALLCLOUDS)
			end
		end
	end
return true
end