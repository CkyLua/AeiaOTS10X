function onSay(cid, words, param)
        if(param == "") then
            doPlayerSendCancel(cid,"Command required param!")
            return TRUE
        end
        local s = string.explode(param,"\"")
        if(s[2] == "") or (s[2] == nil) then
            doPlayerSendCancel(cid,"Command required param!")
            return TRUE
        end
        if(words:sub(2,2) == "o") then    
            doCreatureSay(cid,s[2],TALKTYPE_ORANGE_1)
            return TRUE
        elseif(words:sub(2,2) == "t") then
            local target = getCreatureTarget(cid)
            if(isCreature(target) ~= TRUE) then
                doPlayerSendCancel(cid,"You must have a target to use this command!")
                return TRUE
            end
            doCreatureSay(target,s[2],TALKTYPE_ORANGE_1)
            return TRUE
        elseif(words:sub(2,2) == "s") then    
            local y = string.explode(s[2],",")
            local player = getPlayerByNameWildcard(y[1])
            if(isPlayer(player) ~= TRUE) then
                doPlayerSendCancel(cid,"Player not found!")
                return TRUE
            end
            doCreatureSay(cid,y[2],TALKTYPE_ORANGE_1)
            return TRUE
        elseif(words:sub(2,2) == "a") then
            local y = string.explode(s[2],",")
            local zasieg = tonumber(y[2])
            if(zasieg >= 6)then
                doPlayerSendCancel(cid,"Max range: 5")
                return TRUE
            end
            local pos = getCreaturePosition(cid)
            local frompos = {x=pos.x-zasieg,y=pos.y-zasieg,z=pos.z}
            local topos = {x=pos.x+zasieg,y=pos.y+zasieg,z=pos.z}
            for x = frompos.x, topos.x do
            for y = frompos.y, topos.y do
                local pos = {x=x,y=y,z=topos.z,stackpos=253}
                local creature = getThingfromPos(pos)
                if((isPlayer(creature.uid) == TRUE) and (cid ~= creature.uid)) then
                    doCreatureSay(creature.uid,y[1],TALKTYPE_ORANGE_1)
                end
            end
            end
            return TRUE
        end
    return TRUE
end