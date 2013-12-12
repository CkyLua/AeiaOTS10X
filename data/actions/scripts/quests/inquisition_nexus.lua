-- Inquisition Nexus

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5906 then
   		queststatus = getPlayerStorageValue(cid,5904)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,"You Destroy a Shadow of Nexus.")
   			setPlayerStorageValue(cid,5904,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,"Nexus has Destroyed.")
   		end
	else
		return 0
   	end

   	return 1
end
