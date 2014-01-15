-- based on addon npc, unknown source
-- you can't touch this
-- unless you know what are you doing
-- no support on adding pages, recipes from my site

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()                             npcHandler:onThink()                         end

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|.")

function craftItem(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    if (parameters.confirm ~= true) and (parameters.decline ~= true) then
        local itemsTable = parameters.items
        local items_list = ''
        if table.maxn(itemsTable) > 0 then
            for i = 1, table.maxn(itemsTable) do
                local item = itemsTable[i]
                items_list = items_list .. item[2] .. ' ' .. getItemNameById(item[1])
                if i ~= table.maxn(itemsTable) then
                    items_list = items_list .. ', '
                end
            end
        end
        local text = ''
        if (parameters.cost > 0) and table.maxn(parameters.items) then
            text = items_list .. ' and ' .. parameters.cost .. ' gold pieces'
        elseif (parameters.cost > 0) then
            text = parameters.cost .. ' gold pieces'
        elseif table.maxn(parameters.items) then
            text = items_list
        end
        npcHandler:say('Did you bring me ' .. text .. ' for ' .. keywords[1] .. '?', cid)
        return true
    elseif (parameters.confirm == true) then
        local craftNode = node:getParent()
        local crafttable = craftNode:getParameters()
        local items_number = 0
        if table.maxn(crafttable.items) > 0 then
            for i = 1, table.maxn(crafttable.items) do
                local item = crafttable.items[i]
                if (getPlayerItemCount(cid,item[1]) >= item[2]) then
                    items_number = items_number + 1
                end
            end
        end
        if(getPlayerMoney(cid) >= crafttable.cost) and (items_number == table.maxn(crafttable.items)) then
            doPlayerRemoveMoney(cid, crafttable.cost)
            if table.maxn(crafttable.items) > 0 then
                for i = 1, table.maxn(crafttable.items) do
                    local item = crafttable.items[i]
                    doPlayerRemoveItem(cid,item[1],item[2])
                end
            end
			failure = crafttable.chance
			if crafttable.chance == nil then failure = 100 end
			if math.random(1, 100) <= failure then
			    for i = 1, table.maxn(crafttable.rewards) do
                    local item = crafttable.rewards[i]
                    doPlayerAddItem(cid,item[1],item[2])
                end
            npcHandler:say('Here you are.', cid)
			return true
			else
			npcHandler:say("The steel broke and is completely useless. I can't finish this item.", cid)
			return true
			end
        else
            npcHandler:say('You do not have needed items!', cid)
        end
        npcHandler:resetNpc()
        return true
    elseif (parameters.decline == true) then
        npcHandler:say('Come back when you change your mind.', cid)
        npcHandler:resetNpc()
        return true
    end
    return false
end

local noNode = KeywordNode:new({'no'}, craftItem, {decline = true})
local yesNode = KeywordNode:new({'yes'}, craftItem, {confirm = true})

-- assembling
local craft_node = keywordHandler:addKeyword({"jester doll"}, craftItem, {cost = 5000, items = {{9694,1}, {9695,1}, {9696,1}, {9697,1}, {9698,1}, {9699,1}}, rewards = {{9693,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"helmet of the ancients"}, craftItem, {cost = 10000, items = {{2335,1}, {2336,1}, {2337,1}, {2338,1}, {2339,1}, {2340,1}, {2341,1}}, rewards = {{2342,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"koshei's ancient amulet"}, craftItem, {cost = 5000, items = {{8262,1}, {8263,1}, {8264,1}, {8265,1}}, rewards = {{8266,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
	
-- djinn, cyclops, mermaid (melting, crafting)
local craft_node = keywordHandler:addKeyword({"fighting spirit"}, craftItem, {cost = 0, items = {{2498,2}}, rewards = {{5884,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"warrior's sweat"}, craftItem, {cost = 0, items = {{2475,4}}, rewards = {{5885,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"spool of yarn"}, craftItem, {cost = 0, items = {{5879,10}}, rewards = {{5886,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"enchanted chicken wing"}, craftItem, {cost = 0, items = {{2195,1}}, rewards = {{5891,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"royal steel"}, craftItem, {cost = 0, items = {{2487,1}}, rewards = {{5887,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"hell steel"}, craftItem, {cost = 0, items = {{2462,1}}, rewards = {{5888,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"draconian steel"}, craftItem, {cost = 0, items = {{2516,1}}, rewards = {{5889,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"huge chunk of crude iron"}, craftItem, {cost = 0, items = {{2393,1}}, rewards = {{5892,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"magic sulphur"}, craftItem, {cost = 0, items = {{2392,3}}, rewards = {{5904,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
	
-- smithing, enchanting
local craft_node = keywordHandler:addKeyword({"horned helmet"}, craftItem, {cost = 0, items = {{2493,1}, {5880,25}, {5954,15}}, rewards = {{2496,1}}, chance = 40 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"dragon scale helmet"}, craftItem, {cost = 0, items = {{9970,15}, {2457,1}, {5920,50}}, rewards = {{2506,1}}, chance = 40 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"golden helmet"}, craftItem, {cost = 0, items = {{9971,50}, {2474,2}}, rewards = {{2471,1}}, chance = 30 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"winged helmet"}, craftItem, {cost = 0, items = {{5891,15}, {2496,2}}, rewards = {{2474,1}}, chance = 35 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"lavos armor"}, craftItem, {cost = 0, items = {{8878,1}, {6500,10}, {5889,5}}, rewards = {{8877,1}}, chance = 70 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"fireborn giant armor"}, craftItem, {cost = 0, items = {{2494,1}, {6500,10}, {5880,25}, {5888,10}}, rewards = {{8881,1}}, chance = 45 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"molten plate"}, craftItem, {cost = 0, items = {{8881,1}, {2472,1}, {6500,10}, {5887,15}}, rewards = {{8886,1}}, chance = 40 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"magic plate armor"}, craftItem, {cost = 0, items = {{2463,1}, {2466,1}, {5904,35}}, rewards = {{2472,1}}, chance = 60 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"divine plate"}, craftItem, {cost = 0, items = {{2466,1}, {5904,25}}, rewards = {{8885,1}}, chance = 75 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"swamplair armor"}, craftItem, {cost = 0, items = {{2463,1}, {8298,10}}, rewards = {{8880,1}}, chance = 70 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"dragon scale mail"}, craftItem, {cost = 0, items = {{8880,1}, {5920,20}}, rewards = {{2492,1}}, chance = 65 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"earthborn titan armor"}, craftItem, {cost = 0, items = {{2492,1}, {5910,25}, {8298,10}, {5886,10}}, rewards = {{8882,1}}, chance = 45 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"crystalline armor"}, craftItem, {cost = 0, items = {{2463,1}, {8302,10}, {2177,3}}, rewards = {{8878,1}}, chance = 70 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"frozen plate"}, craftItem, {cost = 0, items = {{8878,1}, {2472,1}, {8302,30}, {6500,10}}, rewards = {{8887,1}}, chance = 40 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"enchanted chain armor"}, craftItem, {cost = 0, items = {{8885,1}, {2464,1}, {5904,25}, {9971,10}}, rewards = {{2508,1}}, chance = 10 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"golden legs"}, craftItem, {cost = 0, items = {{5904,3}, {9971,2}, {2647,1}}, rewards = {{2470,1}}, chance = 70 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"dragon scale legs"}, craftItem, {cost = 0, items = {{2507,2}, {5910,25}, {5886,10}, {5920, 50}}, rewards = {{2469,1}}, chance = 30 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"golden boots"}, craftItem, {cost = 0, items = {{2645,1}, {5904,15}, {9971,10}}, rewards = {{2646,1}}, chance = 30 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"steel boots"}, craftItem, {cost = 0, items = {{2643,1}, {5887,2}, {5880,10}}, rewards = {{2645,1}}, chance = 70 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"patched boots"}, craftItem, {cost = 0, items = {{2195,1}, {7891,1}, {7457,1}}, rewards = {{2641,1}}, chance = 40 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"tempest shield"}, craftItem, {cost = 0, items = {{2183,2}, {7898,1}, {7895,1}, {2536,1}}, rewards = {{2542,1}}, chance = 55 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"great shield"}, craftItem, {cost = 0, items = {{2514,1}, {2492,2}, {5920,25}, {5904,15}}, rewards = {{2522,1}}, chance = 30 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"crown"}, craftItem, {cost = 15000, items = {{1985,1}, {1984,1}, {1983,1}, {1986, 1}, {1982, 1}, {9971,2}, {2149,1}}, rewards = {{2128,1}} })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"dragon slayer"}, craftItem, {cost = 0, items = {{7406,1}, {5882,5}, {5889,5}}, rewards = {{7402,1}}, chance = 70 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"ravenwing"}, craftItem, {cost = 0, items = {{2430,1}, {11314,10}, {9968,5}, {6500, 30}}, rewards = {{7433,1}}, chance = 70 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"stomper"}, craftItem, {cost = 0, items = {{8928,1}, {9690,6}, {5880,15}}, rewards = {{8929,1}}, chance = 70 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"reaper's axe"}, craftItem, {cost = 0, items = {{11305,1}, {2550,1}, {5888,15}, {6500, 50}, {11314,10}}, rewards = {{7420,1}}, chance = 65 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"ironworker"}, craftItem, {cost = 0, items = {{8849,1}, {9690,2}, {5888,10}, {5887,2}}, rewards = {{8853,1}}, chance = 65 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"havoc blade"}, craftItem, {cost = 0, items = {{2145,40}, {2149,10}, {2155,1}, {7422,1}, {7383,1}}, rewards = {{8853,1}}, chance = 60 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"calamity"}, craftItem, {cost = 0, items = {{8930,1}, {7417,1}, {5880,25}}, rewards = {{8932,1}}, chance = 60 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"ruthless axe"}, craftItem, {cost = 0, items = {{8601,2}, {5880,10}}, rewards = {{6553,1}}, chance = 40 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"mythril axe"}, craftItem, {cost = 0, items = {{2177,3}, {2361,1}, {8302,10}, {7456,2}}, rewards = {{7455,1}}, chance = 40 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"great axe"}, craftItem, {cost = 0, items = {{7453,1}, {6553,1}, {5880,25}}, rewards = {{2415,1}}, chance = 30 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"warlord sword"}, craftItem, {cost = 0, items = {{2446,1}, {7391,1}, {5880,25}}, rewards = {{2408,1}}, chance = 30 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"magic longsword"}, craftItem, {cost = 0, items = {{2400,1}, {2397,1}, {5880,10}, {5904,5}}, rewards = {{2390,1}}, chance = 30 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
local craft_node = keywordHandler:addKeyword({"divine wand"}, craftItem, {cost = 0, items = {{9971,3}, {5904,10}, {2401,1}, {2155,1}}, rewards = {{12648,1}}, chance = 5 })
    craft_node:addChildKeywordNode(yesNode)
    craft_node:addChildKeywordNode(noNode)
	
function creatureSayCallback(cid, type, msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	craftable = {
	[1] = {"jester doll", "helmet of the ancients", "Koshei's ancient amulet"},
	[2] = {"fighting spirit", "warrior's sweat", "spool of yarn", "enchanted chicken wing", "magic sulphur", "royal steel", "hell steel", "draconian steel", "huge chunk of crude iron", "infernal bolts"}
	}
	craftable_name = {
	[1] = "Assembling",
	[2] = "Melting, Crafting"
	}
	
	craftable2 = {
	[1] = {"dragon scale helmet (40%)", "horned helmet (40%)", "winged helmet (35%)", "golden helmet (30%)"},
	[2] = {"divine plate (75%)", "crystalline armor (70%)", "lavos armor (70%)", "swamplair armor (70%)", "dragon scale mail (65%)", "magic plate armor (60%)", "fireborn giant armor (45%)", "earthborn titan armor (45%)", "frozen plate (40%)", "molten plate (40%)", "enchanted chain armor (10%)"}
	}
	craftable_name2 = {
	[1] = "Helmets",
	[2] = "Armors"
	}
	
	craftable3 = {
	[1] = {"golden legs (70%)", "dragon scale legs (30%)"},
	[2] = {"steel boots (70%)", "patched boots (40%)", "golden boots (30%)"},
	[3] = {"tempest shield (55%)", "great shield (30%)"},
	[4] = {"crown"}
	}
	craftable_name3 = {
	[1] = "Legs",
	[2] = "Boots",
	[3] = "Shields",
	[4] = "Special"
	}
	
	craftable4 = {
	[1] = {"dragon slayer (70%)", "ravenwing (70%)", "stomper (70%)", "reaper's axe (65%)", "calamity (60%)", "havoc blade (60%)", "mythril axe (40%)", "ruthless axe (40%)", "great axe (30%)", "warlord sword (30%)", "magic longsword (30%)", "divine wand (5%)"}
	}
	craftable_name4 = {
	[1] = "Weapons"
	}
	
	local text = ""
	
	if talkState[talkUser] == 1 then
		if (not msgcontains(msg, "yes"))then
	    npcHandler:say('Come back when you change your mind.', cid)
		talkState[talkUser] = 0
        npcHandler:resetNpc()
		return true
		else
		bolts = (getPlayerItemCount(cid,5944) * 2)
		if getPlayerItemCount(cid,5944) > 0 then
		if doPlayerRemoveItem(cid,5944,getPlayerItemCount(cid,5944)) then
			doPlayerAddItem(cid,6529,bolts)
			npcHandler:say('Here you are.', cid)
		else
			npcHandler:say("You don't have needed items!", cid) -- if orbs couldn't be removed
		end
		else
			npcHandler:say("You don't have needed items!", cid) -- if backpack is empty
		end
		talkState[talkUser] = 0
        npcHandler:resetNpc()
		end
	else
	if msgcontains(msg, "orb") or (msgcontains(msg, "infernal") and msgcontains(msg, "bolt")) then
		if (getPlayerItemCount(cid,5944) > 1) then orbs = getPlayerItemCount(cid,5944) .. " orbs" else orbs = "your soul orb" end
		bolts = (getPlayerItemCount(cid,5944) * 2)
	    if (getPlayerItemCount(cid,5944) > 0) then
		npcHandler:say('Do you want to exchange ' .. orbs .. ' for ' .. bolts .. ' infernal bolts?', cid)
		talkState[talkUser] = 1
        else
		npcHandler:say('If you bring me some soul orbs, you may exchange them for infernal bolts.', cid)
        end
	end
	if msgcontains(msg, "list") and (not msgcontains(msg, "2")) and (not msgcontains(msg, "3")) and (not msgcontains(msg, "4")) then
	text = ""
	for i=1, #craftable do
	table.sort(craftable[i])
	local line = ""
	text = text .. line .. "    " .. craftable_name[i] .. ":\n        " .. table.concat(craftable[i], "\n        ") .. "\n\n"
    end
	npcHandler:say("Here.", cid)
	doPlayerPopupFYI(cid,"Available items:\n".. text .. "\n                                                                        Page 1/4")
	return true
	elseif msgcontains(msg, "2") and (not msgcontains(msg, "3")) and (not msgcontains(msg, "1")) and (not msgcontains(msg, "4")) then
	text = ""
	for i=1, #craftable2 do
	local line = ""
	text = text .. line .. "    " .. craftable_name2[i] .. ":\n        " .. table.concat(craftable2[i], "\n        ") .. "\n\n"
    end
	npcHandler:say("Here.", cid)
	doPlayerPopupFYI(cid,"Available items (chance)\nSmithing, Enchanting:\n".. text .. "\n                                                                        Page 2/4")
	return true
	elseif msgcontains(msg, "3") and (not msgcontains(msg, "2")) and (not msgcontains(msg, "1")) and (not msgcontains(msg, "4")) then
	text = ""
	for i=1, #craftable3 do
	local line = ""
	text = text .. line .. "    " .. craftable_name3[i] .. ":\n        " .. table.concat(craftable3[i], "\n        ") .. "\n\n"
    end
	npcHandler:say("Here.", cid)
	doPlayerPopupFYI(cid,"Available items (chance)\nSmithing, Enchanting:\n".. text .. "\n                                                                        Page 3/4")
	return true
	elseif msgcontains(msg, "4") and (not msgcontains(msg, "2")) and (not msgcontains(msg, "1")) and (not msgcontains(msg, "3")) then
	text = ""
	for i=1, #craftable4 do
	local line = ""
	text = text .. line .. "    " .. craftable_name4[i] .. ":\n        " .. table.concat(craftable4[i], "\n        ") .. "\n\n"
    end
	npcHandler:say("Here.", cid)
	doPlayerPopupFYI(cid,"Available items (chance)\nSmithing, Enchanting:\n".. text .. "\n                                                                        Page 4/4")
	return true	
	else
	npcHandler:say("Please use only one number.", cid)
	return true
	end
	end
	return true
end
keywordHandler:addKeyword({'craft'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Okay, just ask me for a '{list number}' and I will show you recipes, for example '{list 2}'."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'If you want to {trade} or {craft} something just ask.'})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())