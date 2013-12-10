function onUse(cid, item, fromPosition, itemEx, toPosition)
    local container = 0
    local cost = 10000 --ile ma kosztowac bp np runek
    local rune_id = 7440 --id runki, mozna zmienic na potion_id
    local backpack_id = 1995 --id backpacka
    if(item.itemid == 9827) then
        if(doPlayerRemoveMoney(cid, cost) == TRUE) then
            doTransformItem(item.uid, item.itemid+1)
            container = doPlayerAddItem(cid, backpack_id, 1)
            for i = 1, 8 do
                doAddContainerItem(container, rune_id, 1)
            end
        else
            doPlayerSendCancel(cid,"Sorry, you don't have enough money.")
        end
    elseif(item.itemid == 9828) then
        doTransformItem(item.uid, item.itemid-1)
    end
return TRUE
end