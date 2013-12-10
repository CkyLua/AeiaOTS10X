function onSay(cid, words, param)
    if(param == "") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires destinations.")
        return TRUE
    end

    local t = string.explode(param, ",")
    if(not t[2]) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "No destination specified.")
        return TRUE
    end

local telePos = {x=t[1], y=t[2], z=t[3], stackpos=254}
local offPos = getPosByDir(getCreaturePosition(cid),getPlayerLookDir(cid), 1)
        local nha = {x = offPos.x, y = offPos.y - 3, z = offPos.z, stackpos = 255}
        local sha = {x = offPos.x, y = offPos.y + 3, z = offPos.z, stackpos = 255}
        local wha = {x = offPos.x - 3, y = offPos.y, z = offPos.z, stackpos = 255}
        local eha = {x = offPos.x + 3, y = offPos.y, z = offPos.z, stackpos = 255}
        local nwa = {x = offPos.x - 2, y = offPos.y - 2, z = offPos.z, stackpos = 255}
        local nea = {x = offPos.x + 2, y = offPos.y - 2, z = offPos.z, stackpos = 255}
        local sea = {x = offPos.x + 2, y = offPos.y + 2, z = offPos.z, stackpos = 255}
        local swa = {x = offPos.x - 2, y = offPos.y + 2, z = offPos.z, stackpos = 255}

if(doCreateTeleport(1387, telePos, offPos)) ~= LUA_ERROR then
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
            doSendDistanceShoot(offPos, nha, 35)
            doSendDistanceShoot(offPos, sha, 35)
            doSendDistanceShoot(offPos, wha, 35)
            doSendDistanceShoot(offPos, eha, 35)
            doSendDistanceShoot(offPos, nwa, 35)
            doSendDistanceShoot(offPos, nea, 35)
            doSendDistanceShoot(offPos, sea, 35)
            doSendDistanceShoot(offPos, swa, 35)
                doSendMagicEffect(offPos, 37)
    end

    return TRUE
end