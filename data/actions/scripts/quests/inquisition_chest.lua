-- frosen chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 8560 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found an Emerald Sword.")
               doPlayerAddItem(cid,8930,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end
       elseif item.uid == 8561 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Spellbook of dark Mysteries.")
               doPlayerAddItem(cid,8918,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end
       elseif item.uid == 8562 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Paladin Armor.")
               doPlayerAddItem(cid,8891,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end
       elseif item.uid == 8563 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Robe of the Underworld")
               doPlayerAddItem(cid,8890,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end
       elseif item.uid == 8564 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Fireborn Giant Armor.")
               doPlayerAddItem(cid,8881,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end
       elseif item.uid == 8565 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR2,"You have found an Obsidian Truncheon.")
               doPlayerAddItem(cid,8928,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end
       elseif item.uid == 8566 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Royal Crossbow.")
               doPlayerAddItem(cid,8851,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end
       elseif item.uid == 8567 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Warsinger Bow.")
               doPlayerAddItem(cid,8854,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end
       elseif item.uid == 8568 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Hellforged axe")
               doPlayerAddItem(cid,8924,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end

    else
        return 0
       end

       return 1
end