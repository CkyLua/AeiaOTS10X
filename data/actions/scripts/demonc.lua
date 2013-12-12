function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 1909 then
		if(getPlayerStorageValue(cid,195) == -1) then
			setPlayerStorageValue(cid, 195, 1)
			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,"You took the holy water...")
		else
			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,"You took the holy water...")	
		end
	end

	return true
end