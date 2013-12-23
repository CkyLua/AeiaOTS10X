-- Credits: Synthetic @ OTFans & OTLand

    function onAdvance(cid, skill, oldlevel, newlevel)
local pPos = getPlayerPosition(cid)
         if skill == 8 then
    doSendMagicEffect(pPos, 28)    
    doCreatureAddHealth(cid, getPlayerMaxMana(cid))
    doPlayerAddMana(cid, getCreatureMaxHealth(cid))    
        end
         return TRUE
end