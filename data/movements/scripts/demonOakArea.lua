  function onStepIn(cid, item, position, fromPosition)
    if isPlayer(cid) == true and math.random(1, 24) == 1 then
        doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -270, -310, CONST_ME_BIGPLANTS)
    end
    return true
end  