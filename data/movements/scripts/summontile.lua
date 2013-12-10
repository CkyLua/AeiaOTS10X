function onStepIn(cid, item, position, fromPosition)

    monster1 = {x=550, y=904, z=7, stackpos=255}
    monster2 = {x=552, y=902, z=7, stackpos=255}
    monster3 = {x=553, y=909, z=7, stackpos=255}
    monster4 = {x=555, y=909, z=7, stackpos=255}
if isPlayer(cid) == true then 	
	if (getGlobalStorageValue(6501) == 1) then
		doSummonCreature("Ghazbaran", monster1)
		doSummonCreature("Burning Guard", monster2)
		doSummonCreature("Burning Guard", monster3)
		doSummonCreature("Morgaroth", monster4)		
		setGlobalStorageValue(6501, 2)
	end
end
return true
end