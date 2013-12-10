  function onThink(interval, lastExecution)
       
local timeToClose = 300 --in seconds(5 minutes)
local timeToKickPlayers = 1020 --time to kick the players from the castle(1020 = 17 minutes)

        db.executeQuery("UPDATE `players` SET `event` = 1;")
        doBroadcastMessage("Demon Castle opened! The entrance will be closed in five minutes.")  
        addEvent(closeCastle, (1000*timeToClose))
        addEvent(kickPlayersFromCastle, (1000*timeToKickPlayers))
        return TRUE
end

function closeCastle()

        db.executeQuery("UPDATE `players` SET `event` = 0;")
        doBroadcastMessage("Demon castle closed!")
        return TRUE
end

function kickPlayersFromCastle()

local position =
{
        fromPosCastle1 = {x=1036, y=1391, z=11},
        toPosCastle1 = {x=1144, y=1428, z=11},
        fromPosCastle2 = {x=1036, y=1391, z=11},
        toPosCastle2 = {x=1144, y=1428, z=11},
        fromPosCastle3 = {x=1036, y=1391, z=11},
        toPosCastle3 = {x=1144, y=1428, z=11},
        fromPosCastle4 = {x=1036, y=1391, z=11},
        toPosCastle4 = {x=1144, y=1428, z=11},
        newPos = {x=1000, y=1000, z=7}
}

local weapon = {
        sword = 11393, --Divine sword of the archangel
        staff = 11394, --Divine staff of the archangel
        crossbow = 11395 --Divine crossbow of the archangel
}

local playersOnline = getPlayersOnline()

        for _, pid in ipairs(playersOnline) do
                if isInArea(getCreaturePosition(pid), position.fromPosCastle1, position.toPosCastle1) then
                        doTeleportThing(pid, position.newPos)
                        doPlayerRemoveItem(pid, weapon.sword, getPlayerItemCount(pid, weapon.sword))
                        doPlayerRemoveItem(pid, weapon.staff, getPlayerItemCount(pid, weapon.staff))
                        doPlayerRemoveItem(pid, weapon.crossbow, getPlayerItemCount(pid, weapon.crossbow))
                elseif isInArea(getCreaturePosition(pid), position.fromPosCastle2, position.toPosCastle2) then
                        doTeleportThing(pid, position.newPos)
                        doPlayerRemoveItem(pid, weapon.sword, getPlayerItemCount(pid, weapon.sword))
                        doPlayerRemoveItem(pid, weapon.staff, getPlayerItemCount(pid, weapon.staff))
                        doPlayerRemoveItem(pid, weapon.crossbow, getPlayerItemCount(pid, weapon.crossbow))
                elseif isInArea(getCreaturePosition(pid), position.fromPosCastle3, position.toPosCastle3) then
                        doTeleportThing(pid, position.newPos)
                        doPlayerRemoveItem(pid, weapon.sword, getPlayerItemCount(pid, weapon.sword))
                        doPlayerRemoveItem(pid, weapon.staff, getPlayerItemCount(pid, weapon.staff))
                        doPlayerRemoveItem(pid, weapon.crossbow, getPlayerItemCount(pid, weapon.crossbow))
                elseif isInArea(getCreaturePosition(pid), position.fromPosCastle4, position.toPosCastle4) then
                        doTeleportThing(pid, position.newPos)
                        doPlayerRemoveItem(pid, weapon.sword, getPlayerItemCount(pid, weapon.sword))
                        doPlayerRemoveItem(pid, weapon.staff, getPlayerItemCount(pid, weapon.staff))
                        doPlayerRemoveItem(pid, weapon.crossbow, getPlayerItemCount(pid, weapon.crossbow))
                end
        end
        return TRUE
end 