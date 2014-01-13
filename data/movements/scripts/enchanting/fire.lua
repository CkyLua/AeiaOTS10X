function onStepIn(cid, item, pos)

local ankrahmun = {x=256, y=255, z=8}
  queststatus8 = getPlayerStorageValue(cid,15154)

if item.actionid == 15114 then
	if queststatus8 == 1 then
		doTeleportThing(cid,ankrahmun)
		setPlayerStorageValue(cid, 15154, -1)
		doSendMagicEffect(getCreaturePosition(cid),10)
end
end
end
