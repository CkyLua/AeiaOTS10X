local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 44)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

local area = createCombatArea(arr1)

arr1 = {
{0, 0, 0, 0, 0, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 2, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 0, 0, 0, 0, 0}
}

setCombatArea(combat, area)

function onGetFormulaValues(cid, level, maglevel)
	min = (level * 2.8 + maglevel * 0.1) * 1.1
	max = (level * 3.3 + maglevel * 0.1) * 1.2
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
