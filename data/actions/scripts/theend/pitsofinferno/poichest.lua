function onUse(cid, item, fromPosition, itemEx, toPosition)
local poiqueststatus = getPlayerStorageValue(cid, 5050)
	if poiqueststatus == 1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
	else
		if item.uid == 9500 then
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found an arcane staff.")
   			doPlayerAddItem(cid, 2453, 1)
   			setPlayerStorageValue(cid, 5050, 1)
		elseif item.uid == 9501 then
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found an avenger.")
   			doPlayerAddItem(cid,6528,1)
   			setPlayerStorageValue(cid, 5050, 1)
		elseif item.uid == 9502 then
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found an arbalest.")
   			doPlayerAddItem(cid, 5803, 1)
   			setPlayerStorageValue(cid, 5050, 1)
		end
	end
return TRUE
end