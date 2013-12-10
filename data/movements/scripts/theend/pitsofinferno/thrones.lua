local throneTable = {
	{uniqueId = 10274, name = 'Verminor'},
	{uniqueId = 10275, name = 'Infernatil'},
	{uniqueId = 10276, name = 'Tafariel'},
	{uniqueId = 10277, name = 'Apocalypse'},
	{uniqueId = 10278, name = 'Pumin'},
	{uniqueId = 10279, name = 'Bazir'},
	{uniqueId = 10280, name = 'Ashfalor'}
	}

function onStepIn(cid, item, pos)
	for _, throne in pairs(throneTable) do
		if(item.uid == throne.uniqueId) then
			if(getPlayerStorageValue(cid, throne.uniqueId) < 1) then
				setPlayerStorageValue(cid, throne.uniqueId, 1)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You have touched ' .. throne.name .. '\'s throne and absorbed some of his spirit.')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You have already absorbed some of ' .. throne.name .. '\'s spirit.')
			end
		end
	end
	return TRUE
end