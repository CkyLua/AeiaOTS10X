function onStepIn(cid, item, fromPosition, itemEx, toPosition)
	local poiTp = {
		[10226] = {position = {x=883, y=1261, z=8}},
		[10227] = {position = {x=896, y=1270, z=8}},
		[10228] = {position = {x=900, y=1254, z=8}},
		[10229] = {position = {x=911, y=1243, z=8}},
		[10230] = {position = {x=896, y=1264, z=8}},
		[10231] = {position = {x=910, y=1270, z=8}},
		[10232] = {position = {x=914, y=1243, z=8}},
		[10233] = {position = {x=912, y=1235, z=8}},
		[10234] = {position = {x=917, y=1248, z=8}},
		[10235] = {position = {x=902, y=1234, z=8}},
		[10236] = {position = {x=895, y=1267, z=8}},
		[10237] = {position = {x=883, y=1255, z=8}},
		[10238] = {position = {x=901, y=1248, z=8}}
	}

		local teleport = poiTp[item.uid]
			if teleport then
				getThingFromPos(fromPosition)
				doTeleportThing(cid, teleport.position)
				doSendMagicEffect(fromPosition, 2) 
				doSendMagicEffect(teleport.position, 10) 
			end 
	return TRUE
end