function onStepIn(cid, item, position, fromPosition)
    tileback = {x=1046, y=1028, z=9, stackpos=255}
	if (isPlayer(cid) and getPlayerStorageValue(cid,140) < 1) then
	    doTeleportThing(cid, tileback)
		doSendMagicEffect(tileback, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You may not enter...")  --Nie masz tu wstepu
	end
	return true
end