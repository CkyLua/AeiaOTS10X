function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 1910 then
		if(getPlayerStorageValue(cid,887) == -1) then
			setPlayerStorageValue(cid, 887, 1)
			doPlayerSendTextMessage(cid,22,"You touched the mystical statue...")
		else
			doPlayerSendTextMessage(cid,22,"You already you touched the statue...")	
		end
	end
	
	if item.uid == 1911 then
		if(getPlayerStorageValue(cid,888) == -1) then
			setPlayerStorageValue(cid, 888, 1)
			doPlayerSendTextMessage(cid,22,"You touched the mystical statue...")
		else
			doPlayerSendTextMessage(cid,22,"You already you touched the statue...")	
		end
	end

	if item.uid == 1912 then
		if(getPlayerStorageValue(cid,889) == -1) then
			setPlayerStorageValue(cid, 889, 1)
			doPlayerSendTextMessage(cid,22,"You touched the mystical statue...")
		else
			doPlayerSendTextMessage(cid,22,"You already you touched the statue...")	
		end
	end

	return true
end