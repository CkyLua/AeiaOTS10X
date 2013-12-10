function onUse(cid, item, fromPosition, toPosition)
	if(item.itemid == 2091 and item.uid == 10201) then
		if(getPlayerStorageValue(cid, 13700) < 1) then
			local key = doPlayerAddItem(cid, 2091, 1)
			doSetItemActionId(key, 3700)
			setPlayerStorageValue(cid, 13700, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a key.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have already taken this key.")
		end
	end
	return TRUE
end