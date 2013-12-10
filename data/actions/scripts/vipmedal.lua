-- Vip medal by Kekox
function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerVipDays(cid) > 365 then
doPlayerSendCancel(cid, "You can only have 1 year of vip account or less.")
else
doAddVipDays(cid, 30)
doCreatureSay(cid, "VIP")
doPlayerPopupFYI(cid, "We have added 30 vip days to your account!\nEnjoy it!.")
doRemoveItem(item.uid)
end
return true
end 