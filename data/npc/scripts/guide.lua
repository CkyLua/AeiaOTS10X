	

    local keywordHandler = KeywordHandler:new()
    local npcHandler = NpcHandler:new(keywordHandler)
    NpcSystem.parseParameters(npcHandler)
    local random_texts = {'Welcome to our humble temple.', 'If you are hurt ask me, I\'ll heal you.', 'Praise our God. He has power to revive adventurers whose adventure is not over yet!'}
    local random_texts_chance = 40 -- percent
    local random_texts_interval = 7 -- seconds
    local talkState = {}
     
    function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
    function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
    function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
    function onThink()                                      npcHandler:onThink() end
     
    function creatureSayCallback(cid, type, msg)
            if(not npcHandler:isFocused(cid)) then
                    return false
            end
     
            local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
     
        if msgcontains(msg, "heal") then
            if getCreatureCondition(cid, CONDITION_FIRE) == TRUE then
                npcHandler:say("You are burning. I will use water on you.", cid)
                doRemoveCondition(cid, CONDITION_FIRE)
                doSendMagicEffect(getCreaturePosition(cid), 14)
            elseif getCreatureCondition(cid, CONDITION_POISON) == TRUE then
                npcHandler:say("You are poisoned. I will cure you.", cid)
                doRemoveCondition(cid, CONDITION_POISON)
                doSendMagicEffect(getCreaturePosition(cid), 13)
            elseif getCreatureCondition(cid, CONDITION_ENERGY) == TRUE then
                npcHandler:say("You are electrificed. I will help you.", cid)
                doRemoveCondition(cid, CONDITION_ENERGY)
                doSendMagicEffect(getCreaturePosition(cid), 12)
            elseif getCreatureCondition(cid, CONDITION_PARALYZE) == TRUE then
                npcHandler:say("You are paralyzed. I will cure you.", cid)
                doRemoveCondition(cid, CONDITION_PARALYZE)
                doSendMagicEffect(getCreaturePosition(cid), 14)
            elseif getCreatureCondition(cid, CONDITION_DROWN) == TRUE then
                npcHandler:say("You are drowing. I will help you.", cid)
                doRemoveCondition(cid, CONDITION_DROWN)
                doSendMagicEffect(getCreaturePosition(cid), 12)
            elseif getCreatureCondition(cid, CONDITION_FREEZING) == TRUE then
                npcHandler:say("You are cold! I will burn you.", cid)
                doRemoveCondition(cid, CONDITION_FREEZING)
                doSendMagicEffect(getCreaturePosition(cid), 15)
            elseif getCreatureCondition(cid, CONDITION_DAZZLED) == TRUE then
                npcHandler:say("You are dazzled! Do not mess with holy creatures anymore!", cid)
                doRemoveCondition(cid, CONDITION_DAZZLED)
                doSendMagicEffect(getCreaturePosition(cid), 47)
            elseif getCreatureCondition(cid, CONDITION_CURSED) == TRUE then
                npcHandler:say("You are cursed! I will remove it.", cid)
                doRemoveCondition(cid, CONDITION_CURSED)
                doSendMagicEffect(getCreaturePosition(cid), 47)
            elseif getCreatureHealth(cid) < 200 then
                npcHandler:say("You are looking really bad. Let me heal your wounds.", cid)
                doCreatureAddHealth(cid, 250 - getCreatureHealth(cid))
                doSendMagicEffect(getCreaturePosition(cid), 12)
            elseif getCreatureHealth(cid) < 2000 then
                npcHandler:say("I did my best to fix your wounds.", cid)
                doCreatureAddHealth(cid, 2000 - getCreatureHealth(cid))
                doSendMagicEffect(getCreaturePosition(cid), 12)
            else
                local msgheal = {
                    "You aren't looking really bad, " .. getCreatureName(cid) .. ". I only help in cases of real emergencies. Raise your health simply by eating food.",
                    "Seriously? It's just a scratch",
                    "Don't be a child. You don't need any help with your health.",
                    "I'm not an expert. If you need help find a medic.",
                    "Don't even waste my time, I have bigger problems than your scratched armor."
                }
                npcHandler:say("" .. msgheal[math.random(1, #msgheal)] .. "", cid)
                            end
                    end
            return true
    end
     
    npcHandler:setCallback(CALLBACK_GREET, greetCallback)
    npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
    npcHandler:addModule(FocusModule:new())

