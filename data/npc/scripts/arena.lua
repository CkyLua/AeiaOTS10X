local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
random_word_arena = 0
local random_texts = {'Welcome to the Arena.', 'Fighting on three levels, only here.', 'Come in, don\'t be shy', 'Good challenges, epic rewards, only here.'}
local random_texts_chance = 10 -- percent
local random_texts_interval = 5 -- seconds
local talkNPC = 45451 --Storage to check if the player have paid to the npc and can enter to the arena.
local myArenaLevel = 45450 --here will be saved the arena level.
Arena = {
    --greenhorn
    [0] = {
        Cost = 1000, 
        LevelName = 'greenhorn', 
        LevelNeeded = 30,
        Goblet = 5807
        },
    --scrapper
    [1] = {
        Cost = 5000,
        LevelName = 'scrapper',
        LevelNeeded = 50,
        Goblet = 5806
        },
    --warlord
    [2] = {
        Cost = 10000, 
        LevelName = 'warlord',    
        LevelNeeded = 80,
        Goblet = 5805
        }
    }
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()
	if(random_word_arena < os.time()) then
		random_word_arena = (os.time() + random_texts_interval)
		if(math.random(1, 100) < random_texts_chance) then
			selfSay(random_texts[math.random(1, #random_texts)])
		end
	end
	npcHandler:onThink()
end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end
function greetCallback(cid)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local msg = {
		"Welcome to the {Arena}, " .. getPlayerName(cid) .. ".", 
		"No need to extend that discussion. If you want to {fight} just ask.", 
		"Welcome, " .. getPlayerName(cid) .. ". Welcome to the {Arena}.", 
		"Be greeted.", 
		"Hello, " .. getPlayerName(cid) .. "."
	}
	npcHandler:setMessage(MESSAGE_GREET, msg[math.random(1, #msg)])
	talkState[talkUser] = 0
	return true
end

function myArenaLevelIs(cid)
    Stor = getPlayerStorageValue(cid, myArenaLevel)
    if Stor == -1 then
        setPlayerStorageValue(cid, myArenaLevel, 0)
        Stor = 0
    elseif Stor == 3 then Stor = 2
    end
    return {
        RC = Arena[Stor].Cost, 
        LN = Arena[Stor].LevelName, 
        RLV = Arena[Stor].LevelNeeded,
        LV = getPlayerStorageValue(cid, myArenaLevel)
    }
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local enterArena = myArenaLevelIs(cid)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local msgenter = {
		"One fight at ".. enterArena.LN .." level will cost "..enterArena.RC.." gold. Do you have money with you?", 
		"To fight ".. enterArena.LN .." level you need "..enterArena.RC.." gold. Are you ready to pay?", 
		"It will cost "..enterArena.RC.." gold. Are you ready for ".. enterArena.LN .." level?", 
		"Do you want to fight at ".. enterArena.LN .." for "..enterArena.RC.." gold?"
	}
	if talkState[talkUser] == 1 and ((not msgcontains(msg, 'yes')) and (not msgcontains(msg, 'deal'))) then
	selfSay('Then not. Get away and don\'t waste my time!', cid)
	talkState[talkUser] = 0
	npcHandler:releaseFocus(cid)
	end
	if msgcontains(msg, 'fight') or msgcontains(msg, 'arena') or msgcontains(msg, 'enter') then
		if getPlayerStorageValue(cid, 75841) < 1 then
			if getPlayerStorageValue(cid, myArenaLevel) < 3 then
			local enterArena = myArenaLevelIs(cid)
				if getPlayerLevel(cid) >= enterArena.RLV then
				selfSay(msgenter[math.random(1, #msgenter)], cid)
				talkState[talkUser] = 1
				else
					selfSay("You need " .. enterArena.RLV .. " level to fight on ".. enterArena.LN .." mode.", cid)
				end
			else
				selfSay("Go take your rewards. You won all the challenges.", cid)
				talkState[talkUser] = 0
			end
		else
			selfSay("You have chosen ".. enterArena.LN .." mode. Use door on the left to begin.", cid)
		end
	end
	if msgcontains(msg, "difficult")then
		npcHandler:say("There are three difficulties: Greenhorn, Scrapper and Warlord. On each challenge you will be confronted with ten monsters increasing in strength. ...", cid)
		npcHandler:say("Besides the glory and honour you will earn we have unique awards for those who manage to pass the arena completely.", cid, 8000)
	end
	if msgcontains(msg, "death") or msgcontains(msg, "backpack") or msgcontains(msg, "die") then
		npcHandler:say("It would be better not to die! In every pit there is an emergency exit to the south. If you die in a pit... well... your corpse and backpack are gone, so enter at your own risk.", cid)
	end
	if msgcontains(msg, "rules")then
		npcHandler:say("What do you want to know? Something about the three different {difficulties}, the {general} rules or the {prices}? Maybe you also want to know what happens when you {die}?", cid)
	end
	if msgcontains(msg, "potion")then
		npcHandler:say("Like I said: Everything is allowed. Go in, kill monsters and try not to get killed by your own.", cid)
	end
	if msgcontains(msg, "weapon")then
		npcHandler:say("You can use whatever you want but be aware that you might lose items and your backpack if you die.", cid)
	end
	if msgcontains(msg, "general")then
		npcHandler:say("First you pay me the participation fee according to the difficulty you choose. This will grant you access to the door near me. ...", cid)
		npcHandler:say("There you will find a teleporter, which you can enter as soon as there is no battle going on there anymore. ...", cid, 8000)
		npcHandler:say("Beware though - when you enter the pit there is no turning back and the fight will start immediately! ...", cid, 13000)
		npcHandler:say("Should you notice that you have overestimated your abilities, you can run for your life and flee through the teleporter to the south of the pit. ...", cid, 17000)
		npcHandler:say("However, no real barbarian would run from a fight, right? When you successfully killed your opponent, a teleporter will appear to the west that brings you to the next pit. ...", cid, 21000)
		npcHandler:say("If there is still a fight going on in the pit you would proceed to, you will have to wait till he finish his battle. ...", cid, 26000)
		npcHandler:say("There is a time limit of ten minutes to finish each pit...", cid, 32000)
		npcHandler:say("If you take longer to kill the monster and leave the room you will be kicked out dishonourably.", cid, 36000)
	end
	if msgcontains(msg, "fee") or msgcontains(msg, "prices") then
		npcHandler:say("The fee depends on the difficulty you choose. If you are a Greenhorn you have to pay 1000 gold, as a Scrapper you have to pay 5000 gold and as a Warlord the participation fee is 10000 gold. Each competitor who manages to win all ten pits will win the arena goblet and an unique item appropriate to your difficulty level.", cid)
	end
	if(msgcontains(msg, 'yes') and talkState[talkUser] == 1) or (msgcontains(msg, 'deal') and talkState[talkUser] == 1) then
		if doPlayerRemoveMoney(cid, enterArena.RC) then
			setPlayerStorageValue(cid, talkNPC, 1)
			setPlayerStorageValue(cid, 75841, 1)
			selfSay('Good luck, future ' .. enterArena.LN .. '. Use door on the left.', cid)
		else
			selfSay('No arena for free! You need to pay first.', cid)
		end
	end	
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
