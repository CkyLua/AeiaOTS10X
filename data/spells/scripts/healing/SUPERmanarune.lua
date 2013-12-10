local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onCastSpell(cid, var)
doPlayerAddMana(cid, 10000)
doCreatureSay(cid, "X-Infinite Manarune", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end