 function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.uid == 2160 then
                queststatus = getPlayerStorageValue(cid, 2160)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found 100cc.")
                        doPlayerAddItem(cid, 2160, 100)
                        doPlayerSetStorageValue(cid, 2160, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end
end
    return true
end
