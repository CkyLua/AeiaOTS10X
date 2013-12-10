function onUse(cid, item, frompos, item2, topos)
	if item.itemid == 5785 then
		if (getPlayerStorageValue(cid,21444) < 1) then
			local playerpos = getCreaturePosition(cid)
			doRemoveItem(item.uid,5785)
			setPlayerStorageValue(cid,21444,1)
	
			doSendMagicEffect(playerpos, 29)
			doCreatureSay(cid, "Congrats! You now own the VIP acces token", TALKTYPE_ORANGE_1)
		else
			doCreatureSay(cid, "You already are a VIP", TALKTYPE_ORANGE_1)
		end
	end
end