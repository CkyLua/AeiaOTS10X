function onLogin(cid)
if getPlayerVipDays(cid) > 0 then
setPlayerStorageValue(cid, 20500, 1)
elseif getPlayerVipDays(cid) == 0 and getPlayerStorageValue(cid, 20500) == 1 then
doTeleportThing(cid, getPlayerMasterPos(cid))
setPlayerStorageValue(cid, 20500, -1)
end
return true
end