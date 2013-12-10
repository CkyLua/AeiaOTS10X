function onUse(cid, item, fromPosition, itemEx, toPosition)
    local cont_id = 2595
        if(doPlayerRemoveMoney(cid, 200) == TRUE) then
    		container = doPlayerAddItem(cid, cont_id, 1)
                        doPlayerAddItem(cid, 2599, 1)
        else
            doPlayerSendCancel(cid,"You do not have enough money.")
        end
return true
end
