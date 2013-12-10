-- Credits: Synthetic @ OTFans & OTLand

    function onAdvance(cid, skill, oldlevel, newlevel)
local pPos = getPlayerPosition(cid)
         if skill == 8 then
    doSendAnimatedText(pPos, "Level Up", 210)
    doSendMagicEffect(pPos, 28)    
    doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
    doCreatureAddMana(cid, getCreatureMaxMana(cid))    
        end
         return TRUE
end