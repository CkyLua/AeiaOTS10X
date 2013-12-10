local playerPosition =
{
	{x = 1224, y = 969, z = 11, stackpos = STACKPOS_TOP_CREATURE},
	{x = 1223, y = 969, z = 11, stackpos = STACKPOS_TOP_CREATURE},
	{x = 1222, y = 969, z = 11, stackpos = STACKPOS_TOP_CREATURE},
	{x = 1221, y = 969, z = 11, stackpos = STACKPOS_TOP_CREATURE}
}
local newPosition =
{
	{x=1224, y=969, z=12},
	{x=1223, y=969, z=12},
	{x=1222, y=969, z=12},
	{x=1221, y=969, z=12}
}
local demonPosition =
{
	{x=1222, y=967, z=12},
	{x=1224, y=967, z=12},
	{x=1225, y=969, z=12},
	{x=1226, y=969, z=12},
	{x=1221, y=971, z=12},
	{x=1223, y=971, z=12}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = {0, 0, 0, 0}
	local failed = TRUE
	local count = 0
	item.new = 1946
	if(item.itemid == 1945) then
		if(os.time(t) >= (getGlobalStorageValue(9000) + 3600)) then
			for i = 1, 4 do
				player[i] = getThingfromPos(playerPosition[i])
				if(player[i].itemid > 0) then
					if(isPlayer(player[i].uid) == TRUE) then
						if(getPlayerStorageValue(player[i].uid, 9000) < 1) then
							if(getPlayerLevel(player[i].uid) >= 100 or getPlayerAccess(player[i].uid) >= 3) then
								failed = FALSE
								count = count + 1
							end
						end
					end
				end
				if(failed == TRUE) then
					doTransformItem(item.uid, 1946)
					return TRUE
				end
			end
			if(count == 4) then
				for i = 1, 6 do
					doSummonCreature("Demon", demonPosition[i])
				end
				for i = 1, 4 do
					doSendMagicEffect(playerPosition[i], CONST_ME_POFF)
					doTeleportThing(player[i].uid, newPosition[i], FALSE)
					doSendMagicEffect(newPosition[i], CONST_ME_ENERGYAREA)
					setPlayerStorageValue(player[i].uid, 9000, 1)
				end
				setGlobalStorageValue(9000, os.time(t))
			end
		end
	else
		item.new = 1945
	end
	doTransformItem(item.uid, item.new)
	return TRUE
end