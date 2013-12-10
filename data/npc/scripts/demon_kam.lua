local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'stones') or msgcontains(msg, 'demonic')) then
		selfSay('Do want to convert 400 demonic stones to premium point runes? ({yes})', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(getPlayerItemCount(cid, 6548) >= 400) then
				local item = getPlayerItemById(cid, true, 6548)
				doPlayerAddItem(cid, 2264)
				doPlayerRemoveItem(cid, 6548, 100)
				doPlayerRemoveItem(cid, 6548, 100)
				doPlayerRemoveItem(cid, 6548, 100)
				doPlayerRemoveItem(cid, 6548, 100)
				selfSay('Here yo go. Enjoy!', cid)
		else
			selfSay('You do not have enough stones.', cid)
		end
		
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay('Noob!', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
