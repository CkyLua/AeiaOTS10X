function onModalWindow(cid, modalWindowId, buttonId, choiceId)
	local rank = getCreatureStorage(cid, rankStorage)
	if rank < 0 then
		doCreatureSetStorage(cid, rankStorage, 0)
	end
					
	local r_string = function() if tasks[choiceId].repeatable then return "repeatable" end return "not repeatable" end
	local r_article_string = function (id, amount)
		task_item_word = ""
		if amount > 1 then
			task_item_word = task_item_word .. amount .. "x " .. getItemName(id)
		else
			if ItemType(itemId):getArticle() == "" then
				task_item_word = task_item_word .. getItemName(id)
			else
				task_item_word = task_item_word .. ItemType(itemId):getArticle() .. " " .. getItemName(id)
			end
		end
	return task_item_word
	end
	local storage_string = {[80000] = "The Snapper",
[80001] = "Demodras",
[80002] = "The Hide",
[80003] = "The Bloodtusk",
[80004] = "The Shardhead",
[80005] = "Thul",
[80006] = "Esmeralda",
[80007] = "The Old Widow",
[80008] = "The Many",
[80009] = "The Leviathan",
[80010] = "The Stonecracker",
[80011] = "The Noxious Spawn",
[80012] = "Merikh The Slaughterer",
[80013] = "Fahim The Wise",
[80014] = "pirate leader",
[80015] = "The Horned Fox",
[80016] = "Necropharus"
	}
	if (not modalWindowId == 1900) then return false end

	if buttonId == 1 then -- confirm task
		if getCreatureStorage(cid, tasks[choiceId].questStarted) < 1 then
			doCreatureSetStorage(cid, tasks[choiceId].questStarted, 1)
			doCreatureSetStorage(cid, tasks[choiceId].questStorage, 0)
			doCreatureSay(taskNPCuid, "In this mission you have to hunt " .. tasks[choiceId].killsRequired .. " " .. tasks[choiceId].raceName .. " down. Good luck!", TALKTYPE_PRIVATE_NP, false, cid, getThingPos(taskNPCuid))
		else
			if getCreatureStorage(cid, tasks[choiceId].questStarted) == 1 then
				if tasks[choiceId].killsRequired > getCreatureStorage(cid, tasks[choiceId].questStorage) then
					doPlayerPopupFYI(cid,"Status: Active\nKills: " .. getCreatureStorage(cid, tasks[choiceId].questStorage) .. "/" .. tasks[choiceId].killsRequired .. " (" .. tasks[choiceId].killsRequired - getCreatureStorage(cid, tasks[choiceId].questStorage) .. " left)\n\nThis mission is " .. r_string() .. ".")
					sendTaskWindow(cid)
				else
					doCreatureSetStorage(cid, tasks[choiceId].questStarted, 2)
					task_reward_str = "Reward(s):\n"
					for i = 1, table.maxn(tasks[choiceId].rewards) do
						if(tasks[choiceId].rewards[i].enable) then
							if isInArray({"boss", "teleport", 1}, tasks[choiceId].rewards[i].type) then
								doTeleportThing(cid, tasks[choiceId].rewards[i].values)
								task_reward_str = task_reward_str .. "You have been teleported.\n"
							elseif isInArray({"exp", "experience", 2}, tasks[choiceId].rewards[i].type) then
								doPlayerAddExperience(cid, tasks[choiceId].rewards[i].values)
								task_reward_str = task_reward_str .. "+ " .. tasks[choiceId].rewards[i].values .. " exp\n"
							elseif isInArray({"item", 3}, tasks[choiceId].rewards[i].type) then
								doPlayerAddItem(cid, tasks[choiceId].rewards[i].values[1], tasks[choiceId].rewards[i].values[2])
								task_reward_str = task_reward_str .. r_article_string(tasks[choiceId].rewards[i].values[1], tasks[choiceId].rewards[i].values[2]) .. "\n"
							elseif isInArray({"money", 4}, tasks[choiceId].rewards[i].type) then
								doPlayerAddMoney(cid, tasks[choiceId].rewards[i].values)
								task_reward_str = task_reward_str .. "+ " .. tasks[choiceId].rewards[i].values .. " gp\n"
							elseif isInArray({"storage", "stor", 5}, tasks[choiceId].rewards[i].type) then
								doCreatureSetStorage(cid, tasks[choiceId].rewards[i].values[1], tasks[choiceId].rewards[i].values[2])
								task_reward_str = task_reward_str .. "Chance to duel " .. storage_string[tasks[choiceId].rewards[i].values[1]] .. ".\n"
							elseif isInArray({"points", "rank", 2}, tasks[choiceId].rewards[i].type) then
								doCreatureSetStorage(cid, rankStorage, getCreatureStorage(cid, rankStorage) + tasks[choiceId].rewards[i].values)
								task_reward_str = task_reward_str .. "+ " .. tasks[choiceId].rewards[i].values .. " rank points.\n"
							else
								print("[Warning - Npc::KillingInTheNameOf] Wrong reward type: " .. (tasks[choiceId].rewards[i].type or "nil") .. ", reward could not be loaded.")
							end
						end
					end
					if task_reward_str == "Reward(s):\n" then
						doPlayerPopupFYI(cid,task_reward_str .. "none")
					else
						doPlayerPopupFYI(cid,task_reward_str)
					end
					doCreatureSay(taskNPCuid, "Great job" .. (((rank > 4 and rank < 10) and (", Huntsman") or (rank > 9 and rank < 20) and (", Ranger") or (rank > 19 and rank < 30) and (", Big Game Hunter") or (rank > 29 and rank < 50) and (", Trophy Hunter") or (rank > 49) and (", Elite Hunter")) or ", my Beginner") .. "! Here is your reward. Keep hunting and good luck!", TALKTYPE_PRIVATE_NP, false, cid, getThingPos(taskNPCuid))
				end
			else
				if tasks[choiceId].repeatable then
					for i = 1, table.maxn(tasks[choiceId].rewards) do
						if isInArray({"storage", "stor", 5}, tasks[choiceId].rewards[i].type) then
							doPlayerPopupFYI(cid,"To repeat this mission again, fight with " .. storage_string[tasks[choiceId].rewards[i].values[1]] .. " first.")
							break
						end
						if i == table.maxn(tasks[choiceId].rewards) then
							doPlayerPopupFYI(cid,"You can't repeat this mission.")
						end
					end
				else
					doPlayerPopupFYI(cid,"You can't repeat this mission.")
				end
				sendTaskWindow(cid)
			end
		end
	elseif buttonId == 255 then
		doPlayerPopupFYI(cid,"Please use a button.")
		sendTaskWindow(cid)
	end
	
return true
end