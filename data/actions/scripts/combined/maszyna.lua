function onUse(cid, item, frompos, item2, topos)
polaczenie = {x=1580, y=1454, z=7, stackpos=255}
	if (getPlayerStorageValue(cid,35106) > 1) then
		if (getPlayerStorageValue(cid,35107) > 1) then
			if (getPlayerStorageValue(cid,35108) > 1) then
				if (getPlayerStorageValue(cid,35109) > 1) then
					doTeleportThing(cid, polaczenie)
					doSendMagicEffect(polaczenie,10)
					doPlayerSendTextMessage(cid,22,"Were you able to fix the machine...")
				else
				    doPlayerSendTextMessage(cid,22,"Bzz..bzzt..")
				end
			else
			    doPlayerSendTextMessage(cid,22,"Bzz..bzzt..")				
			end
		else
		    doPlayerSendTextMessage(cid,22,"Bzz..bzzt..")			
		end
	else
	    doPlayerSendTextMessage(cid,22,"Bzz..bzzt..")
	end
return true
end