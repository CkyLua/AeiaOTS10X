local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

local condition = createConditionObject(CONDITION_CURSED)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)

addDamageCondition(condition, 1, 3000, -1)
addDamageCondition(condition, 1, 3000, -3)
addDamageCondition(condition, 1, 3000, -5)
addDamageCondition(condition, 1, 3000, -7)
addDamageCondition(condition, 1, 3000, -11)
addDamageCondition(condition, 1, 3000, -15)
addDamageCondition(condition, 1, 3000, -21)
addDamageCondition(condition, 1, 3000, -29)
addDamageCondition(condition, 1, 3000, -34)
addDamageCondition(condition, 1, 3000, -40)
addDamageCondition(condition, 1, 3000, -42)
addDamageCondition(condition, 1, 3000, -49)
addDamageCondition(condition, 1, 3000, -53)
addDamageCondition(condition, 1, 3000, -57)
addDamageCondition(condition, 1, 3000, -24)


setCombatCondition(combat, condition)

function onStepIn(cid, item, position, fromPosition)
local oakdelaystorage = 49985
local matma = math.random(1,2)
local losowy if matma == 1 then losowy = 50 else losowy = 54 end
local stepping = math.random(1, 100)
	if isPlayer(cid) then
	if matma == 2 and getPlayerStorageValue(cid,oakdelaystorage) > os.time() then -- avoid stepping combos
	return true
	else
		if stepping < 5 then
			doCreatureSay(cid, "MY ROOTS ARE SHARP AS A SCYTHE! FEEL IT?!?", TALKTYPE_MONSTER_YELL, false, cid, (oakPositions.demonOak or getCreaturePosition(cid)))
			doTargetCombatHealth(0, cid, oakfloorDamage.type, -oakfloorDamage.min, -oakfloorDamage.max, losowy)
			setPlayerStorageValue(cid,oakdelaystorage,os.time()+4000)
		else
			if stepping > 95 then
				doCreatureSay(cid, "AHHHH! YOUR BLOOD MAKES ME STRONG!", TALKTYPE_MONSTER_YELL, false, cid, (oakPositions.demonOak or getCreaturePosition(cid)))
				doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -oakfloorDamage.min, -oakfloorDamage.max, CONST_ME_DRAWBLOOD)
				setPlayerStorageValue(cid,oakdelaystorage,os.time()+4000)
			else
			if stepping < 10 then
				doCreatureSay(cid, "CURSE YOU!", TALKTYPE_MONSTER_YELL, false, cid, (oakPositions.demonOak or getCreaturePosition(cid)))
				setPlayerStorageValue(cid,oakdelaystorage,os.time()+4000)
				doSendMagicEffect(getThingPos(cid), CONST_ME_SMALLCLOUDS)
				doAddCondition(cid, condition)
			else
			return true
			end
			end
		end
	end
	end
	return true
end