function onStepIn(cid, item, position, fromPosition)
    tileback = {x=1046, y=1028, z=9, stackpos=255}
	
	if (getPlayerStorageValue(cid,140) < 1) then
	        doTeleportThing(cid, tileback)
			doSendMagicEffect(tileback,10)
            doPlayerSendTextMessage(cid,22,"You may not enter...")  --Nie masz tu wstepu
		else
	end
	return true
end