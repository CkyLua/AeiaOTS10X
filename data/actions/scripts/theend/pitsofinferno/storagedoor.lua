function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 10281 then
		if(isInArray({getPlayerStorageValue(cid, 10274), getPlayerStorageValue(cid, 10275), getPlayerStorageValue(cid, 10276), getPlayerStorageValue(cid, 10277), getPlayerStorageValue(cid, 10278), getPlayerStorageValue(cid, 10279), getPlayerStorageValue(cid, 10280)}, -1) == TRUE) then
  			doPlayerSendTextMessage(cid, 22, "The door seems to be sealed against unwanted intruders.")
		else
			doPlayerSendTextMessage(cid, 22, "You've absorbed enough energy! You may pass.")
			doTransformItem(item.uid, item.itemid + 1)
			doTeleportThing(cid, toPosition, TRUE)
		end
		return TRUE
	end
	return FALSE
end