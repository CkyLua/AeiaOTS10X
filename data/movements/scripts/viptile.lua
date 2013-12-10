--- Script by Kekox
function onStepIn(cid, item, position, fromPosition)
if getPlayerVipDays(cid) == 0 then
doTeleportThing(cid, fromPosition, FALSE)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You are not a VIP.")
end
return true
end