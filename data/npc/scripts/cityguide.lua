-- City Guide, adding mapmarks to locations by Limos
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)       npcHandler:onCreatureSay(cid, type, msg) end
function onThink()           npcHandler:onThink() end

local config = {
["Riona"] = {mark = {x = 1021, y = 987, z = 7}, type = MAPMARK_TICK, name = "Riona's Tool Shop", text = "shop", info = "Riona sells tools and backpacks."},
["Eryn"] = {mark = {x = 1022, y = 980, z = 7}, type = MAPMARK_TICK, name = "Eryn's shop", text = "shop", info = "Eryn sells all the magical stuff you need."},
["Runes"] = {mark = {x = 1027, y = 978, z = 8}, type = MAPMARK_TICK, name = "Rune shop", text = "shop", info = "Here you can buy all types of runes."},
["Rashid"] = {mark = {x = 1034, y = 981, z = 7}, type = MAPMARK_TICK, name = "Rashid's shop", text = "shop", info = "Here you can sell most of your loot."},
["Tyoric"] = {mark = {x = 1022, y = 988, z = 6}, type = MAPMARK_TICK, name = "Tyoric's shop", text = "shop", info = "He sells equipment for paladins."},
["Donald"] = {mark = {x = 1033, y = 980, z = 6}, type = MAPMARK_TICK, name = "Donald's shop", text = "shop", info = "He sells all sorts of food."},
["AOL Seller"] = {mark = {x = 1033, y = 980, z = 6}, type = MAPMARK_TICK, name = "AOL Seller", text = "aol", info = "He sells AOL."},
["Amulet Seller"] = {mark = {x = 1033, y = 980, z = 6}, type = MAPMARK_TICK, name = "Amulet Seller", text = "aol", info = "He sells amulets and trinkets."},
["Varkhal"] = {mark = {x = 1032, y = 1011, z = 7}, type = MAPMARK_TICK, name = "Addons", text = "Addons", info = "Varkhal sells addons."},
["Brigit"] = {mark = {x = 1031, y = 1000, z = 5}, type = MAPMARK_TICK, name = "Healer", text = "healer", info = "She is the town healer."},
["Depot"] = {mark = {x = 1031, y = 1006, z = 7}, type = MAPMARK_TICK, name = "Depot", text = "healer", info = "This is the Depo."},
["Temple"] = {mark = {x = 1000, y = 998, z = 7}, type = MAPMARK_TICK, name = "temple", text = "temple", info = "This is the temple."},
["Park"] = {mark = {x = 921, y = 1034, z = 7}, type = MAPMARK_TICK, name = "Park", text = "park", info = "This is the park, a nice place to relax."}
}

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

local function addCptl(first, rest)
return first:upper()..rest:lower()
end

local x = config[msg:gsub("(%a)([%w_']*)", addCptl)]

if(x and talkState[talkUser] ~= 2) then
selfSay('Do you want me to add a mapmark where you can '..x.text..' '..msg..'?', cid)
xmsg = msg
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
x = config[xmsg:gsub("(%a)([%w_']*)", addCptl)]
selfSay('Here you are.', cid)
doPlayerAddMapMark(cid, x.mark,x.type,x.name)
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and talkState[talkUser] == 1) then
selfSay('Ok then.', cid)
talkState[talkUser] = 0
elseif(msgcontains(msg, 'information')) then
selfSay('About which location do you want more information?', cid)
talkState[talkUser] = 2
elseif(talkState[talkUser] == 2) then
if(x) then
if(x.info) then
selfSay('' .. x.info, cid)
else
selfSay('Sorry, I can\'t give you any useful information about this location.', cid)
end
else
selfSay('I don\'t know about this place, look in the {list} which locations I know.', cid)
end
talkState[talkUser] = 0
elseif (msgcontains(msg, 'mapmark')) then
selfSay("Which location do you want to go?", cid)
talkState[talkUser] = 0
   elseif(msgcontains(msg, 'all')) then
     selfSay('Here you are.', cid)
     for _, m in pairs(config) do
       doPlayerAddMapMark(cid, m.mark, m.type, m.name)
     end
     talkState[talkUser] = 0
elseif(msgcontains(msg, 'list')) then
selfSay('Here is my list, tell me where you want to go or you can also ask me for {information} about a location.', cid)
local text = 'Locations\n'
for i, x in pairs(config) do
text = text .. '\n' .. i .. ''
end
doShowTextDialog(cid, 1949, '' .. text)
talkState[talkUser] = 0
else
local messages = {'Sorry, I have no idea what you mean with '..msg..'.', 'What?', 'What do you mean?', 'Hmm?', 'Tell me a location, you can look in the {list} which locations I know.'}
selfSay(messages[math.random(#messages)], cid)
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())