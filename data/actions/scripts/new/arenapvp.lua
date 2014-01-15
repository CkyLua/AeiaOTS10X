function onUse(cid, item, frompos, item2, topos)
-- CONFIG BEGINS HERE --
local arena = {
  frompos = {x=1041, y=958, z=9},
  topos = {x=1052, y=991, z=9},
  exitpos = {x=278, y=249, z=9} 
}
local checkpvparena = true -- checks if someone is blocking the arena
local duel_limit = 15 * 60 -- in seconds
player1pos = {x=1041, y=987, z=8}
leverpos = {x=277, y=249, z=10}
player2pos = {x=1040, y=989, z=8}
nplayer1pos = {x=1043, y=988, z=9}
nplayer2pos = {x=1050, y=988, z=9}
fighters = {}
-- CONFIG ENDS HERE --
local function back(uid) -- toggles lever back
	doTransformItem(uid,1945)
	return true
end

local function gtfo() -- get the fighter out
if getCreaturesInQuestArea(TYPE_PLAYER, arena.frompos, arena.topos, GET_COUNT) > 1 then
	for a = arena.frompos.x, arena.topos.x do
	for b = arena.frompos.y, arena.topos.y do
		pos = {x=a,y=b,z=9,stackpos = 255}
		if(isPlayer(getTopCreature(pos).uid)) then
			doPlayerSendTextMessage(getTopCreature(pos).uid,MESSAGE_LOOT,"Time up. Round drawn.")
			doTeleportThing(getTopCreature(pos).uid,arena.exitpos)
		end
	end
	end
end
	return true
end
	if item.itemid == 1945 then
		if isPlayer(getTopCreature(player1pos).uid) == true and isPlayer(getTopCreature(player2pos).uid) == true then
		-- function below works only with demon oak lib
			if checkpvparena == true then
				if getCreaturesInQuestArea(TYPE_PLAYER, arena.frompos, arena.topos, GET_COUNT) > 0 then
					if getCreaturesInQuestArea(TYPE_PLAYER, arena.frompos, arena.topos, GET_COUNT) == 1 then
						for c = arena.frompos.x, arena.topos.x do
						for d = arena.frompos.y, arena.topos.y do
							pos = {x=c,y=d,z=11, stackpos = 255}
							if(isPlayer(getTopCreature(pos).uid)) then
								doPlayerSendTextMessage(getTopCreature(pos).uid,MESSAGE_LOOT,"You have been kicked from the arena.")
								doTeleportThing(getTopCreature(pos).uid,arena.exitpos)
							end
						end
						end
					else
					arena_counter = getGlobalStorageValue(24510) - os.time()
					if arena_counter < 0 then
						for c = arena.frompos.x, arena.topos.x do
						for d = arena.frompos.y, arena.topos.y do
							pos = {x=c,y=d,z=11, stackpos = 255}
							if(isPlayer(getTopCreature(pos).uid)) then
								doPlayerSendTextMessage(getTopCreature(pos).uid,MESSAGE_LOOT,"You have been kicked from the arena.")
								doTeleportThing(getTopCreature(pos).uid,arena.exitpos)
							end
						end
						end
					else
					-- if ur pro shoren and publish it pls
					m = math.floor(arena_counter / 60)
					s = ((m * 60) - arena_counter) * (-1)
					if m == 0 then get_M = '' else if m == 1 then get_M = m .. ' minute' else get_M = m .. ' minutes' end end
					if m == 0 then
					if s == 0 then get_S = '' else if s == 1 then get_S = s.. ' second' else get_S = s.. ' seconds' end end
					else
					if s == 0 then get_S = '' else if s == 1 then get_S = ' and ' ..s.. ' second' else get_S = ' and ' ..s.. ' seconds' end end
					end
					doCreatureSay(cid, "There is still active duel.\n" .. get_M .. get_S .. " left.\nPlease wait for your turn.", TALKTYPE_ORANGE_1)
					pvpaback = addEvent(back, 5000, item.uid)
					return false
					end
					end
				end
			end
			-- let the match begin
			doSendMagicEffect(player1pos,CONST_ME_POFF)
			doSendMagicEffect(player2pos,CONST_ME_POFF)
			doPlayerSendTextMessage(getTopCreature(player1pos).uid,MESSAGE_STATUS_WARNING,"Fight!")
			doPlayerSendTextMessage(getTopCreature(player2pos).uid,MESSAGE_STATUS_WARNING,"Fight!")
			doTeleportThing(getTopCreature(player1pos).uid,nplayer1pos)
			doTeleportThing(getTopCreature(player2pos).uid,nplayer2pos)
			doSendMagicEffect(nplayer1pos,CONST_ME_TELEPORT)
			doSendMagicEffect(nplayer2pos,CONST_ME_TELEPORT)
			doTransformItem(getTileItemById(leverpos, 1945).uid,item.itemid+1)
			setGlobalStorageValue(24510,os.time() + duel_limit)
			pvpaback = addEvent(back, 5000, item.uid)
			if arena_gtfo ~= nil then
			stopEvent(arena_gtfo)
			end
			arena_gtfo = addEvent(gtfo, duel_limit * 1000)
		else
			doCreatureSay(cid, "You need two players to enter the arena.", TALKTYPE_ORANGE_1)
			pvpaback = addEvent(back, 5000, item.uid)
			return false
		end
	else
		-- if timer or checking is offline player can push the lever manually
		if pvpaback ~= nil then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_CANNOTUSETHISOBJECT)
		else
		doTransformItem(getTileItemById(leverpos, 1946).uid,1945)
		end
	end
return true
end