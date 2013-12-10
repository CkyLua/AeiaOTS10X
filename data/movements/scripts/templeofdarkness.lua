function onStepIn(cid, item, position, fromPosition)
    tileback = {x=1031, y=1002, z=8, stackpos=255}
	
	if (getGlobalStorageValue(6500) < 1) then
	        doTeleportThing(cid, tileback)
			doSendMagicEffect(tileback,10)
            doPlayerSendTextMessage(cid,22,"Temple of Darkness - Closed.")
		else
	end
	return true
end