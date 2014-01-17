local config = {
	manaCost = 150,
	soulCost = 1,
}
local enchantableGems = {2147, 2146, 2149, 2150}
local enchantableItems = {2383, 7383, 7384, 7406, 7402, 2429, 2430, 7389, 7380, 2454, 2423, 2445, 7415, 7392, 2391, 2544, 8905}

local enchantingAltars = {
	{7504, 7505, 7506, 7507},
	{7508, 7509, 7510, 7511},
	{7516, 7517, 7518, 7519},
	{7512, 7513, 7514, 7515}
}

local enchantedGems = {7760, 7759, 7761, 7762}
local enchantedItems = {
	[2383] = {7744, 7763, 7854, 7869},
	[7383] = {7745, 7764, 7855, 7870},
	[7384] = {7746, 7765, 7856, 7871},
	[7406] = {7747, 7766, 7857, 7872},
	[7402] = {7748, 7767, 7858, 7873},
	[2429] = {7749, 7768, 7859, 7874},
	[2430] = {7750, 7769, 7860, 7875},
	[7389] = {7751, 7770, 7861, 7876},
	[7380] = {7752, 7771, 7862, 7877},
	[2454] = {7753, 7772, 7863, 7878},
	[2423] = {7754, 7773, 7864, 7879},
	[2445] = {7755, 7774, 7865, 7880},
	[7415] = {7756, 7775, 7866, 7881},
	[7392] = {7757, 7776, 7867, 7882},
	[2391] = {7758, 7777, 7868, 7883},
	[2544] = {7840, 7839, 7850, 7838},
	[8905] = {8906, 8907, 8909, 8908}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 2147 and itemEx.itemid == 2342) then
		doTransformItem(itemEx.uid, 2343)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)

		doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
		return true
	end

	if(item.itemid == 7760 and isInArray({9934, 10022}, itemEx.itemid)) then
		doTransformItem(itemEx.uid, 9933)
		doRemoveItem(item.uid, 1)

		doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
		return true
	end

	if(item.itemid == 7761 and isInArray({9949, 9954}, itemEx.itemid)) then
		doTransformItem(itemEx.uid, itemEx.itemid - 1)
		doRemoveItem(item.uid, 1)

		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		return true
	end

	if(isInArray(enchantableGems, item.itemid)) then
		local subtype = item.type
		if(subtype == 0) then
			subtype = 1
		end

		local mana = config.manaCost * subtype
		if(getPlayerMana(cid) < mana) and getPlayerAccess(cid) == 0 then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHMANA)
			return true
		end

		local soul = config.soulCost * subtype
		if(getPlayerSoul(cid) < soul) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHSOUL)
			return true
		end

		local a = table.find(enchantableGems, item.itemid)
		if(a == nil or not isInArray(enchantingAltars[a], itemEx.itemid)) then
			return false
		end

		doPlayerAddMana(cid, -mana)
		doPlayerAddSoul(cid, -soul)

		doTransformItem(item.uid, enchantedGems[a])
		doSendMagicEffect(fromPosition, CONST_ME_HOLYDAMAGE)
		return true
	end
 
	if(isInArray(enchantedGems, item.itemid)) then
		if(not isInArray(enchantableItems, itemEx.itemid)) then
			doSendMagicEffect(fromPosition, CONST_ME_POFF)
			return false
		end

		local b = table.find(enchantedGems, item.itemid)
		if(b == nil) then
			return false
		end

		local subtype = itemEx.type
		if(not isInArray({2544, 8905}, itemEx.itemid)) then
			subtype = 1000
		end

		doTransformItem(itemEx.uid, enchantedItems[itemEx.itemid][b], subtype)
		doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HOLYDAMAGE)
		doDecayItem(itemEx.uid)

		doRemoveItem(item.uid, 1)
		return true
	end

	return false
end
