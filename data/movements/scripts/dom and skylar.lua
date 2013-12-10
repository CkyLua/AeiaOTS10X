function onStepIn(cid, item, pos)

local tam = {x = 1457, y = 837, z = 2}

    if item.actionid == 13050 then
        doTeleportThing(cid,tam)
        doSendMagicEffect(getCreaturePosition(cid),17)
        local tp = doRemoveItem(item.uid, 1387)
        end
    return true
end  