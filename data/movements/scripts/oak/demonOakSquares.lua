function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if getPlayerStorageValue(cid,29500+item.uid) < os.time() then
		doCreatureSay(cid, oakSounds[1][math.random(1, #oakSounds[1])], TALKTYPE_MONSTER_YELL, false, cid, (oakPositions.demonOak or getCreaturePosition(cid)))
		setGlobalStorageValue(54301, math.random(1, 100))
		setPlayerStorageValue(cid,29500+item.uid,os.time()+60)
	return true
	end
end