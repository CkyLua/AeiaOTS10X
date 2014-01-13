function onStepIn(cid, item, pos)

local ankrahmun = {x=256, y=255, z=8}
  queststatus8 = getPlayerStorageValue(cid,15142)

if item.actionid == 15113 then
	if queststatus8 == 1 then
		doTeleportThing(cid,ankrahmun)
		setPlayerStorageValue(cid, 15142, -1)
		doSendMagicEffect(getCreaturePosition(cid),10)
end
end
end
