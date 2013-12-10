local config = {
positions = {
["Depot"] = { x = 1005, y = 996, z = 6 },  --{x = 1005, y = 995, z = 6}
["Monks"] = { x = 1005, y = 998, z = 6 },  --{x = 1005, y = 996, z = 6}
["Hunt TPs"] = { x = 1005, y = 1000, z = 6 }, --{x = 1005, y = 997, z = 6}
["Hunt"] = { x = 1035, y = 1001, z = 6 }, --fixed
["Trainers"] = { x = 1030, y = 994, z = 6 },
["Temple"] = { x = 1029, y = 994, z = 6 }, --fixed
["Runes"] = { x = 1027, y = 994, z = 7 }, --fixed
["Runes"] = { x = 1025, y = 994, z = 6 }, --fixed
["Quest"] = { x = 1025, y = 995, z = 6},     --fixed
["Vengoth"] = { x = 1000, y = 1000, z = 6 },  --{x = 1002, y = 997, z = 6}
["Town TPs"] = { x = 1000, y = 998, z = 6 }, --{x = 1002, y = 996, z = 6}
["INFO"] = { x = 1116, y = 1011, z = 8 },
["Quests"] = { x = 1000, y = 996, z = 6 },  --{x = 1002, y = 995, z = 6}
["Rotworms"] = { x = 1002, y = 1001, z = 6 }, --{x = 1005, y = 998, z = 6}
["Down"] = { x = 1002, y = 995, z = 6 },
["TPs"] = { x = 1006, y = 995, z = 7 },
["TPs"] = { x = 1006, y = 1001, z = 7 }
},

	effects = {
		CONST_ME_MAGIC_GREEN,
	},

	colors = {
		TEXTCOLOR_YELLOW
	}
}

function onThink(cid, interval, lastExecution)
	for text, pos in pairs(config.positions) do
		doSendMagicEffect(pos, config.effects[math.random(1, #config.effects)])
		doSendAnimatedText(pos, text, config.colors[math.random(1, #config.colors)])
	end
	return TRUE
end