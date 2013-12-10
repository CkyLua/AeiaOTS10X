function onUse(cid, item, frompos, item2, topos)
    if(item.uid == 3457)then
        skullpos = {x=1037, y=997, z=8, stackpos=255}
        amuletpos = {x=1039, y=997, z=8, stackpos=255}

        getskull = getThingfromPos(skullpos)
        getamulet = getThingfromPos(amuletpos)

        ticketpos = {x=1038, y=997, z=8}

        if getskull.itemid == 11076 then
       	 if getamulet.itemid == 10719 then
                doRemoveItem(getskull.uid)
                doRemoveItem(getamulet.uid)
                doSendMagicEffect(skullpos,13)
                doSendMagicEffect(amuletpos,13)
                doCreateItem(12661,1,ticketpos)
                doPlayerSendTextMessage(cid,22,"Items were combined.")
             end
	  end
end
end