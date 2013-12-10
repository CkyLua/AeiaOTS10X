function onUse(cid, item, frompos, item2, topos)
    if(item.uid == 3456)then
        kasapos = {x=1030, y=1012, z=6, stackpos=255}
        getkasa = getThingfromPos(kasapos)   --{x = 1030, y = 1012, z = 6}
        winpos = {x=1330, y=1012, z=6}
        if getkasa.itemid == 2160 and getkasa.type == 5 then
            rand = math.random(4)
            if rand == 1 or rand == 4 or rand == 3 then
                doRemoveItem(getkasa.uid,5)
                doSendMagicEffect(kasapos,2)
                doPlayerSendTextMessage(cid,22,"You have lost 5 Crystal Coins .")
            end
            if rand == 2 then
                doRemoveItem(getkasa.uid,5)
                doCreateItem(2160,15,winpos)
                doSendMagicEffect(winpos,13)
                doSendMagicEffect(topos,21)
                doPlayerSendTextMessage(cid,22," Congratulations! You won 15 Crystal Coins .")
            end
        end
        if getkasa.itemid == 2160 and getkasa.type == 10 then
            rand = math.random(4)
            if rand == 1 or rand == 4 or rand == 3 then
                doRemoveItem(getkasa.uid,10)
                doSendMagicEffect(kasapos,2)
                doPlayerSendTextMessage(cid,22,"You have lost 10 Crystal Coins .")
            end
            if rand == 2 then
                doRemoveItem(getkasa.uid,10)
                doCreateItem(2160,30,winpos)
                doSendMagicEffect(winpos,13)
                doSendMagicEffect(topos,21)
                doPlayerSendTextMessage(cid,22,"Congratulations! You won 30 Crystal Coins .")
            end
        end
        if getkasa.itemid == 2160 and getkasa.type == 25 then
            rand = math.random(4)
            if rand == 1 or rand == 4 or rand == 3 then
                doRemoveItem(getkasa.uid,25)
                doSendMagicEffect(kasapos,2)
                doPlayerSendTextMessage(cid,22,"You have lost 25 Crystal Coins .")
            end
            if rand == 2 then
                doRemoveItem(getkasa.uid,25)
                doCreateItem(2160,75,winpos)
                doSendMagicEffect(winpos,13)
                doSendMagicEffect(topos,21)
                doPlayerSendTextMessage(cid,22," Congratulations! You won 75 Crystal Coins  .")
            end
        end
        if getkasa.itemid == 2160 and getkasa.type == 50 then
            rand = math.random(4)
            if rand == 1 or rand == 4 or rand == 3 then
                doRemoveItem(getkasa.uid,50)
                doSendMagicEffect(kasapos,2)
                doPlayerSendTextMessage(cid,22,"You have lost 50 Crystal Coins .")
            end
            if rand == 2 then
                doRemoveItem(getkasa.uid,50)
                doCreateItem(2160,100,winpos)
                doCreateItem(2160,50,winpos)
                doSendMagicEffect(winpos,13)
                doSendMagicEffect(topos,21)
                doPlayerSendTextMessage(cid,22,"Congratulations! You won 150 Crystal Coins .")
            end
        end
        if getkasa.itemid > 2160 or getkasa.itemid < 2160 then
            doPlayerSendTextMessage(cid,22,"Place 5, 10, 25 or 50 Crystal Coins if you want to play.")
        end
        
        if getkasa.itemid == 2160 and getkasa.type == 1 or getkasa.itemid == 2160 and getkasa.type == 2 or getkasa.itemid == 2160 and getkasa.type == 3 or getkasa.itemid == 2160 and getkasa.type == 4 or getkasa.itemid == 2160 and getkasa.type == 6 or getkasa.itemid == 2160 and getkasa.type == 7 or getkasa.itemid == 2160 and getkasa.type == 8
        or getkasa.itemid == 2160 and getkasa.type == 9 or getkasa.itemid == 2160 and getkasa.type == 11 or getkasa.itemid == 2160 and getkasa.type == 12 or getkasa.itemid == 2160 and getkasa.type == 13 or getkasa.itemid == 2160 and getkasa.type == 14 or getkasa.itemid == 2160 and getkasa.type == 15 or getkasa.itemid == 2160 and getkasa.type == 16
        or getkasa.itemid == 2160 and getkasa.type == 17 or getkasa.itemid == 2160 and getkasa.type == 18 or getkasa.itemid == 2160 and getkasa.type == 19 or getkasa.itemid == 2160 and getkasa.type == 20 or getkasa.itemid == 2160 and getkasa.type == 21 or getkasa.itemid == 2160 and getkasa.type == 22 or getkasa.itemid == 2160 and getkasa.type == 23
        or getkasa.itemid == 2160 and getkasa.type == 24 or getkasa.itemid == 2160 and getkasa.type == 26 or getkasa.itemid == 2160 and getkasa.type == 27 or getkasa.itemid == 2160 and getkasa.type == 28 or getkasa.itemid == 2160 and getkasa.type == 29 or getkasa.itemid == 2160 and getkasa.type == 30 or getkasa.itemid == 2160 and getkasa.type == 31
        or getkasa.itemid == 2160 and getkasa.type == 32 or getkasa.itemid == 2160 and getkasa.type == 33 or getkasa.itemid == 2160 and getkasa.type == 34 or getkasa.itemid == 2160 and getkasa.type == 35 or getkasa.itemid == 2160 and getkasa.type == 36 or getkasa.itemid == 2160 and getkasa.type == 37 or getkasa.itemid == 2160 and getkasa.type == 38
        or getkasa.itemid == 2160 and getkasa.type == 39 or getkasa.itemid == 2160 and getkasa.type == 40 or getkasa.itemid == 2160 and getkasa.type == 41 or getkasa.itemid == 2160 and getkasa.type == 42 or getkasa.itemid == 2160 and getkasa.type == 43 or getkasa.itemid == 2160 and getkasa.type == 44 or getkasa.itemid == 2160 and getkasa.type == 45
        or getkasa.itemid == 2160 and getkasa.type == 46 or getkasa.itemid == 2160 and getkasa.type == 47 or getkasa.itemid == 2160 and getkasa.type == 48 or getkasa.itemid == 2160 and getkasa.type == 49 or getkasa.itemid == 2160 and getkasa.type > 50 then
            doPlayerSendTextMessage(cid,22,"Place 5, 10, 25 or 50 Crystal Coins if you want to play.")
        end 
    end
end