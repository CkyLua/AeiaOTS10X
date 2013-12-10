function onUse(cid, item, fromPosition, itemEx, toPosition)
	local firstPlayerPosition = {x = 1040, y = 987, z = 8, stackpos = STACKPOS_TOP_CREATURE}
	local getFirstPlayer = getThingFromPos(firstPlayerPosition)
	local secondPlayerPosition = {x = 1040, y = 989, z = 8, stackpos = STACKPOS_TOP_CREATURE}
	local getSecondPlayer = getThingFromPos(secondPlayerPosition)
	local arenaLevel = 25
	local firstPlayerLevel = getPlayerLevel(getFirstPlayer.uid)
	local secondPlayerLevel = getPlayerLevel(getSecondPlayer.uid)
	local newFirstPlayerPosition = {x = 1043, y = 988, z = 9}
	local newSecondPlayerPosition = {x = 1050, y = 988, z = 9}
	if(item.uid == 7001) then
		if(getFirstPlayer.itemid > 0 and getSecondPlayer.itemid > 0) then
			if(firstPlayerLevel >= arenaLevel and secondPlayerLevel >= arenaLevel) then
				for arenax = 1041, 1052 do
					for arenay = 985, 991 do
						local arenaPosition = {x=arenax, y=arenay, z=9, stackpos=253}
						local arenaCreature = getThingFromPos(arenaPosition)
						if(arenaCreature.itemid > 0 and isPlayer(arenaCreature.uid) == FALSE) then
							if(isMonster(arenaCreature.uid) == TRUE) then
								doRemoveCreature(arenaCreature.uid)
							end
						elseif(arenaCreature.itemid > 0 and isPlayer(arenaCreature.uid) == TRUE) then
							doPlayerSendCancel(cid, "Wait for current duel to end.")
							return TRUE
						end
					end
				end
				if(item.itemid == 1945) then
					doTransformItem(item.uid, 1946)
				elseif(item.itemid == 1946) then
					doTransformItem(item.uid, 1945)
				end
				doSendMagicEffect(firstPlayerPosition, 2)
				doSendMagicEffect(secondPlayerPosition, 2)
				doTeleportThing(getFirstPlayer.uid, newFirstPlayerPosition)
				doTeleportThing(getSecondPlayer.uid, newSecondPlayerPosition)
				doSendMagicEffect(newFirstPlayerPosition, 10)
				doSendMagicEffect(newSecondPlayerPosition, 10)
				doPlayerSendTextMessage(getFirstPlayer.uid, 18, "FIGHT!")
				doPlayerSendTextMessage(getSecondPlayer.uid, 18, "FIGHT!")
			else
				doPlayerSendCancel(cid, "Both fighters must have level 25.")
			end
		else
			doPlayerSendCancel(cid, "You need 2 players for a duel.")
		end
	end
	return TRUE
end