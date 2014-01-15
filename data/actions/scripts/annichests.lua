local config = {
	[9000] = {9000, 2494},
	[9001] = {9001, 2400},
	[9002] = {9002, 2431}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local v = config[item.uid]
	if v then
		if player:getStorageValue(v[1]) < 1 then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You found a " .. ItemType(v[2]):getName() .. ".")
			player:addItem(v[2], 1)
			player:setStorageValue(v[1], 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Empty.")
		end
	end
	return true
end
