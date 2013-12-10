function onUse(cid, item, frompos, itemEx, topos)
	local playerinfo = -- Please don't touch
	{
	level = getPlayerLevel(cid),
	mlevel = getPlayerMagLevel(cid),
	voc = getPlayerVocation(cid)
	}
	local config =
	{
	strenght = "template", ---Values: template (strenght dependent on level and magic level), constant (on all level adding same mana)
	template = {min = (((playerinfo.level * 3.3) + (playerinfo.mlevel * 1.9)) - 50) , max =(((playerinfo.level * 4.3) + (playerinfo.mlevel * 2.7)))}, -- only if strenght is template
	constant = {min = 400, max = 800},--only if strenght is constant 
	exhaustion = 1.8,--exhaustion in secs
	exhaustion_value = 56789, --exhaustion storage value
	minimum_level = 8,--minimum level to use manarune
	minimum_mlevel = 0,--minimum magic level to use manarune
	cannot_use_voc = {} --id vocation which cannot use
	}
	local rand = 0
		if(isPlayer(itemEx.uid) == false) then
			return true
		end
		if(playerinfo.level < config.minimum_level) then
			return true
		end
		if(playerinfo.mlevel < config.minimum_mlevel) then
			return true
		end
		if(isInArray(config.cannot_use_voc, playerinfo.voc)) then
			return true
		end
		if(config.strenght ~= "template" and config.strenght ~= "constant") then
			config.strenght = "constant"
		end
		if(getPlayerStorageValue(cid, config.exhaustion_value) > os.time()) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You are exhausted.")
			return true
		end
		if(config.strenght == "template") then
			rand = math.random(config.template.min, config.template.max)
		elseif (config.strenght == "constant") then	
			rand = math.random(config.constant.min, config.constant.max)
		end
		doCreatureAddMana(cid, rand)
		doSendMagicEffect(topos, 14)
		doSendAnimatedText(topos, rand, TEXTCOLOR_PURPLE)
		setPlayerStorageValue(cid, config.exhaustion_value, (os.time() + config.exhaustion))

	return true
end