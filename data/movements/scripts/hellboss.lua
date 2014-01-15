function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then 
		return true 
	end
	
    tileback = {x=2179, y=771, z=12, stackpos=255}
	if (getPlayerStorageValue(cid,887) < 1) then
		if (getPlayerStorageValue(cid,888) < 1) then
			if (getPlayerStorageValue(cid,889) < 1) then
				doTeleportThing(cid, tileback)
				doSendMagicEffect(tileback, CONST_ME_TELEPORT)
            	doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,"I did not touch the statues ...")
			end
		end
	end
	return true
end