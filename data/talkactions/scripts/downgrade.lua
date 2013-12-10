function onSay(cid, words, param)
    if(param == "") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Name required.")
        return TRUE
    end

    local player = getPlayerByNameWildcard(param)
        local pos = getCreaturePosition(player)
 
        local nha = {x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}
        local sha = {x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}
        local wha = {x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}
        local eha = {x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}
        local nwa = {x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}
        local nea = {x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}
        local sea = {x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}
        local swa = {x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}

if (getPlayerGroupId(cid)) > getPlayerGroupId(player) and getPlayerGroupId(player) > 1 and getPlayerGroupId(cid) < 6 then
    if (setPlayerGroupId(player, getPlayerGroupId(player)-1)) == LUA_ERROR then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Error.")
    end

        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player got downgraded.")
        doSendAnimatedText(getCreaturePosition(player), "Downgrade", 1)
            doSendDistanceShoot(pos, nha, 31)
            doSendDistanceShoot(pos, sha, 31)
            doSendDistanceShoot(pos, wha, 31)
            doSendDistanceShoot(pos, eha, 31)
            doSendDistanceShoot(pos, nwa, 31)
            doSendDistanceShoot(pos, nea, 31)
            doSendDistanceShoot(pos, sea, 31)
            doSendDistanceShoot(pos, swa, 31)
                doSendMagicEffect(pos, 17)
            doBroadcastMessage(" " .. getCreatureName(player) .. " has been downgraded to " .. getPlayerGroupName(player) .. " by ( " .. getPlayerGroupName(cid) .. " ) " .. getCreatureName(cid) .. " ")
elseif getPlayerGroupId(cid) >= 6 and getPlayerGroupId(player) > 1 then
    if (setPlayerGroupId(player, getPlayerGroupId(player)-1)) == LUA_ERROR then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Error.")
    end

        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player got downgraded.")
        doSendAnimatedText(getCreaturePosition(player), "Downgrade", 1)
            doSendDistanceShoot(pos, nha, 31)
            doSendDistanceShoot(pos, sha, 31)
            doSendDistanceShoot(pos, wha, 31)
            doSendDistanceShoot(pos, eha, 31)
            doSendDistanceShoot(pos, nwa, 31)
            doSendDistanceShoot(pos, nea, 31)
            doSendDistanceShoot(pos, sea, 31)
            doSendDistanceShoot(pos, swa, 31)
                doSendMagicEffect(pos, 17)
            doBroadcastMessage(" " .. getCreatureName(player) .. " has been downgraded to " .. getPlayerGroupName(player) .. " by ( " .. getPlayerGroupName(cid) .. " ) " .. getCreatureName(cid) .. " ")
end
    return TRUE
end