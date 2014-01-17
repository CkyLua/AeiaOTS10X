function onUse(cid, item, frompos, itemEx, topos)
if exhaustion.get(cid, 6100) ~= false then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "You cannot use this object that fast.")
return true
else
exhaustion.set(cid, 6100, 2)

tokens = {16003, 18423, 18422, 6527}
values = {"star", "point", "minor token", "christmas token"}

store = {
			-- christmas stuff
			[5556] = {id = 11255, count = 1, token = 4, cost = 500},
			[5557] = {id = 11263, inside = {}, count = 1, token = 4, cost = 75},
			[5558] = {id = 6388, count = 1, token = 4, cost = 5},
			[5559] = {id = 6502, count = 1, token = 4, cost = 10},
			[5560] = {id = 6531, count = 1, token = 4, cost = 50},
			[5561] = {id = 6512, count = 1, token = 4, cost = 100},
			-- sets
			[5562] = {id = 2003, inside = {{2169, 1},{11374, 1},{2457, 1}, {11303, 1}, {8891, 1}, {11304, 1}, {8853, 1}, {7363, 100}}, count = 1, token = 2, cost = 40, name = "paladin set"},
			[5563] = {id = 10522, inside = {{2207, 1},{2200, 1},{2491, 1}, {7457, 1}, {2487, 1}, {2488, 1}, {2392, 1}, {2519, 1}, {2789, 100}}, count = 1, token = 2, cost = 40, name = "crown set"},
			[5564] = {id = 3940, inside = {{2168, 1},{7887, 1},{7903, 1}, {7886, 1}, {7884, 1}, {7885, 1}, {2181, 1}, {8902, 1}, {2789, 100}}, count = 1, token = 2, cost = 40, name = "terra set"},
			[5565] = {id = 5949, inside = {{2167, 1},{7889, 1},{7901, 1}, {7893, 1}, {7898, 1}, {7895, 1}, {2189, 1}, {8902, 1}, {2789, 100}}, count = 1, token = 2, cost = 40, name = "lightning set"},
			[5566] = {id = 2002, inside = {{2165, 1},{7888, 1},{7902, 1}, {7892, 1}, {7897, 1}, {7896, 1}, {8911, 1}, {8902, 1}, {2789, 100}}, count = 1, token = 2, cost = 40, name = "glacier set"},
			[5567] = {id = 2000, inside = {{2214, 1},{7890, 1},{7900, 1}, {7891, 1}, {7899, 1}, {7894, 1}, {8921, 1}, {8902, 1}, {2789, 100}}, count = 1, token = 2, cost = 40, name = "magma set"},
			-- common unit
			[5568] = {id = 9933, count = 1, token = 2, cost = 40},
			[5569] = {id = 6132, count = 1, token = 2, cost = 50},
			[5570] = {id = 10521, inside = {}, count = 1, token = 2, cost = 35},
			[5571] = {id = 8299, count = 5, token = 2, cost = 15},
			[5572] = {id = 15431, count = 1, token = 2, cost = 10},
			[5573] = {id = 18422, count = 30, token = 2, cost = 10},
			-- pirate unit
			[5574] = {id = 6099, count = 1, token = 2, cost = 10},
			[5575] = {id = 6100, count = 1, token = 2, cost = 10},
			[5576] = {id = 6101, count = 1, token = 2, cost = 10},
			[5577] = {id = 6102, count = 1, token = 2, cost = 10},
			-- addon items unit
			[5578] = {id = 5015, count = 1, token = 2, cost = 40},
			[5579] = {id = 5919, count = 1, token = 2, cost = 40},
			[5580] = {id = 9955, count = 1, token = 2, cost = 40},
			[5581] = {id = 5804, count = 1, token = 2, cost = 40},
			-- middle unit
			[5582] = {id = 8306, count = 1, token = 3, cost = 15},
			[5583] = {id = 8300, count = 1, token = 3, cost = 25},
			[5584] = {id = 12543, count = 1, token = 3, cost = 5},
			[5585] = {id = 5080, count = 1, token = 3, cost = 40},
			[5586] = {id = 12540, count = 1, token = 3, cost = 20},
			[5587] = {id = 9998, count = 1, token = 3, cost = 10},
			[5588] = {id = 6571, count = 1, token = 3, cost = 20},
			[5589] = {id = 6570, count = 1, token = 3, cost = 10},
			-- middle
			[5590] = {id = 2361, count = 1, token = 3, cost = 40},
			[5591] = {id = 6527, count = 10, token = 3, cost = 5},
			-- green left
			[5592] = {id = 2523, count = 1, token = 1, cost = 5},
			[5593] = {id = 2508, count = 1, token = 1, cost = 5},
			[5594] = {id = 18423, count = 60, token = 1, cost = 1},
			[5595] = {id = 12648, count = 1, token = 1, cost = 3},
			-- green right
			[5596] = {id = 8852, count = 1, token = 1, cost = 5},
			[5597] = {id = 18452, count = 1, token = 1, cost = 3},
			[5598] = {id = 18451, count = 1, token = 1, cost = 3},
			[5599] = {id = 18450, count = 1, token = 1, cost = 3},
			-- mounts
			[5600] = {id = 44, token = 2, cost = 40, name = "a wyvern"},
			[5601] = {id = 46, token = 2, cost = 40, name = "a toad"},
			[5602] = {id = 34, token = 2, cost = 40, name = "the Steelbeak"},
			[5603] = {id = 45, token = 2, cost = 40, name = "a nightmare"},
			[5604] = {id = 24, token = 2, cost = 40, name = "a shadow draptor"},
			[5605] = {id = 38, token = 2, cost = 40, name = "a crystal cavebear"},
			[5606] = {id = 36, token = 2, cost = 40, name = "an chocolate scorpion"},
			[5607] = {id = 33, token = 2, cost = 40, name = "a crimson ray"},
			[5608] = {id = 23, token = 2, cost = 40, name = "a horse"},
			-- services
			[5609] = {id = 51, token = 2, cost = 10, name = "unjustified kills removal service"},
			[5610] = {id = 52, token = 2, cost = 10, name = "stamina refill service"},
			[5611] = {id = 53, token = 2, cost = 40, name = "an Entrepreneur outfit"}
			-- [5650] = {id = 0, inside = {}, count = 0, token = 0, cost = 0, name = "last registered actionid"}
		}


	if store[item.actionid] ~= nil then
	local product = store[item.actionid]
	weight = getItemWeight(product.id, product.count)
	a = "a"
	if product.name ~= nil then
		c = product.name
	else
		if product.id <= 50 then
			c = "a mount number " .. product.id
		else
			if product.id < 1000 then
				c = "a service number " .. product.id
			else
				c = getItemName(product.id)
			end
		end
	end

		if product.cost > 1 then s = "s" else s = "" end
		if product.cost == 1 then a = "a " .. values[product.token] else a = product.cost .. " " .. values[product.token] .. "s" end
		if product.name ~= nil then c = product.name else if product.count > 1 then c = product.count .. " " .. ItemType(product.id):getPluralName() else c = ItemType(product.id):getArticle() .. " " .. getItemName(product.id) end end
		
		if product.inside ~= nil then
			for q = 1, table.maxn(product.inside) do
			weight = weight + getItemWeight(product.inside[q][1], product.inside[q][2])
			end
		end
		if getPlayerItemCount(cid, tokens[product.token]) >= product.cost then
			-- common item
			if product.id > 1000 then
				if(getPlayerFreeCap(cid) >= weight) then
					if (doPlayerAddItemEx(cid, doCreateItemEx(cid, product.id, product.count)) == RETURNVALUE_NOERROR) then
						doPlayerTakeItem(cid, tokens[product.token], product.cost)
						if isContainer(getPlayerItemById(cid, true, product.id).uid) then
							if table.maxn(product.inside) > 0 then
								for p = 1, table.maxn(product.inside) do
									doAddContainerItem(getPlayerItemById(cid, true, product.id).uid, product.inside[p][1], product.inside[p][2])
								end
							end
						end
						doPlayerSendTextMessage(cid, 20, "Bought " .. c .. " for " .. a .. ".")
					else
						doPlayerSendTextMessage(cid, 20, "You have no room to take it.")
					end
				else
					doPlayerSendTextMessage(cid, 20, "You need " .. string.format("%.2f", weight) .. " oz of free capacity to buy this item.")
				end
			else
				-- mount
				mount_storage = 16000 + product.id
				if product.id <= 50 then
					if getPlayerStorageValue(cid, mount_storage) < 1 then
						if doPlayerTakeItem(cid, tokens[product.token], product.cost) then
							d = product.name
							if product.name == nil then d = "a mount number " .. product.id end
							doPlayerAddMount(cid, product.id)
							setPlayerStorageValue(cid, mount_storage, 1)
							doPlayerSendTextMessage(cid, 20, "Bought " .. d .. " for " .. a .. ".")
						else
							doPlayerSendTextMessage(cid, 20, "Cannot perform action.")
						end
					else
						doPlayerSendTextMessage(cid, 20, "You already own this mount.")
					end
				else
				-- services
					if product.id == 51 then
						unremovable_skulls = {
										SKULL_NONE,
										SKULL_YELLOW,
										SKULL_GREEN,
										SKULL_WHITE,
										SKULL_ORANGE
								}
					 
						if isInArray(unremovable_skulls, Player(cid):getSkull()) then
							doPlayerSendTextMessage(cid, 20, "Nothing happend.")
							return true
						else
							if doPlayerTakeItem(cid, tokens[product.token], product.cost) then
							customer = getPlayerGUID(cid)
							doRemoveCreature(cid)
							db.query("UPDATE `players` SET `skulltime` = '2000' WHERE `players`.`id` = " .. customer .. ";")
							else
								doPlayerSendTextMessage(cid, 20, "Cannot perform action.")
							end
						end
					return true
					elseif product.id == 52 then
						if(Player(cid):getStamina() >= 2100) then
								doPlayerSendTextMessage(cid, 20, "You are in good condition.")
						else
							if doPlayerTakeItem(cid, tokens[product.token], product.cost) then
								Player(cid):setStamina(2520)
								doPlayerSendTextMessage(cid, 20, "Your stamina has been refilled.")
							else
								doPlayerSendTextMessage(cid, 20, "Cannot perform action.")
							end
						end
						return true
					elseif product.id == 53 then
						if getPlayerStorageValue(cid, mount_storage) < 1 then
							if doPlayerTakeItem(cid, tokens[product.token], product.cost) then
								d = product.name
								if product.name == nil then d = "service number " .. product.id end
								doPlayerAddOutfit(cid, 471, 3)
								doPlayerAddOutfit(cid, 472, 3)
								setPlayerStorageValue(cid, mount_storage, 1)
								doPlayerSendTextMessage(cid, 20, "Bought " .. d .. " for " .. a .. ".")
							else
								doPlayerSendTextMessage(cid, 20, "Cannot perform action.")
							end
						else
							doPlayerSendTextMessage(cid, 20, "You already own this outfit.")
						end
					return true
					else
					doPlayerSendTextMessage(cid, 20, "Service unavailable.")
					end
				end
			end
		else
			if product.id <= 50 then
				mount_storage = 16000 + product.id
				if getPlayerStorageValue(cid, mount_storage) < 1 then
				d = product.name
				if product.name == nil then d = "a mount number " .. product.id end
					doPlayerSendTextMessage(cid, 20, "You need " .. a .. " to buy " .. d .. ".")
				else
					doPlayerSendTextMessage(cid, 20, "You already own this mount.")
				end
				return true
			elseif product.id == 53 then
				mount_storage = 16000 + product.id
				if getPlayerStorageValue(cid, mount_storage) < 1 then
				d = product.name
				if product.name == nil then d = "service number " .. product.id end
					doPlayerSendTextMessage(cid, 20, "You need " .. a .. " to buy " .. d .. ".")
				else
					doPlayerSendTextMessage(cid, 20, "You already own this outfit.")
				end
				return true
			else
				if product.id < 1000 then
				d = product.name
				if product.name == nil then d = "service number " .. product.id end
				doPlayerSendTextMessage(cid, 20, "You need " .. a .. " to buy " .. d .. ".")
				return true
				else
				doPlayerSendTextMessage(cid, 20, "You need " .. a .. " to buy " .. c .. ".")
				return true
				end
			end
		end
	else
		doPlayerSendTextMessage(cid, 20, "This tile is not registered correctly. Please report that issue to server administrator.")
		print("[Warning]: Token store: Player " .. getCreatureName(cid) .. " encountered a problem with trading tile of actionid " .. item.actionid .. ", position " .. topos.x .. " " .. topos.y .. " " .. topos.z .. ".\nThis tile is not registered in shop table.\nFile: data/actions/shop.lua")
	end
end
	return true
end