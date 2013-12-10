-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 100ms
local combat1_elec = createCombatObject()
setCombatParam(combat1_elec, COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)
setCombatParam(combat1_elec, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatArea(combat1_elec,createCombatArea({{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 2, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1}}))
function getDmg_elec(cid, level, maglevel)
	return (10)*-1,(20)*-1 
end
setCombatCallback(combat1_elec, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_elec")

local con_elec__combat1_elec = createConditionObject(0+CONDITION_ENERGY)
addDamageCondition(con_elec__combat1_elec, 30, 3000, -30)
setCombatCondition(combat1_elec, con_elec__combat1_elec)

-- Areas/Combat for 0ms
local combat0_holy = createCombatObject()
setCombatParam(combat0_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat0_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat0_holy,createCombatArea({{1, 0, 0, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 2, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 0, 0, 1}}))
function getDmg_holy(cid, level, maglevel)
	return (700)*-1,(1000)*-1 
end
setCombatCallback(combat0_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")

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
	RunPart(combat0_holy,cid,var)
	return true
end