 function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.uid == 6000 then
                queststatus = getPlayerStorageValue(cid, 6000)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found an Epic Sword.")
                        doPlayerAddItem(cid, 7403, 1)
                        doPlayerSetStorageValue(cid, 6000, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end

        elseif item.uid == 6001 then
                queststatus = getPlayerStorageValue(cid, 6000)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found a Meginata MX.")
                        doPlayerAddItem(cid, 2426, 1)
                        doPlayerSetStorageValue(cid, 6000, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end

        elseif item.uid == 6002 then
                queststatus = getPlayerStorageValue(cid, 6000)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found Gandalf's Staff.")
                        doPlayerAddItem(cid, 7426, 1)
                        doPlayerSetStorageValue(cid, 6000, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end

        elseif item.uid == 6003 then
                queststatus = getPlayerStorageValue(cid, 6000)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found a Crystal Wand.")
                        doPlayerAddItem(cid, 2184, 1)
                        doPlayerSetStorageValue(cid, 6000, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end

    return true
end
end
