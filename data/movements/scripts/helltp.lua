function onStepIn(cid, item, position, fromPosition)
    tileback = {x=1061, y=958, z=10, stackpos=255}
	if (isPlayer(cid) and getPlayerStorageValue(cid,35098) < 1) then
	    doTeleportThing(cid, tileback)
		doSendMagicEffect(tileback, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have not killed Lucifer.")
	end
	return true
end