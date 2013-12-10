function onCreatureAppear(cid)
--
end
function onCreatureDisappear(cid)
--
end
function onCreatureSay(cid, type, msg)
--
end
function onThink()
end
function onSayCurse(cid, text)
selfSay("Take this pervert!")
doTargetCombatHealth(getNpcCid(), cid, COMBAT_LIFEDRAIN, -100000, -200000, CONST_ME_HEARTS)
end