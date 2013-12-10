--By Dattler--
local atk1 = createCombatObject()
local atk2 = createCombatObject()
local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 255)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9.8, -6, -15.5, -7)
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -9.9, -0, -15.5, -0)
arr1 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}
}
arr2 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 1, 0, 2, 0, 1, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}
}
local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(atk1, area1)
setCombatArea(atk2, area2)
function onTargetTile(cid, pos)
    doCombat(cid,combat1,positionToVariant(pos))
end
function onTargetTile2(cid, pos)
    doCombat(cid,combat2,positionToVariant(pos))
end
setCombatCallback(atk1, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
setCombatCallback(atk2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")
local function onCastSpell1(parameters)
    doCombat(parameters.cid, atk1, parameters.var)
end
local function onCastSpell2(parameters)
    doCombat(parameters.cid, atk2, parameters.var)
end
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
return true
end