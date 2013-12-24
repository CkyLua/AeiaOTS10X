local t = {
    {"Depot", {x = 1005, y = 996, z = 6}, CONST_ME_GREEN_RINGS},
    {"Trainers", {x = 1005, y = 998, z = 6}, CONST_ME_DRAWBLOOD},
    {"Hunt TPs", {x = 1005, y = 1000, z = 6}, CONST_ME_BLOCKHIT},
	{"Hunt TPs", {x = 1035, y = 1001, z = 6}, CONST_ME_BLOCKHIT},
	{"Trainers", {x = 1030, y = 994, z = 6}, CONST_ME_DRAWBLOOD},
	{"Temple", {x = 1029, y = 994, z = 6}, CONST_ME_TELEPORT},
	{"Runes", {x = 1025, y = 994, z = 6}, CONST_ME_HOLYDAMAGE},
	{"Runes", {x = 1027, y = 994, z = 7}, CONST_ME_HOLYDAMAGE},
	{"Quests", {x = 1025, y = 995, z = 6}, CONST_ME_YELLOW_RINGS},
	{"Vengoth", {x = 1000, y = 1000, z = 6}, CONST_ME_MORTAREA},
	{"Town TPs", {x = 1000, y = 998, z = 6}, CONST_ME_HITAREA},
	{"INFO", {x = 1116, y = 1011, z = 8}, CONST_ME_MAGIC_GREEN},
	{"Quests", {x = 1000, y = 996, z = 6}, CONST_ME_YELLOW_RINGS},
	{"Rotworms", {x = 1002, y = 1001, z = 6}, CONST_ME_CRAPS},
	{"Down", {x = 1002, y = 995, z = 6}, CONST_ME_TELEPORT},
	{"TPs", {x = 1006, y = 995, z = 7}, CONST_ME_TELEPORT},
	{"TPs", {x = 1006, y = 1001, z = 7}, CONST_ME_TELEPORT},
	
	
}

function onThink(interval)
    local people = getOnlinePlayers()
    if #people == 0 then
        return true
    end

    for i = 1, #t do
        local v = t[i]
        doCreatureSay(people[1], v[1], TALKTYPE_ORANGE_1, false, 0, v[2])
        doSendMagicEffect(v[2], v[3])
    end
    return true
end