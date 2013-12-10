function onStepIn(cid, item, position, fromPosition)
    tileback = {x=2179, y=771, z=12, stackpos=255}
	
	if (getPlayerStorageValue(cid,887) < 1) then
		if (getPlayerStorageValue(cid,888) < 1) then
			if (getPlayerStorageValue(cid,889) < 1) then
	        	doTeleportThing(cid, tileback)
			doSendMagicEffect(tileback,10)
            	doPlayerSendTextMessage(cid,22,"I did not touch the statues ...")
		else
		end
		else
end
	else
	end
	return true
end