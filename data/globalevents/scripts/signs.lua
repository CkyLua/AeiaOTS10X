local t = {
	{"Start\nHere", {x = 995, y = 994, z = 7}, CONST_ME_TELEPORT},
	{"TPs", {x = 1006, y = 994, z = 7}, CONST_ME_TELEPORT},
	
	{"Quests", {x = 1024, y = 996, z = 4}, CONST_ME_YELLOW_RINGS},
	{"Town TPs", {x = 1024, y = 998, z = 4}, CONST_ME_HITAREA},
	{"VIP", {x = 1024, y = 1000, z = 4}, CONST_ME_MAGIC_GREEN},
	{"Temple", {x = 1029, y = 996, z = 4}, CONST_ME_TELEPORT},
	{"Training", {x = 1029, y = 998, z = 4}, CONST_ME_DRAWBLOOD},
	{"Hunting", {x = 1029, y = 1000, z = 4}, CONST_ME_BLOCKHIT},
	
	{"INFO", {x = 1116, y = 1011, z = 8}, CONST_ME_MAGIC_GREEN},
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