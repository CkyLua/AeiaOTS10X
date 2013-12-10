-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_holy = createCombatObject()
setCombatParam(combat0_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat0_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat0_holy,createCombatArea({{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}}))
function getDmg_holy(cid, level, maglevel)
	return (1000)*-1,(1500)*-1 
end
setCombatCallback(combat0_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat0_holy = {CONST_ANI_SMALLHOLY,-3,0,-4,0,-3,1,-5,0,-1,0,0,3,0,4,4,1,0,-1,-1,-1,-1,1,-2,1,2,1,2,0,3,0,0,1,-4,1,1,2,0,2,-2,0,1,3,1,1,3,1,2,2,-2,-1,3,-1,-1,2,-2,2,5,0,4,0,1,-1,1,0,2,-1,4,-1,3,-2,2,-2,1,-2,0,-2,-1,-2,1,-3,0,-3,0,-4}

-- Areas/Combat for 200ms
local combat2_holy = createCombatObject()
setCombatParam(combat2_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat2_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat2_holy,createCombatArea({{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}}))
function getDmg_holy(cid, level, maglevel)
	return (1000)*-1,(1500)*-1 
end
setCombatCallback(combat2_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat2_holy = {CONST_ANI_SMALLHOLY,5,-5,4,-4,3,-3,2,-2,1,-1,-1,1,-2,2,-3,3,-4,4,-5,5,5,5,4,4,3,3,2,2,1,1,-1,-1,-2,-2,-3,-3,-4,-4,-5,-5}

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
	RunPart(combat0_holy,cid,var,dfcombat0_holy,startPos)
	addEvent(RunPart,200,combat2_holy,cid,var,dfcombat2_holy,startPos)
	return true
end