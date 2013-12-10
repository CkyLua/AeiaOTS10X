function onStepIn(cid, item, position, fromPosition)
    tileback = {x=2246, y=940, z=15, stackpos=255}
	
	if (getPlayerStorageValue(cid,35098) < 1) then
	        doTeleportThing(cid, tileback)
			doSendMagicEffect(tileback,10)
            doPlayerSendTextMessage(cid,22,"You have not killed the boss...")
		else
	end
	return true
end