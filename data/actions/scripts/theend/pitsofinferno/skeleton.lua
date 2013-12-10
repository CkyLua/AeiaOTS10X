function onUse(cid, item, fromPosition, itemEx, toPosition)
local queststatus = getPlayerStorageValue(cid, 10282)
	if item.uid == 10282 then
		if queststatus == 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		else
			local backpack = doPlayerAddItem(cid, 5926, 1)
			doAddContainerItem(backpack, 6561, 1)
			doAddContainerItem(backpack, 6300, 1)
			doAddContainerItem(backpack, 2168, 1)
			doAddContainerItem(backpack, 2143, 5)
			doAddContainerItem(backpack, 5944, 2)
			doAddContainerItem(backpack, 2152, 11)
			setPlayerStorageValue(cid, 10282, 1)
			doSendMagicEffect(fromPosition, 12)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a backpack.")
		end
	end
return TRUE
end