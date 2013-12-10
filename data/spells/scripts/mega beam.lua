local atk1 = createCombatObject()
local atk2 = createCombatObject()
local atk3 = createCombatObject()
local atk4 = createCombatObject()
local atk5 = createCombatObject()
local atk6 = createCombatObject()
local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 28)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.4, -140, -3.8, -140)
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 36)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.7, -140, -2.6, -140)
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 49)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.7, -140, -2.6, -140)
local combat4 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -2.4, -140, -3.9, -140)
local combat5 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 45)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.7, -140, -2.6, -140)
local combat6 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 28)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -2.4, -140, -3.9, -140)
arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}
arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 2, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}
arr3 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{1, 1, 0, 0, 0, 2, 0, 0, 0, 1, 1},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
}
arr4 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}
arr5 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}
arr6 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}
local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
local area6 = createCombatArea(arr6)
setCombatArea(atk1, area1)
setCombatArea(atk2, area2)
setCombatArea(atk3, area3)
setCombatArea(atk4, area4)
setCombatArea(atk5, area5)
setCombatArea(atk6, area6)
function onTargetTile(cid, pos)
doCombat(cid,combat1,positionToVariant(pos))
end
function onTargetTile2(cid, pos)
doCombat(cid,combat2,positionToVariant(pos))
end
function onTargetTile3(cid, pos)
doCombat(cid,combat3,positionToVariant(pos))
end
function onTargetTile4(cid, pos)
doCombat(cid,combat2,positionToVariant(pos))
end
function onTargetTile5(cid, pos)
doCombat(cid,combat3,positionToVariant(pos))
end
function onTargetTile6(cid, pos)
doCombat(cid,combat3,positionToVariant(pos))
end
setCombatCallback(atk1, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
setCombatCallback(atk2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")
setCombatCallback(atk3, CALLBACK_PARAM_TARGETTILE, "onTargetTile3")
setCombatCallback(atk4, CALLBACK_PARAM_TARGETTILE, "onTargetTile4")
setCombatCallback(atk5, CALLBACK_PARAM_TARGETTILE, "onTargetTile5")
setCombatCallback(atk6, CALLBACK_PARAM_TARGETTILE, "onTargetTile6")
local function onCastSpell1(parameters)
doCombat(parameters.cid, atk1, parameters.var)
end
local function onCastSpell2(parameters)
doCombat(parameters.cid, atk2, parameters.var)
end
local function onCastSpell3(parameters)
doCombat(parameters.cid, atk3, parameters.var)
end
local function onCastSpell4(parameters)
doCombat(parameters.cid, atk4, parameters.var)
end
local function onCastSpell5(parameters)
doCombat(parameters.cid, atk5, parameters.var)
end
local function onCastSpell6(parameters)
doCombat(parameters.cid, atk6, parameters.var)
end
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
-- addEvent(onCastSpell2, 250, parameters)
-- addEvent(onCastSpell3, 350, parameters)
addEvent(onCastSpell4, 400, parameters)
-- addEvent(onCastSpell5, 450, parameters)
addEvent(onCastSpell6, 500, parameters)
return true
end