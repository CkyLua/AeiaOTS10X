-- Inquisition Nexus

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5906 then
   		queststatus = getPlayerStorageValue(cid,5904)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You Destroy a Shadow of Nexus.")
   			setPlayerStorageValue(cid,5904,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Nexus has Destroyed.")
   		end
	else
		return 0
   	end

   	return 1
end
