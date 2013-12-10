  function onStepIn(cid, item, position, fromPosition)
    tileback = {x=1061, y=962, z=9, stackpos=255}
	
	if (getPlayerLevel(cid) > 300) then
	        doTeleportThing(cid, tileback)
			doSendMagicEffect(tileback,10)
            doPlayerSendTextMessage(cid,22,"You are not level 300")
		else
	end
	return true
end