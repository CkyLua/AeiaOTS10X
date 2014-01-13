function onStepIn(cid, item, pos)

config = {
[8998] = {x=414, y=382, z=9},
[8999] = {x=392, y=389, z=9}
}

doSendMagicEffect(getCreaturePosition(cid),CONST_ME_WATERSPLASH)
doTeleportThing(cid,config[item.actionid])
doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
return true
end