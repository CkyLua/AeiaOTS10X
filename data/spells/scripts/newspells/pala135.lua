-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_holy = createCombatObject()
setCombatParam(combat0_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat0_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat0_holy,createCombatArea({{0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 0},
{1, 1, 1, 1, 1, 1},
{0, 0, 0, 1, 0, 0},
{0, 0, 0, 3, 0, 0},
{0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0}}))
function getDmg_holy(cid, level, maglevel)
	return (500)*-1,(1500)*-1 
end
setCombatCallback(combat0_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat0_holy = {CONST_ANI_SMALLHOLY,0,5,0,1,1,9,-1,3,1,11,0,7,0,10,0,8,0,4,0,6,0,11,1,10,0,3,0,9,0,2,1,7,1,8,1,4,1,6,1,5,1,3,-2,3,0,-1,3,3,2,3}

-- Areas/Combat for 200ms
local combat2_holy = createCombatObject()
setCombatParam(combat2_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat2_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat2_holy,createCombatArea({{1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1}}))
function getDmg_holy(cid, level, maglevel)
	return (500)*-1,(1500)*-1 
end
setCombatCallback(combat2_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat2_holy = {CONST_ANI_SMALLHOLY,3,3,2,4,2,3,-2,4,-1,4,1,4,0,4,3,4,3,1,2,1,3,2,2,2,1,2,0,2,-1,2,-2,2,1,3,0,3,-1,3,-2,3,1,1,0,1,-1,1,-2,1}

-- Areas/Combat for 800ms
local combat8_holy = createCombatObject()
setCombatParam(combat8_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat8_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat8_holy,createCombatArea({{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0}}))
function getDmg_holy(cid, level, maglevel)
	return (500)*-1,(1500)*-1 
end
setCombatCallback(combat8_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat8_holy = {CONST_ANI_SMALLHOLY,4,0,-5,0,0,-1,1,-1,-1,-1,-3,-1,2,-1,3,-1,5,0,-2,-1,-4,0}

-- Areas/Combat for 700ms
local combat7_holy = createCombatObject()
setCombatParam(combat7_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat7_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat7_holy,createCombatArea({{1, 0, 1},
{1, 0, 1},
{0, 0, 0},
{0, 1, 0},
{0, 1, 0},
{0, 1, 0},
{0, 2, 0}}))
function getDmg_holy(cid, level, maglevel)
	return (500)*-1,(1500)*-1 
end
setCombatCallback(combat7_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat7_holy = {CONST_ANI_SMALLHOLY,0,2,0,3,0,4,1,7,1,6,-1,7,-1,6}

-- Areas/Combat for 600ms
local combat6_holy = createCombatObject()
setCombatParam(combat6_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat6_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat6_holy,createCombatArea({{3}}))
function getDmg_holy(cid, level, maglevel)
	return (500)*-1,(1500)*-1 
end
setCombatCallback(combat6_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat6_holy = {CONST_ANI_SMALLHOLY,0,1}

-- Areas/Combat for 500ms
local combat5_holy = createCombatObject()
setCombatParam(combat5_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat5_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat5_holy,createCombatArea({{1, 1, 1},
{1, 3, 1}}))
function getDmg_holy(cid, level, maglevel)
	return (500)*-1,(1500)*-1 
end
setCombatCallback(combat5_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat5_holy = {CONST_ANI_SMALLHOLY,1,1,1,2,0,2,0,1,-1,1,-1,2}

-- Areas/Combat for 400ms
local combat4_holy = createCombatObject()
setCombatParam(combat4_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat4_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat4_holy,createCombatArea({{1, 1, 1},
{1, 1, 1},
{1, 3, 1}}))
function getDmg_holy(cid, level, maglevel)
	return (500)*-1,(1500)*-1 
end
setCombatCallback(combat4_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat4_holy = {CONST_ANI_SMALLHOLY,0,1,0,2,0,3,1,1,1,2,1,3,-1,3,-1,2,-1,1}

-- Areas/Combat for 300ms
local combat3_holy = createCombatObject()
setCombatParam(combat3_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat3_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat3_holy,createCombatArea({{1, 1, 1, 1},
{1, 1, 1, 1},
{1, 1, 1, 1},
{1, 1, 1, 1},
{1, 1, 1, 1},
{1, 1, 1, 1},
{1, 1, 1, 1},
{1, 1, 1, 1},
{1, 1, 1, 1},
{1, 1, 1, 1},
{1, 1, 3, 1}}))
function getDmg_holy(cid, level, maglevel)
	return (500)*-1,(1500)*-1 
end
setCombatCallback(combat3_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat3_holy = {CONST_ANI_SMALLHOLY,2,11,2,10,2,9,2,8,2,7,2,6,2,5,2,4,2,3,2,2,2,1,1,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,9,1,10,1,11,0,11,0,10,0,9,0,8,0,7,0,6,0,5,0,4,0,3,0,2,0,1,-1,1,-1,2,-1,3,-1,4,-1,5,-1,6,-1,7,-1,8,-1,9,-1,10,-1,11}

-- Areas/Combat for 100ms
local combat1_holy = createCombatObject()
setCombatParam(combat1_holy, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat1_holy, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatArea(combat1_holy,createCombatArea({{1, 0, 0, 1},
{1, 0, 0, 1},
{1, 0, 0, 1},
{1, 0, 0, 1},
{1, 0, 0, 1},
{1, 0, 0, 1},
{1, 0, 0, 1},
{1, 0, 0, 1},
{0, 0, 0, 0},
{0, 0, 0, 0},
{0, 0, 2, 0}}))
function getDmg_holy(cid, level, maglevel)
	return (500)*-1,(1500)*-1 
end
setCombatCallback(combat1_holy, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_holy")
local dfcombat1_holy = {CONST_ANI_SMALLHOLY,2,4,2,5,2,6,2,7,2,8,2,9,2,10,2,11,-1,11,-1,10,-1,9,-1,8,-1,7,-1,6,-1,5,-1,4}

-- =============== CORE FUNCTIONS ===============
local function RunPart(c,cid,var,dirList,dirEmitPos,startDir) -- Part
	if (isCreature(cid)) then
		doCombat(cid, c, var)
		if (dirList ~= nil) then -- Emit distance effects
			local i = 2;
			while (i < #dirList) do
				if (startDir == 0) then -- N
					doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x-dirList[i],y=dirEmitPos.y-dirList[i+1],z=dirEmitPos.z},dirList[1])
				elseif (startDir == 2) then -- S
					doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x+dirList[i],y=dirEmitPos.y+dirList[i+1],z=dirEmitPos.z},dirList[1])
				elseif (startDir == 1) then -- E
					doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x+dirList[i+1],y=dirEmitPos.y+dirList[i],z=dirEmitPos.z},dirList[1])
				else -- W / Something weird happened
					doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x-dirList[i+1],y=dirEmitPos.y-dirList[i],z=dirEmitPos.z},dirList[1])
				end
				i = i + 2
			end		
		end
	end
end

function onCastSpell(cid, var)
	local startPos = getCreaturePosition(cid)
	local startDir = getCreatureLookDirection(cid)
	RunPart(combat0_holy,cid,var,dfcombat0_holy,startPos,startDir)
	addEvent(RunPart,200,combat2_holy,cid,var,dfcombat2_holy,startPos,startDir)
	addEvent(RunPart,800,combat8_holy,cid,var,dfcombat8_holy,startPos,startDir)
	addEvent(RunPart,700,combat7_holy,cid,var,dfcombat7_holy,startPos,startDir)
	addEvent(RunPart,600,combat6_holy,cid,var,dfcombat6_holy,startPos,startDir)
	addEvent(RunPart,500,combat5_holy,cid,var,dfcombat5_holy,startPos,startDir)
	addEvent(RunPart,400,combat4_holy,cid,var,dfcombat4_holy,startPos,startDir)
	addEvent(RunPart,300,combat3_holy,cid,var,dfcombat3_holy,startPos,startDir)
	addEvent(RunPart,100,combat1_holy,cid,var,dfcombat1_holy,startPos,startDir)
	return true
end