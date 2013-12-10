function onUse(cid, item, fromPosition, itemEx, toPosition)
    local container = 0
    local cost = 9000 --ile ma kosztowac bp np runek
    local rune_id = 2307 --id runki, mozna zmienic na potion_id
    local backpack_id = 2000 --id backpacka
    if(item.itemid == 1945) then
        if(doPlayerRemoveMoney(cid, cost) == TRUE) then
            doTransformItem(item.uid, item.itemid+1)
            container = doPlayerAddItem(cid, backpack_id, 1)
            for i = 1, 20 do
                doAddContainerItem(container, rune_id, 1)
            end
        else
            doPlayerSendCancel(cid,"Sorry, you don't have enough money.")
        end
    elseif(item.itemid == 1946) then
        doTransformItem(item.uid, item.itemid-1)
    end
return TRUE
end