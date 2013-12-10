function onStepIn(cid, item, position, fromPosition)
    tileback = {x=1143, y=817, z=7, stackpos=255}
	
	if (getPlayerStorageValue(cid,21444) < 1) then
	        doTeleportThing(cid, tileback)
			doSendMagicEffect(tileback,10)
            doPlayerSendTextMessage(cid,22,"You are not a VIP.")
		else
	end
	return true
end