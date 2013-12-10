-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 100ms
local combat1_elec = createCombatObject()
setCombatParam(combat1_elec, COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)
setCombatParam(combat1_elec, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatArea(combat1_elec,createCombatArea({{2}}))
function getDmg_elec(cid, level, maglevel)
	return (10)*-1,(20)*-1 
end
setCombatCallback(combat1_elec, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_elec")

local con_elec__combat1_elec = createConditionObject(0+CONDITION_ENERGY)
addDamageCondition(con_elec__combat1_elec, 30, 3000, -30)
setCombatCondition(combat1_elec, con_elec__combat1_elec)local combat1_Brush_2 = createCombatObject()
setCombatParam(combat1_Brush_2, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatParam(combat1_Brush_2, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatArea(combat1_Brush_2,createCombatArea({{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 2, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1}}))
function getDmg_Brush_2(cid, level, maglevel)
	return (200)*-1,(250)*-1 
end
setCombatCallback(combat1_Brush_2, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_2")

-- Areas/Combat for 0ms
local combat0_holy = createCombatObject()
setCombatParam(combat0_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat0_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat0_holy,createCombatArea({{2}}))
function getDmg_holy(cid, level, maglevel)
	return (700)*-1,(1000)*-1 
end
setCombatCallback(combat0_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatArea(combat0_Brush,createCombatArea({{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 2, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (200)*-1,(250)*-1 
end
setCombatCallback(combat0_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

-- Areas/Combat for 300ms
local combat3_Brush_4 = createCombatObject()
setCombatParam(combat3_Brush_4, COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
setCombatParam(combat3_Brush_4, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatArea(combat3_Brush_4,createCombatArea({{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 2, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1}}))
function getDmg_Brush_4(cid, level, maglevel)
	return (200)*-1,(250)*-1 
end
setCombatCallback(combat3_Brush_4, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_4")

-- Areas/Combat for 200ms
local combat2_Brush_3 = createCombatObject()
setCombatParam(combat2_Brush_3, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat2_Brush_3, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatArea(combat2_Brush_3,createCombatArea({{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 2, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1}}))
function getDmg_Brush_3(cid, level, maglevel)
	return (200)*-1,(250)*-1 
end
setCombatCallback(combat2_Brush_3, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_3")

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
	addEvent(RunPart,100,combat1_elec,cid,var)
	addEvent(RunPart,100,combat1_Brush_2,cid,var)
	RunPart(combat0_holy,cid,var)
	RunPart(combat0_Brush,cid,var)
	addEvent(RunPart,300,combat3_Brush_4,cid,var)
	addEvent(RunPart,200,combat2_Brush_3,cid,var)
	return true
end