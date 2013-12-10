function onStepIn(cid, item, position, fromPosition)
    tileback = {x=1061, y=963, z=10, stackpos=255}
	
	if (getPlayerStorageValue(cid,162) == 0) then
	        doTeleportThing(cid, tileback)
			doSendMagicEffect(tileback,10)
            doPlayerSendTextMessage(cid,22,"You have not completed the Vengoth quest.")
		else
	end
	return true
end