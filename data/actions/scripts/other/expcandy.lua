function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerLevel(cid) >= 10 then
doCreatureSay(cid, "You Gained 2000 Experience!", TALKTYPE_ORANGE_1)
doPlayerAddExp(cid, 2000)
doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)
doRemoveItem(item.uid, 1)
return TRUE
else
doCreatureSay(cid, "You must be level 10 or above to eat this.", TALKTYPE_ORANGE_1)
end
end
