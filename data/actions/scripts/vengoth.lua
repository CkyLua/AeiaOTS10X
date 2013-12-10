function onUse(cid, item, fromPosition, itemEx, toPosition)
    niebo = {x=1457, y=877, z=7, stackpos=255}

	if item.uid == 1900 then
		if(getPlayerStorageValue(cid,180) == -1) then
			setPlayerStorageValue(cid, 180, 1)
			doPlayerSendTextMessage(cid,22,"You touched the statue...")
		else
			doPlayerSendTextMessage(cid,22,"You already touched this statue...")	
		end
	end
	
	if item.uid == 1901 then
		if(getPlayerStorageValue(cid,181) == -1) then
			setPlayerStorageValue(cid, 181, 1)
			doPlayerSendTextMessage(cid,22,"You touched the statue...")
		else
			doPlayerSendTextMessage(cid,22,"You already touched this statue...")	
		end
	end
	
	if item.uid == 1902 then
		if(getPlayerStorageValue(cid,182) == -1) then
			setPlayerStorageValue(cid, 182, 1)
			doPlayerSendTextMessage(cid,22,"You touched the statue...")
		else
			doPlayerSendTextMessage(cid,22,"You already touched this statue...")	
		end
	end
	
	if item.uid == 1903 then
		if(getPlayerStorageValue(cid,183) == -1) then
			setPlayerStorageValue(cid, 183, 1)
			doPlayerSendTextMessage(cid,22,"You touched the statue...")
		else
			doPlayerSendTextMessage(cid,22,"You already touched this statue...")	
		end
	end
	
	if item.uid == 1904 then
		if(getPlayerStorageValue(cid,184) == -1) then
			setPlayerStorageValue(cid, 184, 1)
			doPlayerSendTextMessage(cid,22,"You touched the statue...")
		else
			doPlayerSendTextMessage(cid,22,"You already touched this statue...")	
		end
	end
	
	if item.uid == 1905 then
		if(getPlayerStorageValue(cid,185) == -1) then
			setPlayerStorageValue(cid, 185, 1)
			doPlayerSendTextMessage(cid,22,"You touched the statue...")
		else
			doPlayerSendTextMessage(cid,22,"You already touched this statue...")	
		end
	end
	
	if item.uid == 1906 then
		if(getPlayerStorageValue(cid,180) == 1) then
			if(getPlayerStorageValue(cid,181) == 1) then
				if(getPlayerStorageValue(cid,182) == 1) then
					if(getPlayerStorageValue(cid,183) == 1) then
						if(getPlayerStorageValue(cid,184) == 1) then
							if(getPlayerStorageValue(cid,185) == 1) then			
			doPlayerSendTextMessage(cid,22,"Welcome to Heaven...")
			doTeleportThing(cid, niebo)
			doSendMagicEffect(niebo,10)
		else
			doPlayerSendTextMessage(cid,22,"...")	
		end
			else
				doPlayerSendTextMessage(cid,22,"...")	
			end
				else
					doPlayerSendTextMessage(cid,22,"...")	
				end
					else
						doPlayerSendTextMessage(cid,22,"...")	
					end
						else
							doPlayerSendTextMessage(cid,22,"...")	
						end
							else
								doPlayerSendTextMessage(cid,22,"...")	
							end
	end
	
	return true
end