-- Script by dominique120
function onStepIn(cid, item, position, fromPosition)
if getPlayerAccess(cid) <= 4 then
doTeleportThing(cid, fromPosition, FALSE)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You are not a god.")
end
return true
end