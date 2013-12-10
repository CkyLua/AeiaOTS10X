function onUse(cid, item, fromPosition, itemEx, toPosition)
                queststatus = getPlayerStorageValue(cid, 22457)
                if queststatus < 1 then
                    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You found the addons for the wamaster outfit!")
					doPlayerAddOutfit(cid,335, 3)
					doPlayerAddOutfit(cid,336, 3)
                    doPlayerSetStorageValue(cid, 22457, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Nothing here")
                end
return true
end
