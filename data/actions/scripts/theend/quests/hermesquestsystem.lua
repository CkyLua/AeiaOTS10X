function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerCustomFlagValue(cid, PlayerCustomFlag_GamemasterPrivileges) == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You are not allowed to get rewards from quests.")
		return TRUE
	end
	if isInArray({1990, 2400, 2431, 2494}, item.uid) == TRUE then
		if getPlayerStorageValue(cid, 30015) < 0 then
			if getPlayerFreeCap(cid) >= getItemWeightById(item.uid, 1, FALSE) then
				if item.uid == 1990 then
					local container = doPlayerAddItem(cid, 1987, 1)
					doAddContainerItem(container, 2326, 1)
				else
					doPlayerAddItem(cid, item.uid, 1)
				end
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a ' .. getItemNameById(item.uid) .. '.')
				setPlayerStorageValue(cid, 30015, 1)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a ' .. getItemNameById(item.uid) .. ' weighing ' .. getItemWeightById(item.uid, 1, FALSE) .. ' oz it\'s too heavy.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		end
	end
	for _, questTable in pairs(questList) do
		if(isInArray({questTable.uniqueId}, item.uid) == TRUE) then
			if(getPlayerStorageValue(cid, questTable.uniqueId) < 0) then
				if(getPlayerLevel(cid) < questTable.neededLevel) then
					doPlayerSendCancel(cid, "You need to have " .. questTable.neededLevel .. " level to open this chest")
					return TRUE
				end
				local itemWeight = getItemWeightById(questTable.itemReward, 1, FALSE)
				if(getPlayerFreeCap(cid) < itemWeight) then
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a ' .. getItemNameById(questTable.itemReward) .. ' weighing ' .. itemWeight .. ' oz it\'s too heavy.')
					return TRUE
				end
				if(questTable.experience > 0 and questTable.itemReward > 0) then
					doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found " .. getItemArticleById(questTable.itemReward) .. " " .. getItemNameById(questTable.itemReward) .. " and gained " .. questTable.experience .. " experience points.")
					doPlayerAddItem(cid, questTable.itemReward, 1)
					doPlayerAddExp(cid, questTable.experience)
					doSendAnimatedText(getPlayerPosition(cid), '' .. questTable.experience .. '', 215)
				elseif(questTable.experience == 0) then
					doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found " .. getItemArticleById(questTable.itemReward) .. " " .. getItemNameById(questTable.itemReward) .. ".")
					doPlayerAddItem(cid, questTable.itemReward, 1)
				elseif(questTable.itemReward == 0) then
					doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have gained " .. questTable.experience .. " experience points.")
					doPlayerAddExp(cid, questTable.experience)
					doSendAnimatedText(getPlayerPosition(cid), '' .. questTable.experience .. '', 215)
				end
				setPlayerStorageValue(cid, questTable.uniqueId, 1)
				return TRUE
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
			end
		else
			return FALSE
		end
	end
	return TRUE
end