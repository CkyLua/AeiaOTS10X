local t, storage = {
    {50, 2160, 5},
	{100, 2160, 10}
}, 44563

function onAdvance(cid, skill, oldLevel, newLevel)
	local player = Player(cid)
	if skill ~= SKILL_LEVEL then
		return true
	end
	
	for i = 1, #t do
	local v = t[i]
        if newLevel >= v[1] and player:getStorageValue(storage) < i then
			player:addItem(v[2], v[3])
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been rewarded with " .. (isItemStackable(v[2]) and v[3] .. "" or getItemDescriptions(v[2]).article ~= "" and getItemDescriptions(v[2]).article .. " " or "") .. " " .. getItemDescriptions(v[2]).plural .. " for reaching level " .. v[1] .. "!")
			player:setStorageValue(storage, i)
            break
        end
    end
    return true
end