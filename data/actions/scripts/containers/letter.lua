function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(doPlayerRemoveMoney(cid, 70) == TRUE) then
                        doPlayerAddItem(cid, 2597, 1)
        else
            doPlayerSendCancel(cid,"You do not have enough money.")
        end
return true
end
