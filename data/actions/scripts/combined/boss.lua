function onUse(cid, item, frompos, item2, topos)
    if(item.uid == 3460)then 
        kamieniepos1 = {x=1049, y=1050, z=10, stackpos=255}
		teleportpos1 = {x=1610, y=1488, z=7, stackpos=255} -- Bezsynslandia
        getkamienie = getThingfromPos(kamieniepos1)
       	if getkamienie.itemid == 6548 and getkamienie.type == 100 then
                doRemoveItem(getkamienie.uid,100)
                doSendMagicEffect(kamieniepos1,13)
				doTeleportThing(cid, teleportpos1)
				doSendMagicEffect(teleportpos1,10)
		else
                doPlayerSendTextMessage(cid,22,"You must place 100 demonic stones.")		
        end
	end
	
    if(item.uid == 3461)then
        kamieniepos1 = {x=1049, y=1052, z=10, stackpos=255}
		teleportpos1 = {x=1739, y=1508, z=3, stackpos=255} -- Ta gura
        getkamienie = getThingfromPos(kamieniepos1)
       	if getkamienie.itemid == 6548 and getkamienie.type == 100 then
                doRemoveItem(getkamienie.uid,100)
                doSendMagicEffect(kamieniepos1,13)
				doTeleportThing(cid, teleportpos1)
				doSendMagicEffect(teleportpos1,10)
		else
                doPlayerSendTextMessage(cid,22,"You must place 100 demonic stones.")		
        end
	end
	
    if(item.uid == 3462)then
        kamieniepos1 = {x=1049, y=1053, z=10, stackpos=255}
		teleportpos1 = {x=1634, y=1444, z=7, stackpos=255} -- Old temple
        getkamienie = getThingfromPos(kamieniepos1)
       	if getkamienie.itemid == 6548 and getkamienie.type == 100 then
                doRemoveItem(getkamienie.uid,100)
                doSendMagicEffect(kamieniepos1,13)
				doTeleportThing(cid, teleportpos1)
				doSendMagicEffect(teleportpos1,10)
		else
                doPlayerSendTextMessage(cid,22,"You must place 100 demonic stones.")		
        end
	end
	
    if(item.uid == 3463)then
        kamieniepos1 = {x=1047, y=1053, z=10, stackpos=255}
		teleportpos1 = {x=1701, y=1461, z=7, stackpos=255} -- Dzungla
        getkamienie = getThingfromPos(kamieniepos1)
       	if getkamienie.itemid == 6548 and getkamienie.type == 100 then
                doRemoveItem(getkamienie.uid,100)
                doSendMagicEffect(kamieniepos1,13)
				doTeleportThing(cid, teleportpos1)
				doSendMagicEffect(teleportpos1,10)
		else
                doPlayerSendTextMessage(cid,22,"You must place 100 demonic stones.")		
        end
	end

end