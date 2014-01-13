function onStepIn(cid, item, pos)

local ankrahmun = {x=256, y=255, z=8}
  queststatus8 = getPlayerStorageValue(cid,15118)

if item.actionid == 15111 then
	if queststatus8 == 1 then
		doTeleportThing(cid,ankrahmun)
		setPlayerStorageValue(cid, 15118, -1)
		doSendMagicEffect(getCreaturePosition(cid),10)
end
end
end
