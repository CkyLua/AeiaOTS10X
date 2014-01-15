function onStepIn(cid, item, position, fromPosition)
	tileback = {x=1061, y=962, z=9, stackpos=255}
	if (isPlayer(cid) and getPlayerLevel(cid) > 300) then
	    doTeleportThing(cid, tileback)
		doSendMagicEffect(tileback, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You are not level 300")
	end
	return true
end