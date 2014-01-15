-- Credits: Synthetic @ OTFans & OTLand

function onAdvance(cid, skill, oldlevel, newlevel)
	local player = Player(cid)
    if skill == SKILL_LEVEL then
		player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)    
		player:addHealth(player:getMaxHealth())
		player:addMana(player:getMaxMana())
    end
    return true
end