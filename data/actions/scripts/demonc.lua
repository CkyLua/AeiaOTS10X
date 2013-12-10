function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 1909 then
		if(getPlayerStorageValue(cid,195) == -1) then
			setPlayerStorageValue(cid, 195, 1)
			doPlayerSendTextMessage(cid,22,"You took the holy water...")
		else
			doPlayerSendTextMessage(cid,22,"You took the holy water...")	
		end
	end

	return true
end