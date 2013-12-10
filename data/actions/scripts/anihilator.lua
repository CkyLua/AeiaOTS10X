--Anihilator Script by Rahim
local monsters = {  --lv, do ktorego jest dany potwor  ->  nazwa potwora.
    [100] = "demon",
    [150] = "orshabaal",
    [200] = "ghazbaran"
    }
local items = {  --nagrody. [item.uid skrzynki] = item.1740
    [8000] = 2494,
    [8001] = 2400,
    [8002] = 2431,
    [8003] = 2112
}
local config = {
    --Dzwignia
    storage = 6217411,
    tylkoRaz = "yes", --czy gracz, ktory wykonal juz raz quest, nie moze wykonac po raz drugi. Nagrod tak czy siak juz nie otrzyma.
    lvl = 100, --level wymagany.
    tylkoRazNaDzien = "no", --czy quest mozna wykonac tylko raz dziennie
    summonowacPotwory = "no", --czy skrypt ma sam summonowac potwory. Nie, jesli masz juz je ustawione w mapie.
    --Pozycje do dzwigni
    players = {  --pozycje graczy
        {x=1224, y=969, z=11, stackpos=253},
        {x=1223, y=969, z=11, stackpos=253},
        {x=1222, y=969, z=11, stackpos=253},
        {x=1221, y=969, z=11, stackpos=253}},
    npos = {  --pozycje graczy po teleportowaniu
        {x=1224, y=969, z=12},
        {x=1223, y=969, z=12},
        {x=1222, y=969, z=12},
        {x=1221, y=969, z=12}},
    monsterPos = {  --nazwy i pozycje potworow.
        {"Demon",{x=1659,y=339,z=13,stackpos=253}},
        {"Demon",{x=1661,y=339,z=13,stackpos=253}},
        {"Demon",{x=1660,y=343,z=13,stackpos=253}},
        {"Demon",{x=1662,y=343,z=13,stackpos=253}},
        {"Demon",{x=1663,y=341,z=13,stackpos=253}},
        {"Demon",{x=1664,y=341,z=13,stackpos=253}}
        }
}
local function getMonster(lv)
    local x = 100
    for i = 2, 4 do
        if(monsters[i*50] > lv) then
            x = monsters[i*50]
        end
    end
    return monsters[x]
end
function onUse(cid, item, frompos, item2, topos)
    if item.itemid == 1945 then
        local tbl = {}
        for k, v in pairs(config.players) do
            local player = getThingfromPos(v)
            if(not isPlayer(player.uid)) then
                doPlayerSendCancel(cid, "You need four players for this quest.")
                return TRUE
            end
            if(getPlayerLevel(player.uid) < config.lvl) then
                doPlayerSendCancel(cid,"Somebody in your team hasn't required level!")
                return TRUE
            end
            if(config.tylkoRaz == "tak") then
                if(getPlayerStorageValue(player.uid,config.storage) == 1) then
                    doPlayerSendCancel(cid,"Somebody in your team already has a quest.")
                    return TRUE
                end
            end
            table.insert(tbl, player.uid)
        end
        for i, v in ipairs(tbl) do
            doTeleportThing(v, config.npos[i])
            doSendMagicEffect(config.npos[i], 12)
            doSendAnimatedText(config.npos[i], "Fight!", 192)
        end
        if(config.tylkoRazDziennie == "yes") then
            doTransformItem(item.uid,item.itemid+1)
        end
        if(config.summonowacPotwory ~= "yes") then
            return TRUE
        end
        local lv = getPlayerLevel(cid)
        for k, v in pairs(config.monsterPos) do
            local monster = getThingfromPos(v[2])
            if monster.uid > 0 then  --jesli skrypt znajdzie jakiegos potwora na miejscu summonowania, to go zabije .(moglbym uzyc doRemoveCreature, lecz na ariesach tego nie ma. Jesli masz TFS'a, smialo mozesz to podmienic :))
                doCreatureAddHealth(monster.uid, -9999999999)
            end
            doSummonCreature(getMonster(lv), v[2])
            doSendMagicEffect(v[2], CONST_ME_MAGIC_BLUE)
        end
        return TRUE
    end
    if(getPlayerStorageValue(cid,config.storage) == 1) then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This's empty.")
        return TRUE
    end
    local nagroda = items[item.uid]
    if(not nagroda) then
        return FALSE
    end
    doPlayerAddItem(cid, nagroda, 1)
    setPlayerStorageValue(cid, config.storage, 1)
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a " .. getItemName(nagroda) .. ".")
    return TRUE
end