--- Script by Kekox
function onLogin(cid)
if getPlayerVipDays(cid) >= 1 then
doPlayerSendTextMessage(cid, 4, "You have ".. getPlayerVipDays(cid) .." vip days left.")
end
return true
end