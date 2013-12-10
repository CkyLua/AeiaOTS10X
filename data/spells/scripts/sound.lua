local acombat1 = createCombatObject()
local acombat2 = createCombatObject()
local acombat3 = createCombatObject()
local acombat4 = createCombatObject()
local acombat5 = createCombatObject()
local acombat6 = createCombatObject()
local acombat7 = createCombatObject()
local acombat8 = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 21)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.45, -20, -3.9, -50)
 

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 21)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -2.45, -20, -3.9, -50)
 

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 21)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.85, -20, -3.9, -50)
 

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 21)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -2.45, -20, -3.9, -50)
 
local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 7)
setCombatParam(combat5, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -2.45, -20, -3.9, -50)
 
local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat6, COMBAT_PARAM_EFFECT, 7)
setCombatParam(combat6, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, -2.45, -20, -3.9, -50)
 
local combat7 = createCombatObject()
setCombatParam(combat7, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat7, COMBAT_PARAM_EFFECT, 7)
setCombatParam(combat7, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat7, COMBAT_FORMULA_LEVELMAGIC, -2.45, -20, -3.9, -50)
 
local combat8 = createCombatObject()
setCombatParam(combat8, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat8, COMBAT_PARAM_EFFECT, 7)
setCombatParam(combat8, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat8, COMBAT_FORMULA_LEVELMAGIC, -2.45, -20, -3.9, -50)

local condition = createConditionObject(CONDITION_DRUNK)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10)
setCombatCondition(combat1, condition)
setCombatCondition(combat2, condition)
setCombatCondition(combat3, condition)
setCombatCondition(combat4, condition)
setCombatCondition(combat5, condition)
setCombatCondition(combat6, condition)
setCombatCondition(combat7, condition)
setCombatCondition(combat8, condition)
 


arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
arr4 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{1, 1, 0, 0, 0, 2, 0, 0, 0, 1, 1},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}
}

arr5 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

arr6 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

arr7 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

arr8 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{1, 1, 0, 0, 0, 2, 0, 0, 0, 1, 1},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}
}
 
local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
local area6 = createCombatArea(arr6)
local area7 = createCombatArea(arr7)
local area8 = createCombatArea(arr8)
setCombatArea(acombat1, area1)
setCombatArea(acombat2, area2)
setCombatArea(acombat3, area3)
setCombatArea(acombat4, area4)
setCombatArea(acombat5, area5)
setCombatArea(acombat6, area6)
setCombatArea(acombat7, area7)
setCombatArea(acombat8, area8)

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
	doCombat(cid,combat4,positionToVariant(pos))
end

function onTargetTile5(cid, pos)
	doCombat(cid,combat5,positionToVariant(pos))
end

function onTargetTile6(cid, pos)
	doCombat(cid,combat6,positionToVariant(pos))
end

function onTargetTile7(cid, pos)
	doCombat(cid,combat7,positionToVariant(pos))
end

function onTargetTile8(cid, pos)
	doCombat(cid,combat8,positionToVariant(pos))
end

setCombatCallback(acombat1, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

setCombatCallback(acombat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")


setCombatCallback(acombat3, CALLBACK_PARAM_TARGETTILE, "onTargetTile3")


setCombatCallback(acombat4, CALLBACK_PARAM_TARGETTILE, "onTargetTile4")


setCombatCallback(acombat5, CALLBACK_PARAM_TARGETTILE, "onTargetTile5")


setCombatCallback(acombat6, CALLBACK_PARAM_TARGETTILE, "onTargetTile6")


setCombatCallback(acombat7, CALLBACK_PARAM_TARGETTILE, "onTargetTile7")


setCombatCallback(acombat8, CALLBACK_PARAM_TARGETTILE, "onTargetTile8")


local function onCastSpell1(parameters)
    doCombat(parameters.cid, acombat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    doCombat(parameters.cid, acombat2, parameters.var)
end
 
local function onCastSpell3(parameters)
    doCombat(parameters.cid, acombat3, parameters.var)
end
 
local function onCastSpell4(parameters)
    doCombat(parameters.cid, acombat4, parameters.var)
end
 
local function onCastSpell5(parameters)
    doCombat(parameters.cid, acombat5, parameters.var)
end

local function onCastSpell6(parameters)
    doCombat(parameters.cid, acombat6, parameters.var)
end
 
local function onCastSpell7(parameters)
    doCombat(parameters.cid, acombat7, parameters.var)
end
 
local function onCastSpell8(parameters)
    doCombat(parameters.cid, acombat8, parameters.var)
end




function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell3, 400, parameters)
addEvent(onCastSpell4, 600, parameters)
addEvent(onCastSpell5, 100, parameters)
addEvent(onCastSpell6, 300, parameters)
addEvent(onCastSpell7, 500, parameters)
addEvent(onCastSpell8, 700, parameters)

return true
end