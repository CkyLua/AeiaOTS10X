 function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.uid == 9000 then
                queststatus = getPlayerStorageValue(cid, 9000)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found a Demon Armor.")
                        doPlayerAddItem(cid, 2494, 1)
                        doPlayerSetStorageValue(cid, 9000, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end

        elseif item.uid == 9001 then
                queststatus = getPlayerStorageValue(cid, 9000)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found a Magic Sword.")
                        doPlayerAddItem(cid, 2400, 1)
                        doPlayerSetStorageValue(cid, 9000, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end

        elseif item.uid == 9002 then
                queststatus = getPlayerStorageValue(cid, 9000)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found a Stonecutter's Axe.")
                        doPlayerAddItem(cid, 2431, 1)
                        doPlayerSetStorageValue(cid, 9000, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end

    return true
end
end
