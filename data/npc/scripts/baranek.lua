random_items = {
{5,2112,1}, --  0.5% to get teddy bear

{20,2539,1}, -- 2% to phoenix shield
{40,2114,1}, -- 4% to piggy bank
{80,2108,1}, -- 8% to lalka
{80,2113,1}, -- 8% to statek
{80,8847,1}, -- 8% to chocolate cake
{400,5929,1}, -- 40% to goldfish bowl
{450,8874,1}, -- 45% to summer dress
{1000,10521,1} -- 100% moon backpack
}
PRESENT_STORAGE = 54166 -- storage ID



local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()                             npcHandler:onThink()                         end

function santaNPC(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    if (parameters.present == true) then
        if (getPlayerStorageValue(cid, PRESENT_STORAGE) < 1) then
            local item = {}
            local reward = 0
            local count = ""
            for i = 1, #random_items do
                item = random_items[i]
                if (math.random(0,999) < item[1]) then
                    reward = item[2]
                    subType = item[3]
                    if subType > 1 then
                        count = subType .. " "
                    end
                    break
                end
            end
            doPlayerAddItem(cid, reward, subType)
            setPlayerStorageValue(cid, PRESENT_STORAGE, 1)
            npcHandler:say('I have a gift for you! ' .. count .. getItemNameById(reward) .. ' for you!', cid)
        else
            npcHandler:say('You already got a gift.', cid)
        end
    else
        npcHandler:say('Too bad, I\'ll give it someone else.', cid)
    end
    npcHandler:resetNpc()
    return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|. I'm giving out {present}s!")

local noNode = KeywordNode:new({'no'}, santaNPC, {present = false})
local yesNode = KeywordNode:new({'yes'}, santaNPC, {present = true})

local node = keywordHandler:addKeyword({'present'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Have you been a good kid this year?'})
    node:addChildKeywordNode(yesNode)
    node:addChildKeywordNode(noNode)
npcHandler:addModule(FocusModule:new())  