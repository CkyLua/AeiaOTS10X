-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat0_Brush,createCombatArea({{1, 0, 0, 1, 1, 0},
{0, 0, 0, 1, 1, 0},
{0, 0, 2, 0, 1, 0},
{0, 1, 1, 1, 1, 0},
{1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (10)*-1,(20)*-1 
end
setCombatCallback(combat0_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

local con___combat0_Brush = createConditionObject(0+CONDITION_PARALYZE)
setCombatCondition(combat0_Brush, con___combat0_Brush)

-- Areas/Combat for 100ms
local combat1_Brush = createCombatObject()
setCombatParam(combat1_Brush, COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatParam(combat1_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat1_Brush,createCombatArea({{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1},
{0, 0, 1, 0, 0, 0, 0},
{1, 0, 0, 2, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0}}))
function getDmg_Brush(cid, level, maglevel)
	return (10)*-1,(20)*-1 
end
setCombatCallback(combat1_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

local con___combat1_Brush = createConditionObject(0+CONDITION_PARALYZE)
setCombatCondition(combat1_Brush, con___combat1_Brush)

-- Areas/Combat for 200ms
local combat2_Brush = createCombatObject()
setCombatParam(combat2_Brush, COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatParam(combat2_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat2_Brush,createCombatArea({{0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0},
{1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 2, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0}}))
function getDmg_Brush(cid, level, maglevel)
	return (10)*-1,(20)*-1 
end
setCombatCallback(combat2_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

local con___combat2_Brush = createConditionObject(0+CONDITION_PARALYZE)
setCombatCondition(combat2_Brush, con___combat2_Brush)

-- Areas/Combat for 300ms
local combat3_Brush = createCombatObject()
setCombatParam(combat3_Brush, COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatParam(combat3_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat3_Brush,createCombatArea({{0, 1, 0, 0, 0, 0, 0},
{1, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 2, 0, 0, 1},
{0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0}}))
function getDmg_Brush(cid, level, maglevel)
	return (10)*-1,(20)*-1 
end
setCombatCallback(combat3_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

local con___combat3_Brush = createConditionObject(0+CONDITION_PARALYZE)
setCombatCondition(combat3_Brush, con___combat3_Brush)

-- Areas/Combat for 400ms
local combat4_Brush = createCombatObject()
setCombatParam(combat4_Brush, COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatParam(combat4_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat4_Brush,createCombatArea({{0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 2, 1, 0, 0},
{1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 1, 1, 0, 0, 0, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (10)*-1,(20)*-1 
end
setCombatCallback(combat4_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

local con___combat4_Brush = createConditionObject(0+CONDITION_PARALYZE)
setCombatCondition(combat4_Brush, con___combat4_Brush)

-- Areas/Combat for 1100ms
local combat11_Brush_2 = createCombatObject()
setCombatParam(combat11_Brush_2, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat11_Brush_2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatArea(combat11_Brush_2,createCombatArea({{0, 0, 1, 0, 1, 0, 0},
{0, 0, 1, 0, 1, 0, 0},
{1, 1, 0, 0, 0, 1, 1},
{0, 0, 0, 2, 0, 0, 0},
{1, 1, 0, 0, 0, 1, 1},
{0, 0, 1, 0, 1, 0, 0},
{0, 0, 1, 0, 1, 0, 0}}))
function getDmg_Brush_2(cid, level, maglevel)
	return (120*maglevel+300)*-1,(150*maglevel+600)*-1 
end
setCombatCallback(combat11_Brush_2, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_2")
local dfcombat11_Brush_2 = {CONST_ANI_SUDDENDEATH,-2,1,-3,1,-1,2,-1,3,1,2,2,1,3,1,1,3,2,-1,3,-1,1,-2,1,-3,-1,-3,-1,-2,-2,-1,-3,-1}

-- Areas/Combat for 1000ms
local combat10_Brush_2 = createCombatObject()
setCombatParam(combat10_Brush_2, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat10_Brush_2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatArea(combat10_Brush_2,createCombatArea({{1, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 2, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 1}}))
function getDmg_Brush_2(cid, level, maglevel)
	return (120*maglevel+300)*-1,(150*maglevel+600)*-1 
end
setCombatCallback(combat10_Brush_2, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_2")
local dfcombat10_Brush_2 = {CONST_ANI_SUDDENDEATH,-1,1,-2,2,-3,3,1,1,2,2,3,3,1,-1,2,-2,3,-3,-1,-1,-2,-2,-3,-3}

-- Areas/Combat for 900ms
local combat9_Brush_2 = createCombatObject()
setCombatParam(combat9_Brush_2, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat9_Brush_2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatArea(combat9_Brush_2,createCombatArea({{1, 1, 1, 2, 1, 1, 1}}))
function getDmg_Brush_2(cid, level, maglevel)
	return (120*maglevel+300)*-1,(150*maglevel+600)*-1 
end
setCombatCallback(combat9_Brush_2, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_2")
local dfcombat9_Brush_2 = {CONST_ANI_SUDDENDEATH,-1,0,-2,0,-3,0,1,0,2,0,3,0}

-- Areas/Combat for 800ms
local combat8_Brush_2 = createCombatObject()
setCombatParam(combat8_Brush_2, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat8_Brush_2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatArea(combat8_Brush_2,createCombatArea({{1},
{1},
{1},
{2},
{1},
{1},
{1}}))
function getDmg_Brush_2(cid, level, maglevel)
	return (120*maglevel+300)*-1,(150*maglevel+600)*-1 
end
setCombatCallback(combat8_Brush_2, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_2")
local dfcombat8_Brush_2 = {CONST_ANI_SUDDENDEATH,0,1,0,-1,0,-2,0,-3,0,2,0,3}

-- =============== CORE FUNCTIONS ===============
local function RunPart(c,cid,var,dirList,dirEmitPos) -- Part
	if (isCreature(cid)) then
		doCombat(cid, c, var)
		if (dirList ~= nil) then -- Emit distance effects
			local i = 2;
			while (i < #dirList) do
				doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x-dirList[i],y=dirEmitPos.y-dirList[i+1],z=dirEmitPos.z},dirList[1])
				i = i + 2
			end		
		end
	end
end

function onCastSpell(cid, var)
	local startPos = getCreaturePosition(cid)
	RunPart(combat0_Brush,cid,var)
	addEvent(RunPart,100,combat1_Brush,cid,var)
	addEvent(RunPart,200,combat2_Brush,cid,var)
	addEvent(RunPart,300,combat3_Brush,cid,var)
	addEvent(RunPart,400,combat4_Brush,cid,var)
	addEvent(RunPart,1100,combat11_Brush_2,cid,var,dfcombat11_Brush_2,startPos)
	addEvent(RunPart,1000,combat10_Brush_2,cid,var,dfcombat10_Brush_2,startPos)
	addEvent(RunPart,900,combat9_Brush_2,cid,var,dfcombat9_Brush_2,startPos)
	addEvent(RunPart,800,combat8_Brush_2,cid,var,dfcombat8_Brush_2,startPos)
	return true
end