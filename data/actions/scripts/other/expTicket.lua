function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerLevel(cid) >= 10 then
doCreatureSay(cid, "You Gained 1000 Experience!", TALKTYPE_ORANGE_1)
doPlayerAddExp(cid, 1000000)
doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)
doRemoveItem(item.uid)
return TRUE
else
doCreatureSay(cid, "You must be level 10 or above to use this ticket.", TALKTYPE_ORANGE_1)
end
end