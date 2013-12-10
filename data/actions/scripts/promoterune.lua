function onUse(cid, item, frompos, item2, topos)
if item.itemid == 2283 then
local playerpos = getCreaturePosition(cid)
local promocjanow = getPlayerVocation(cid)
if promocjanow > 4 then
	if promocjanow < 9 then
		doRemoveItem(item.uid,2282)
		setPlayerPromotionLevel(cid, 2)
		doSendMagicEffect(playerpos, 53)
		doPlayerSendTextMessage(cid,22,"You got it! Log out, then back in.")
	else 
		doSendMagicEffect(playerpos, 2)
		doPlayerSendTextMessage(cid,22,"You already have this promotion")
	end
else
	doSendMagicEffect(playerpos, 2)
	doPlayerSendTextMessage(cid,22,"You do not have the first promotion")
end
end
return true
end