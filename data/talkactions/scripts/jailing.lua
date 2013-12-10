--[[
OTLAND.NET / CREDITS
  CREATED BY:
    master-m
  EDITED BY:
    Lithium: Shorten.
    Velik: Missing parts. Tested code.
    Colandus: Missing end. Works for both TFS and Evolutions. Added more "checks". Shorten alot.
]]
--[[
-- Start the function --
function onSay ( cid, words, param )

-- Edit these positions bewlow --

	-- The permission you need to jail someone --
	grouprequired = 3
	
	-- StorageValue that the player gets --
	jailedstoragevalue = 1338

	-- Set the position of the jail: --
	jailpos = {x = 1140, y = 939, z = 7}
	
	-- Set the position once unjailed: --
	unjailpos = { x = 1000, y = 998, z = 7 } 

-- Stop edting unless you know what you are doing --	

	-- Executes the code below if it is the word is /jail --
	if words == '/jail' then	
	
		-- Checks if the player is allowed to jail someone, said a playername to jail and looks if the player isn't in jail already --
		if getPlayerGroupId ( cid ) >= grouprequired and param ~= "" and getPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue ) == -1 then 
		
			-- The actual code --
			
			-- Gets the name of the one who jails someone --
			jailer = getPlayerName ( cid ) 
			
			-- Teleporting the person to jail --
			doTeleportThing ( getPlayerByName ( param ), jailpos, 0 )
			
			-- Sends a message to the jailed person --
			doPlayerSendTextMessage ( getPlayerByName ( param ), 25, 'You have been jalied by '..jailer..'' ) 
			
			-- Sends a message to the one who jails someone --
			doPlayerSendTextMessage ( cid, 21, "You just jailed "..param.."." )
			
			-- Gives the player a storage value to remember that he is jailed --
			setPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue, 1 )
			
		-- end of the actual code --
			
			
		-- What to do if the player don't have the permission --
		elseif getPlayerGroupId ( cid ) < grouprequired then
		
			-- Sends the player a message that he doesn't have permission to jail someone --
			doPlayerSendTextMessage ( cid, 21, "You are not permitted to jail anyone." )
			
		-- What to do if the player is already jailed --
		elseif getPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue ) ~= -1 then
		
			-- Sends the player a message if the player is already jailed --
			doPlayerSendTextMessage ( cid, 21, "This Player is already jailed." )
		
		-- What to do if the player didn't fill in a name --		
		else
				-- Sends the player a message that he forgot to fill in a playername --
				doPlayerSendTextMessage ( cid, 21, "You need to fill in a playername!" )
		
		-- Ends the checks --
		end
		
	-- Executes the code below if it is the word is /unjail --
	elseif words == '/unjail' then
	
		-- Checks if the player is allowed to unjail someone, said a playername to unjail and looks if the player isn't in unjailed already --
		if getPlayerGroupId ( cid ) >= grouprequired and param ~= "" and getPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue ) == 1 then 
		
			-- The actual code --
			
			-- Gets the name of the one who unjails someone --
			unjailer = getPlayerName ( cid )
			
			-- Teleporting the person outside the jail --
			doTeleportThing ( getPlayerByName ( param ), unjailpos, 0 )
			
			-- Sends a message to the unjailed person --
			doPlayerSendTextMessage ( getPlayerByName ( param ), 25, 'You have been unjailed by '..unjailer..'' )
			
			-- Sends a message to the one who unjailed someone --
			doPlayerSendTextMessage ( cid, 21,"You just unjailed "..param.."." )
			
			-- Removes the players  storage value so we know that he isn't jailed anymore. --
			setPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue, -1 )
			
			-- end of the actual code --
			
		
		-- What to do if the player don't have the permission --		
		elseif getPlayerGroupId ( cid ) < 4 then
		
			-- Sends the player a message that he doesn't have permission to unjail someone --
			doPlayerSendTextMessage ( cid, 21, "You cannot unjail someone!" )
		
		-- What to do if the player is already unjailed --
		elseif getPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue ) ~= 1 then
		
			-- Sends the player a message if the player is already unjailed --
			doPlayerSendTextMessage ( cid, 21, "This Player is already unjailed." )
			
		-- What to do if the player didn't fill in a name --	
		else
		
			-- Sends the player a message that he forgot to fill in a playername --
			doPlayerSendTextMessage ( cid, 21, "You need to fill in a playername!" )
			
		-- Ends the checks --	
		end
		
	-- Ends the ( un ) jailing part --	
	end		
	
-- Ends the function --	
end
]]



local config = {
    group = 3,
    storage = 1338,
    jailpos = { x = 1140, y = 939, z = 7 },
    unjailpos = { x = 1000, y = 998, z = 7 } 
}

function onSay (cid, words, param)
    if getPlayerGroupId(cid) < config.group then
      doPlayerSendCancel(cid, 'You do not have the permission to use this command.')
      return
    end

    if #param == 0 then
      doPlayerSendCancel(cid, string.format('Use: %s <playername>', words))
      return
    end
   
    local target = getPlayerByName(param)
    if not isPlayer(target) then
      doPlayerSendCancel(cid, string.format('Player with name %s not found.', param))
      return
    end
   
    if words == '/jail' then  
        if getPlayerStorageValue(target, config.storage) ~= -1 then
          doPlayerSendCancel(cid, 'Player is already jailed.')
          return
        end

        doTeleportThing(target, config.jailpos, false)
        doPlayerSendTextMessage(target, 25, string.format('You have been jalied by %s.', getPlayerName(cid)))
        doPlayerSendTextMessage(cid, 21, string.format('You just jailed %s.', getPlayerName(target)))
        setPlayerStorageValue(target, config.storage, 1)
    elseif words == '/unjail' then
        if getPlayerStorageValue(target, config.storage) ~= 1 then
          doPlayerSendCancel(cid, 'Player is not jailed.')
          return
        end
       
        doTeleportThing(target, config.unjailpos, false)
        doPlayerSendTextMessage(target, 25, string.format('You have been unjailed by %s.', getPlayerName(cid)))
        doPlayerSendTextMessage(cid, 21, string.format('You just unjailed %s.', getPlayerName(target)))
        setPlayerStorageValue(target, config.storage, -1)
    end      
end