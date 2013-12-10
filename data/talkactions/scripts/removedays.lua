--- Script by Kekox fixed by Shawak.
function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
return true
end

local t = string.explode(param, ",")
t[1] = tonumber(t[1])
if(not t[1]) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires numeric param.")
return true
end

local pid = cid
if(t[2]) then
pid = getPlayerByNameWildcard(t[2])
if(not pid) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. t[2] .. " not found.")
return true
end
end

if(t[1] > 365) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can only add max 365 vip days.")
return true
end

sender = getPlayerByNameWildcard(cid)

doRemoveVipDays(pid, t[1])
doPlayerSendTextMessage(cid, "You have removed ".. t[1] .." vip days to ".. t[2])
doPlayerSendTextMessage(pid, sender .." just removed you ".. t[1] .." vip days.")
return true
end