function onUse(cid, item, frompos, item2, topos)
    if(item.uid == 3466)then
        fierypos = {x=1581, y=1451, z=7, stackpos=255}
        terranpos = {x=1579, y=1449, z=7, stackpos=255}
        icypos = {x=1581, y=1449, z=7, stackpos=255}
        sparkingpos = {x=1579, y=1451, z=7, stackpos=255}
		
        combinedpos = {x=1580, y=1449, z=7, stackpos=255}
		
        getfiery = getThingfromPos(fierypos)
        getterran = getThingfromPos(terranpos)
        geticy = getThingfromPos(icypos)
        getsparking = getThingfromPos(sparkingpos)
		
        if getfiery.itemid == 8906 then
			if geticy.itemid == 8907 then
				if getsparking.itemid == 8908 then
					if getterran.itemid == 8909 then
						doRemoveItem(getfiery.uid)
						doRemoveItem(geticy.uid)
						doRemoveItem(getterran.uid)
						doRemoveItem(getsparking.uid)
						
						doSendMagicEffect(fierypos,2)
						doSendMagicEffect(icypos,2)
						doSendMagicEffect(terranpos,2)
						doSendMagicEffect(sparkingpos,2)
						
					    doCreateItem(12678,1,combinedpos)
					else
						doPlayerSendTextMessage(cid,22,"Set the shields as written on the blackboard.")
					end
				else
					doPlayerSendTextMessage(cid,22,"Set the shields as written on the blackboard.")
				end
			else
				doPlayerSendTextMessage(cid,22,"Set the shields as written on the blackboard.")
			end
		else
		    doPlayerSendTextMessage(cid,22,"Set the shields as written on the blackboard.")
		end
    end
end