local requiredTime = 60 * 60 * 24 * 30
function onThink(interval, lastExecution)
doSaveServer()
	local result_plr = db.getResult("SELECT * FROM `houses`;")
	if(result_plr:getID() ~= -1) then
	while(true) do

		local owner = tonumber(result_plr:getDataInt("owner"))
		local hid = tonumber(result_plr:getDataInt("id"))
		local lastlogin = 0
		local result = db.getResult("SELECT * FROM `players` WHERE `id` = ".. owner ..";")
		if(result:getID() ~= -1) then
			while(true) do

			lastlogin = tonumber(result:getDataInt("lastlogin"))

			if not(result:next()) then
				break
			end

		end

		result:free()
		end
		
		if lastlogin < os.time(t) - requiredTime then
			setHouseOwner(hid, 0, true)
		end

	if not(result_plr:next()) then
	break
	end

	end

	result_plr:free()
	end
return TRUE
end