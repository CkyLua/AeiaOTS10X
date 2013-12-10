function onEquip(cid, item, slot)
standardoutfit = { lookType = getPlayerStorageValue(cid, 3331), lookHead = getPlayerStorageValue(cid, 3332), lookBody =
getPlayerStorageValue(cid, 3333), lookLegs = getPlayerStorageValue(cid, 3334), lookFeet = getPlayerStorageValue(cid, 3335), lookAddons =
getPlayerStorageValue(cid, 3336) }
gmoutfit = { lookType = 332, lookHead = 0, lookBody =0, lookLegs = 0, lookFeet = 0, lookAddons =0 }
setPlayerStorageValue(cid, 3331, getCreatureOutfit(cid).lookType)
setPlayerStorageValue(cid, 3332, getCreatureOutfit(cid).lookHead)
setPlayerStorageValue(cid, 3333, getCreatureOutfit(cid).lookBody)
setPlayerStorageValue(cid, 3334, getCreatureOutfit(cid).lookLegs)
setPlayerStorageValue(cid, 3335, getCreatureOutfit(cid).lookFeet)
setPlayerStorageValue(cid, 3336, getCreatureOutfit(cid).lookAddons)
doPlayerSendTextMessage(cid, 22, "You're the king!.")
doSetCreatureOutfit(cid, gmoutfit, 90000000)
end
function onDeEquip(cid, item, slot)
doPlayerSendTextMessage(cid, 22, "You dont have the crown, you are not king anymore. :/")
doSetCreatureOutfit(cid, standardoutfit, 1)
end  