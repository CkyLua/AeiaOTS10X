function onStepIn(cid, item, position, fromPosition)

    monster1 = {x=526, y=928, z=7, stackpos=255}
    monster2 = {x=524, y=932, z=7, stackpos=255}
    monster3 = {x=526, y=924, z=7, stackpos=255}
    monster4 = {x=523, y=924, z=7, stackpos=255}
if isPlayer(cid) == true then
	if (getGlobalStorageValue(6503) == 1) then
		doSummonCreature("Martes 13", monster1)
		doSummonCreature("Burning Guard", monster2)
		doSummonCreature("Ghazbaran", monster3)
		doSummonCreature("Martes 16", monster4)		
		setGlobalStorageValue(6503, 3)
	end
end
return true
end