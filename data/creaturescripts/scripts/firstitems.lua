function onLogin(cid)
	if getPlayerGroupId(cid) == 1 and getPlayerStorageValue(cid, 50002) == -1 then
		if isSorcerer(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)
	
			doAddContainerItem(bag, 2120, 1) -- Rope
			doAddContainerItem(bag, 2554, 1) -- shovel
			doAddContainerItem(bag, 2152, 100) -- 50 platinum coints
			doAddContainerItem(bag, 7620, 20) -- 20 mana potions
		
			doPlayerAddItem(cid, 2175, 1) -- spellbook
			doPlayerAddItem(cid, 2190, 1) -- wand of wortex
			doPlayerAddItem(cid, 8871, 1) -- p armor
			doPlayerAddItem(cid, 2490, 1) -- dark helmet
			doPlayerAddItem(cid, 2507, 1) -- p legs
			doPlayerAddItem(cid, 2643, 1) -- leather boots
			doPlayerAddItem(cid, 2173, 1) -- amulet of loss
			doPlayerAddItem(cid, 2672, 5) -- DHam
			

		setPlayerStorageValue(cid, 50002, 1)

		elseif isDruid(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)
			doAddContainerItem(bag, 2120, 1) -- rope
			doAddContainerItem(bag, 2554, 1) -- shovel
			doAddContainerItem(bag, 2152, 100) -- 50 platinum coins
			doAddContainerItem(bag, 7620, 20) -- 20 mana potions
		
			doPlayerAddItem(cid, 2175, 1) -- spellbook
			doPlayerAddItem(cid, 2182, 1) -- snakebite rod
			doPlayerAddItem(cid, 8871, 1) -- p armor
			doPlayerAddItem(cid, 2490, 1) -- dark helmet
			doPlayerAddItem(cid, 2507, 1) -- p legs
			doPlayerAddItem(cid, 2643, 1) -- leather boots
			doPlayerAddItem(cid, 2173, 1) -- amulet of loss
			doPlayerAddItem(cid, 2672, 5) -- DHam

			setPlayerStorageValue(cid, 50002, 1)

		elseif isPaladin(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)
			doAddContainerItem(bag, 2120, 1) -- rope
			doAddContainerItem(bag, 2554, 1) -- shovel
			doAddContainerItem(bag, 2152, 100) -- 50 platinum coins
			doAddContainerItem(bag, 7620, 10) -- 10 mana potions
			doAddContainerItem(bag, 7618, 10) -- 10 health potions
			doAddContainerItem(bag, 2544, 100) -- 100 arrows
			doAddContainerItem(bag, 2456, 1) -- bow
		
			doPlayerAddItem(cid, 2389, 1) -- spear
			doPlayerAddItem(cid, 2525, 1) -- dwarven shield
			doPlayerAddItem(cid, 7463, 1) -- p armor
			doPlayerAddItem(cid, 2490, 1) -- dark helmet
			doPlayerAddItem(cid, 8923, 1) -- p legs
			doPlayerAddItem(cid, 2643, 1) -- leather boots
			doPlayerAddItem(cid, 2173, 1) -- amulet of loss

			setPlayerStorageValue(cid, 50002, 1)

		elseif isKnight(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)
			doAddContainerItem(bag, 2120, 1) -- rope
			doAddContainerItem(bag, 2554, 1) -- shovel
			doAddContainerItem(bag, 2152, 100) -- 50 platinum coins
			doAddContainerItem(bag, 2439, 1) -- daramanian mace
			doAddContainerItem(bag, 8601, 1) -- steel axe
			doAddContainerItem(bag, 7618, 20) -- 20 health potions
		
			doPlayerAddItem(cid, 2513, 1) -- 
			doPlayerAddItem(cid, 8602, 1) -- jagged sword
			doPlayerAddItem(cid, 7463, 1) -- p armor
			doPlayerAddItem(cid, 2490, 1) -- dark helmet
			doPlayerAddItem(cid, 2477, 1) -- p legs
			doPlayerAddItem(cid, 2643, 1) -- leather boots
			doPlayerAddItem(cid, 2173, 1) -- amulet of loss

			setPlayerStorageValue(cid, 50002, 1)
		end
	end
 	return TRUE
end
