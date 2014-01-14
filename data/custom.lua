ITEM_GOLD_INGOT = 9971
db.executeQuery = db.query
doBroadcastMessage = broadcastMessage
PROPOSED_STATUS = 1
MARRIED_STATUS = 2
LOOK_MARRIAGE_DESCR = TRUE
ITEM_WEDDING_RING = 2121
ITEM_ENGRAVED_WEDDING_RING = 10502
getCreatureStorage = getPlayerStorageValue

function getPlayerAccountId(cid) local p = Player(cid) return p ~= nil and p:getAccountId() or false end
function doPlayerSave(cid) Player(cid):save() end

function getPlayerEventType(cid)
    local resultId = db.storeQuery("SELECT `event` FROM `players` WHERE `id` = " .. getPlayerGUID(cid))
    if resultId ~= false then
        local event = result.getDataInt(resultId, "event")
        result.free(resultId)
        return event
    end
    return 0
end

function getPlayerNameByGUID(guid)
    local player = Player(guid)
    if player ~= nil then
        return player:getName()
    end
 
    local resultId = db.storeQuery("SELECT `name` FROM `players` WHERE `id` = " .. guid)
    if resultId ~= false then
        local name = result.getDataString(resultId, "name")
        result.free(resultId)
        return name
    end
    return 0
end

function getPlayerNameById(id)
    local resultName = db.storeQuery("SELECT `name` FROM `players` WHERE `id` = " .. id)
    if resultName ~= false then
        local name = result.getDataString(resultName, "name")
        result.free(resultName)
        return name
    end
    return 0
end

function getPlayerSpouse(id)
    local resultQuery = db.storeQuery("SELECT `marriage_spouse` FROM `players` WHERE `id` = " .. id)
    if resultQuery ~= false then
        local ret = result.getDataInt(resultQuery, "marriage_spouse")
        result.free(resultQuery)
        return ret
    end
    return -1
end

function setPlayerSpouse(id, val)
    db.query("UPDATE `players` SET `marriage_spouse` = " .. val .. " WHERE `id` = " .. id)
end

function getPlayerMarriageStatus(id)
    local resultQuery = db.storeQuery("SELECT `marriage_status` FROM `players` WHERE `id` = " .. id)
    if resultQuery ~= false then
        local ret = result.getDataInt(resultQuery, "marriage_status")
        result.free(resultQuery)
        return ret
    end
    return -1
end

function setPlayerMarriageStatus(id, val)
    db.query("UPDATE `players` SET `marriage_status` = " .. val .. " WHERE `id` = " .. id)
end

function Player:getMarriageDescription(thing)
    local descr = ""
    if getPlayerMarriageStatus(thing:getGuid()) == MARRIED_STATUS then
        playerSpouse = getPlayerSpouse(thing:getGuid())
        if self == thing then
            descr = descr .. " You are "
        elseif thing:getSex() == PLAYERSEX_FEMALE then
            descr = descr .. " She is "
        else
            descr = descr .. " He is "
        end
        descr = descr .. "married to " .. getPlayerNameById(playerSpouse) .. '.'
    end
    return descr
end

function getBooleanFromString(input)
    local tmp = type(input)
    if(tmp == 'boolean') then
        return input
    end

    if(tmp == 'number') then
        return input > 0
    end

    local str = string.lower(tostring(input))
    return (str == "yes" or str == "true" or (tonumber(str) ~= nil and tonumber(str) > 0))
end

function doCopyItem(item, attributes)
	local attributes = attributes or false
    local ret = doCreateItemEx(item.itemid, item.type)
    if(attributes) then
		if(item.actionid > 0) then
            doSetItemActionId(ret, item.actionid)
        end
    end

    if(isContainer(item.uid) == TRUE) then
        for i = (getContainerSize(item.uid) - 1), 0, -1 do
            local tmp = getContainerItem(item.uid, i)
            if(tmp.itemid > 0) then
                doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
            end
        end
	end
	return getThing(ret)
end

function getExperienceForLevel(lv)
	lv = lv - 1
	return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
end

function getConfigValue(info)
	if type(info) ~= "string" then
		return nil
	end
	dofile('config.lua')
	return _G[info]
end

function getPlayerVipDays(cid)
    local resultId = db.storeQuery("SELECT `vipdays` FROM `accounts` WHERE `id` = " .. getPlayerAccountId(cid))
    if resultId ~= false then
        local days = result.getDataInt(resultId, "vipdays")
        result.free(resultId)
        return days
    end
    return 0
end

function doAddVipDays(cid, days)
	db.query("UPDATE `accounts` SET `vipdays` = `vipdays` + " .. days .. " WHERE `id` = " .. getAccountNumberByPlayerName(name))
end

function doRemoveVipDays(cid, days)
	db.query("UPDATE `accounts` SET `vipdays` = `vipdays` - " .. days .. " WHERE `id` = " .. getAccountNumberByPlayerName(name))
end

function getPlayerAccountId(cid) local p = Player(cid) return p ~= nil and p:getAccountId() or false end

function getPlayerNameByGUID(guid)
    local player = Player(guid)
    if player ~= nil then
        return player:getName()
    end
 
    local resultId = db.storeQuery("SELECT `name` FROM `players` WHERE `id` = " .. guid)
    if resultId ~= false then
        local name = result.getDataString(resultId, "name")
        result.free(resultId)
        return name
    end
    return 0
end

function getPlayerNameById(id)
    local resultName = db.storeQuery("SELECT `name` FROM `players` WHERE `id` = " .. db.escapeString(id))
    if resultName ~= false then
        local name = result.getDataString(resultName, "name")
        result.free(resultName)
        return name
    end
    return 0
end

setWorldType = Game.setWorldType