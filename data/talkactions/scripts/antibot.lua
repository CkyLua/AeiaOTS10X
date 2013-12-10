local config = {
code = 999,
ptime = 998, -- player time storage
ttime = 997, -- target time storage
nick = false,
afk = false, -- if you use afk system set it to: true
afks = 996 -- storage of your afk system
}
local function randomCode()
    return math.random(1000, 9999)
end
local function czas(timeDiff)
    local dateFormat = {
        {"day", timeDiff / 60 / 60 / 24},
        {"hour", timeDiff / 60 / 60 % 24},
        {"minute", timeDiff / 60 % 60},
        {"second", timeDiff % 60}
    }
    local out = {}
    for k, t in ipairs(dateFormat) do
        local v = math.floor(t[2])
        if(v > 60) then
            table.insert(out, (k < #dateFormat and (#out > 0 and ', ' or '') or ' and ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        elseif(v > 0) then
            table.insert(out, (k < #dateFormat and (#out > 0 and ', ' or '') or '') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end
    return table.concat(out)
end 
local function check(cid, target)
    local code = randomCode()
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: You check "..getCreatureName(target)..".")
    doPlayerSendTextMessage(target, MESSAGE_STATUS_WARNING, "[AntiBot]: "..(config.nick == true and getCreatureName(cid) or "Someone").." checked you. You must write /check "..code.." if you don't want to be banished. You have only 5 minutes.")
    setPlayerStorageValue(target, config.code, code)
    setPlayerStorageValue(target, config.ttime, os.time() + (30))
    setPlayerStorageValue(cid, config.ptime, os.time() + (30))
    addEvent(function()
        if(isPlayer(target) == false) then
            return false
        elseif(getPlayerStorageValue(target, config.code) == 0) then
            return false
        end
        doPlayerSendTextMessage(target, MESSAGE_STATUS_WARNING, "[AntiBot]: You have only 1 minute. Please write /check "..getPlayerStorageValue(target, config.code)..".")
        addEvent(function()
            if(isPlayer(target) == false) then
                return false
            elseif(getPlayerStorageValue(target, config.code) == 0) then
                return false
            end
            doAddAccountBanishment(getPlayerAccountId(target), target, os.time() + 10 * 3600, 12, 2, 'Banished by AntiBot System', 0)
            doRemoveCreature(target)
        end, 60 * 1000, {target = target, config = config})
    end, 5 * 60 * 1000, {target = target, config = config, cid = cid})
end
function onSay(cid, words, param, channel)
    if(param == "") then
        return doPlayerPopupFYI(cid, "Welcome in AntiBot Information.\nScript author: Karpio\nScript Version: 1.1\n\nMini tutorial:\n/check nick - if you want check player with name nick\n/check code - if someone check you\n\nYou can check next player "..((getPlayerStorageValue(cid, config.ptime) - os.time()) > 0 and "after "..czas(getPlayerStorageValue(cid, config.ptime) - os.time()) or "now")..".\nYou can be check "..((getPlayerStorageValue(cid, config.ttime) - os.time()) > 0 and "after "..czas(getPlayerStorageValue(cid, config.ttime) - os.time()) or "now")..".")
    elseif tonumber(param) then
        if(getPlayerStorageValue(cid, config.code) < 1) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: If you want check code, you must be checked by other player.")
        elseif(getPlayerStorageValue(cid, config.code) ~= tonumber(param)) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: Invalid code.")
        end
        setPlayerStorageValue(cid, config.code, 0)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: Code is correct.")
        return true
    else
        if(getPlayerByNameWildcard(param) == nil) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: Target not found.")
        elseif(getPlayerByNameWildcard(param) == tonumber(cid)) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: You can not check yourself.")
        elseif(getTileInfo(getCreaturePosition(cid)).protection == true) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: You can not check players if you are in protection zone.")
        elseif(getTileInfo(getCreaturePosition(getPlayerByNameWildcard(param))).protection == true) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: You can not check this players, because "..(getPlayerSex(getPlayerByNameWildcard(param)) == 0 and "she" or "he").." is in protection zone.")
        elseif(config.afk and getPlayerStorageValue(cid, config.afks) > 0) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: You can not check players if you are afk.")
        elseif(config.afk and getPlayerStorageValue(getPlayerByNameWildcard(param), config.afks) > 0) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: You can not check this players, because "..(getPlayerSex(getPlayerByNameWildcard(param)) == 0 and "she" or "he").." is afk.")
        elseif(getPlayerStorageValue(cid, config.ptime) > os.time()) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: You must rest if you want check next player.")
        elseif(getPlayerStorageValue(getPlayerByNameWildcard(param), config.ttime) > os.time()) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[AntiBot]: You can not check this player.")
        end
        check(cid, getPlayerByNameWildcard(param))      
    end
return true
end  