function onStepIn(cid, item, position, fromPosition)

    monster1 = {x=620, y=910, z=8, stackpos=255}
    monster2 = {x=623, y=910, z=8, stackpos=255}
    monster3 = {x=621, y=906, z=8, stackpos=255}
    monster4 = {x=622, y=906, z=8, stackpos=255}
if isPlayer(cid) == true then 	
	if (getGlobalStorageValue(6502) == 1) then
		doSummonCreature("Ice Guard", monster1)
		doSummonCreature("Burning Guard", monster2)
		doSummonCreature("Ice Demon", monster3)
		doSummonCreature("Martes 16", monster4)		
		setGlobalStorageValue(6502, 2)
	end
end
return true
end