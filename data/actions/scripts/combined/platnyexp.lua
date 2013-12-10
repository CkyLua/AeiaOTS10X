function onUse(cid, item, frompos, item2, topos)
        ingotpos = {x=1057, y=944, z=9, stackpos=255}
        tppos = {x=1212, y=1373, z=13, stackpos=255}
        getingot = getThingfromPos(ingotpos)
		
		if getingot.itemid == 9971 and getingot.type == 5 then
			doRemoveItem(getingot.uid,5)
			doSendMagicEffect(ingotpos,2)
			doTeleportThing(cid, tppos)
		else
			doPlayerSendTextMessage(cid,22,"You must put 5 gold ingots.")
		end
return true
end