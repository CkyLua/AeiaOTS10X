function onStepIn(cid, item, position, fromPosition)
    tileback = {x=1061, y=958, z=10, stackpos=255}
	
	if (getPlayerStorageValue(cid,35098) < 1) then
	        doTeleportThing(cid, tileback)
			doSendMagicEffect(tileback,10)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,"You have not killed Lucifer.")
		else
	end
	return true
end