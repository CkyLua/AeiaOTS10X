 function onUse(cid, item, fromPosition, itemEx, toPosition)

        itempos1 = {x=866, y=816, z=7, stackpos=255}
        tppos1 = {x=862, y=820, z=7, stackpos=255}

        itempos2 = {x=862, y=819, z=7, stackpos=255}
        tppos2 = {x=864, y=815, z=7, stackpos=255}

        itempos3 = {x=863, y=814, z=7, stackpos=255}
        tppos3 = {x=860, y=820, z=7, stackpos=255}

        itempos4 = {x=859, y=819, z=7, stackpos=255}
        tppos4 = {x=859, y=817, z=7, stackpos=255}

        getprzedm1 = getThingfromPos(itempos1)
        getprzedm2 = getThingfromPos(itempos2)
        getprzedm3 = getThingfromPos(itempos3)
        getprzedm4 = getThingfromPos(itempos4)

        if item.uid == 7004 then
        if getprzedm1.itemid == 8302 then 
               doRemoveItem(getprzedm1.uid)
               doTeleportThing(cid, tppos1)
               doSendMagicEffect(tppos1,10)
	  end
                end

        if item.uid == 7005 then
        if getprzedm2.itemid == 8304 then 
               doRemoveItem(getprzedm2.uid)
               doTeleportThing(cid, tppos2)
               doSendMagicEffect(tppos2,10)
	  end
                end

        if item.uid == 7006 then
        if getprzedm3.itemid == 8310 then 
               doRemoveItem(getprzedm3.uid)
               doTeleportThing(cid, tppos3)
               doSendMagicEffect(tppos3,10)
	  end
                end

        if item.uid == 7007 then
        if getprzedm4.itemid == 8298 then 
               doRemoveItem(getprzedm4.uid)
               doTeleportThing(cid, tppos4)
               doSendMagicEffect(tppos4,10)
	  end
                end

    return true
end
