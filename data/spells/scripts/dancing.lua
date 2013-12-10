local scom1 = createCombatObject()
local scom2 = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 255)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 24)
setCombatFormula(combat1, COMBAT_FORMULA_SKILL, 0.6, -50, 1.03, -70)
 
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 24)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 0.4, -50, 0.63, -40)

arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 2, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

arr2 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 1, 2, 1, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(scom1, area1)
setCombatArea(scom2, area2)

function onTargetTile(cid, pos)
    return doCombat(cid,combat1,positionToVariant(pos))
end

function onTargetTile2(cid, pos)
    return doCombat(cid,combat2,positionToVariant(pos))
end

setCombatCallback(scom1, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
setCombatCallback(scom2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")

local function onCastSpell1(parameters)
    return doCombat(parameters.cid, scom1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return doCombat(parameters.cid, scom2, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
return TRUE
end  