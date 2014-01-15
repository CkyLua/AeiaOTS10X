function onStepIn(cid, item, pos)
	local tam = {x = 1457, y = 837, z = 2}
    if item.actionid == 13050 and isPlayer(cid) then
        doTeleportThing(cid, tam)
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MORTAREA)
        local tp = doRemoveItem(item.uid, 1387)
    end
    return true
end  