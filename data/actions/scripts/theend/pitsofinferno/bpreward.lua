function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 10284) < 1 then
        local bp = doPlayerAddItem(cid, 2365, 1)
		doAddContainerItem(bp, 2152, 100)
		doAddContainerItem(bp, 2273, 10)
		doAddContainerItem(bp, 2268, 10)
		doAddContainerItem(bp, 2313, 30)
		doAddContainerItem(bp, 2311, 50)
        setPlayerStorageValue(cid, 10284, 1)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a backpack.")
    else
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
    end
return TRUE
end