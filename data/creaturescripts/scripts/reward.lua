function onDeath(cid, corpse, deathList)
local corpse_ids = {
        [0] = 3065,
        [1] = 3058
}
        local v = { killer_name = getCreatureName(deathList[1]), killer_level = getPlayerLevel(deathList[1]), target_name = getCreatureName(cid), target_level = getPlayerLevel(cid) }
        local reward = doAddContainerItem(corpse.uid, 5943, 1)
        if isPlayer(cid) then
                for i = 1, #deathList do
                        if(isPlayer(deathList[i])) then
                                doItemSetAttribute(reward, "description", "" .. (getPlayerSex(cid) == 0 and "Ona" or "On") .. " was killed at the " .. v.target_level .. " by " .. v.killer_name .. " striped of the level of " .. v.killer_level .. ". " .. (getCreatureSkullType(cid) <= SKULL_GREEN and "[Unjustified]" or "[Justified]"))
                                local corpse, killers = doCreateItem(corpse_ids[getPlayerSex(cid)], 1, getThingPos(cid)), ""
                                for i = 1, math.min(getConfigInfo('deathAssistCount') + 1, #deathList) do
                                        killers = killers .. (i == 1 and "" or ", ") .. (isMonster(deathList[i]) and "a " or "") .. getCreatureName(deathList[i])
                                end
                        end
                        doItemSetAttribute(reward, "name", v.target_name .."'s Heart")
                end
        end
        return true
end