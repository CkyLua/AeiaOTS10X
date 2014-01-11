function onLogin(cid)
	local player = Player(cid)

	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	player:setStorageValue(30019, 1)
	player:registerEvent("Mail")
	player:registerEvent("GuildMotd")
	player:registerEvent("remover")
	player:registerEvent("FirstItems")
	player:registerEvent("ReportBug")
	player:registerEvent("KilledMonstersCounter")
	player:registerEvent("Advance")
	player:registerEvent("demonOakLogout")
	player:registerEvent("demonOakDeath")
	player:registerEvent("CreateTeleport")
	player:registerEvent("MoneyReward")
	
	player:registerEvent("KillingInTheNameOf")
	player:registerEvent("taskw")
	return true 
end
