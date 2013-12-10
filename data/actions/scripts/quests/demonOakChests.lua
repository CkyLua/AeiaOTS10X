  function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.uid == 12901 then
                queststatus = getPlayerStorageValue(cid, 12900)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found a Great Shield.")
                        doPlayerAddItem(cid, 2522, 1)
                        doPlayerSetStorageValue(cid, 12900, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end
        elseif item.uid == 12902 then
                queststatus = getPlayerStorageValue(cid, 12900)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found a  Solar Axe.")
                        doPlayerAddItem(cid, 8925, 1)
                        doPlayerSetStorageValue(cid, 12900, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end
        elseif item.uid == 12903 then
                queststatus = getPlayerStorageValue(cid, 12900)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found a Dragon Robe.")
                        doPlayerAddItem(cid, 8867, 1)
                        doPlayerSetStorageValue(cid, 12900, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end
        elseif item.uid == 12904 then
                queststatus = getPlayerStorageValue(cid, 12900)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found a Drachaku.")
                        doPlayerAddItem(cid, 11301, 1)
                        doPlayerSetStorageValue(cid, 12900, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty.")
                end
        end
        return true
end  