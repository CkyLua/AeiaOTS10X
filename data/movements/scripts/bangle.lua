local config = {
    coinItemId = 2152, -- ID of the coin that the spell will use (2148 = gold coin, 2152 = platinum coin, 2160 = crystal coin)
    intervalRemovalOfCoins = 20000, -- Coin wasting interval (miliseconds)
    removeCoinsPerInterval = 1, -- Number of coins to use during the interval
    minCoinsToInitTransformation = 10, -- Number of coins needed to trigger the transformation
    minCoinsToInitRing = 20, -- Number of coins needed to execute script (must be higher than the minCoinsToInitTransformation variable)
    warnPlayerLowAmount = true, -- Warn player when runing short on coins, true or false
    minCoinsToWarnPlayer = 20, -- Number of coins to trigger the warn player function
}

local outfitMale = {lookType = 12, lookHead = 19, lookBody = 79, lookLegs = 3, lookFeet = 81, lookAddons = 0}
local outfitFemale = {lookType = 12, lookHead = 19, lookBody = 53, lookLegs = 92, lookFeet = 79, lookAddons = 0}
local ringInit = false

local condition1 = createConditionObject(CONDITION_ATTRIBUTES)
    setConditionParam(condition1, CONDITION_PARAM_TICKS, -1)
    setConditionParam(condition1, CONDITION_PARAM_SKILL_FIST, 120)
    setConditionParam(condition1, CONDITION_PARAM_SKILL_FISHING, 120)
    setConditionParam(condition1, CONDITION_PARAM_SKILL_CLUB, 120)
    setConditionParam(condition1, CONDITION_PARAM_SKILL_SWORD, 120)
    setConditionParam(condition1, CONDITION_PARAM_SKILL_AXE, 120)
    setConditionParam(condition1, CONDITION_PARAM_SKILL_DISTANCE, 120)
    setConditionParam(condition1, CONDITION_PARAM_SKILL_SHIELD, 120)
    setConditionParam(condition1, CONDITION_PARAM_SKILL_FISHING, 120)
    setConditionParam(condition1, CONDITION_PARAM_STAT_MAGICPOINTS, 120)
    setConditionParam(condition1, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 180)
    setConditionParam(condition1, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 180)

local condition3 = createConditionObject(CONDITION_ATTRIBUTES)
    setConditionParam(condition3, CONDITION_PARAM_TICKS, -1)
    setConditionParam(condition3, CONDITION_PARAM_SKILL_FIST, 120)
    setConditionParam(condition3, CONDITION_PARAM_SKILL_FISHING, 120)
    setConditionParam(condition3, CONDITION_PARAM_SKILL_CLUB, 120)
    setConditionParam(condition3, CONDITION_PARAM_SKILL_SWORD, 120)
    setConditionParam(condition3, CONDITION_PARAM_SKILL_AXE, 120)
    setConditionParam(condition3, CONDITION_PARAM_SKILL_DISTANCE, 120)
    setConditionParam(condition3, CONDITION_PARAM_SKILL_SHIELD, 120)
    setConditionParam(condition3, CONDITION_PARAM_SKILL_FISHING, 120)
    setConditionParam(condition3, CONDITION_PARAM_STAT_MAGICPOINTS, 120)
    setConditionParam(condition3, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 195)
    setConditionParam(condition3, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 195)

local condition2 = createConditionObject(CONDITION_HASTE)
    setConditionParam(condition2, CONDITION_PARAM_TICKS, -1)
    setConditionFormula(condition2, 2.5, 0, 3.0, 0)

function coinsLeftCheck(cid)
    local pos = getCreaturePosition(cid)
    if(isPlayer(cid)) then       
        if(getPlayerSex(cid) == 1) then
            doSendMagicEffect(pos, CONST_ME_FIREWORK_YELLOW)
            doSendMagicEffect(pos, CONST_ME_MAGIC_GREEN)
        else
            doSendMagicEffect(pos, CONST_ME_FIREWORK_RED)
            doSendMagicEffect(pos, CONST_ME_FIREWORK_RED)
        end
       
        doPlayerRemoveItem(cid, config.coinItemId, config.removeCoinsPerInterval)
       
        local coinsLeft = getPlayerItemCount(cid, config.coinItemId)
        if(coinsLeft < config.minCoinsToWarnPlayer and config.warnPlayerLowAmount) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Coins left: " ..coinsLeft.. ".")
        end
       
        if(coinsLeft < config.removeCoinsPerInterval) then
            local ringInit = false
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You do not have enough money!")
            doRemoveCondition(cid, CONDITION_OUTFIT)
            doRemoveCondition(cid, CONDITION_ATTRIBUTES)
            doRemoveCondition(cid, CONDITION_HASTE)
            doSendDistanceShoot(pos, {x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
            doSendDistanceShoot(pos, {x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
            doSendDistanceShoot(pos, {x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
            doSendDistanceShoot(pos, {x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
            doSendDistanceShoot(pos, {x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
            doSendDistanceShoot(pos, {x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
            doSendDistanceShoot(pos, {x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
            doSendDistanceShoot(pos, {x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
            doSendMagicEffect({x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
            doSendMagicEffect({x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
            doSendMagicEffect({x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
            doSendMagicEffect({x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
            doSendMagicEffect({x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
            doSendMagicEffect({x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
            doSendMagicEffect({x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
            doSendMagicEffect({x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
            doSendMagicEffect(pos, CONST_ME_YELLOW_RINGS)
            doSendMagicEffect(pos, CONST_ME_BLOCKHIT)
        else
            addEvent(coinsLeftCheck, config.intervalRemovalOfCoins, cid)   
        end
    end
end
   
function initRing(cid)
    local pos = getCreaturePosition(cid)
    if(isPlayer(cid)) then
        doSendDistanceShoot(pos, {x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendMagicEffect({x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)   
        doSendMagicEffect(pos, CONST_ME_YELLOW_RINGS)
        doSendMagicEffect(pos, CONST_ME_BLOCKHIT)
        if(getPlayerSex(cid) == 1) then
            doSetCreatureOutfit(cid, outfitMale, -1)
        else
            doSetCreatureOutfit(cid, outfitFemale, -1)
        end
        if(getPlayerItemCount(cid, 9003) > 0) then
            doAddCondition(cid, condition3)
        else
            doAddCondition(cid, condition1)
        end
        doAddCondition(cid, condition2)
        doPlayerRemoveItem(cid, config.coinItemId, config.minCoinsToInitTransformation)
        addEvent(coinsLeftCheck, config.removeCoinsPerInterval, cid)   
    end
end

function onEquip(cid, item, slot)
    if(getPlayerItemCount(cid, config.coinItemId) > config.minCoinsToInitRing) then
        local ringInit = true
        addEvent(initRing, 100, cid)
    end
    return true
end

function onDeEquip(cid, item, slot)
    local pos = getCreaturePosition(cid)
    if(isPlayer(cid)) then
        doSetCreatureOutfit(cid, {lookType = 88, lookHead = 0, lookAddons = 0, lookLegs = 0, lookbody = 0, lookFeet = 0}, 43200000)
        doRemoveCondition(cid, CONDITION_OUTFIT)
        doRemoveCondition(cid, CONDITION_ATTRIBUTES)
        doRemoveCondition(cid, CONDITION_HASTE)
        doSendDistanceShoot(pos, {x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendDistanceShoot(pos, {x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ANI_SMALLHOLY)
        doSendMagicEffect({x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect({x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}, CONST_ME_HOLYAREA)
        doSendMagicEffect(pos, CONST_ME_YELLOW_RINGS)
        doSendMagicEffect(pos, CONST_ME_BLOCKHIT)
    end
return true
end