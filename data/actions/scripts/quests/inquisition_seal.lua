-- Poi Thrones

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 4073 then
   		queststatus = getPlayerStorageValue(cid,4072)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have saved the Crystal Caves.")
   			setPlayerStorageValue(cid,4072,1)
   		else
   			doPlayerSendTextMessage(cid,22,"This seal was saved.")
   		end
   	elseif item.uid == 4075 then
   		queststatus = getPlayerStorageValue(cid,4074)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have saved the Blood Hall.")
   			setPlayerStorageValue(cid,4074,1)
   		else
   			doPlayerSendTextMessage(cid,22,"This seal was saved.")
   		end
   	elseif item.uid == 4077 then
   		queststatus = getPlayerStorageValue(cid,4076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have saved the Vats.")
   			setPlayerStorageValue(cid,4076,1)
   		else
   			doPlayerSendTextMessage(cid,22,"This seal was saved.")
   		end
   	elseif item.uid == 4079 then
   		queststatus = getPlayerStorageValue(cid,4078)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have saved the Arcanum.")
   			setPlayerStorageValue(cid,4078,1)
   		else
   			doPlayerSendTextMessage(cid,22,"This seal was saved.")
   		end
   	elseif item.uid == 4081 then
   		queststatus = getPlayerStorageValue(cid,4080)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have saved the Hive.")
   			setPlayerStorageValue(cid,4080,1)
   		else
   			doPlayerSendTextMessage(cid,22,"This seal was saved.")
   	   	
   		end
	else
		return 0
   	end

   	return 1
end
