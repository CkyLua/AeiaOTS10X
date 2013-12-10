local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if msgcontains(msg, 'marry') or msgcontains(msg, 'marriage') then
        if getPlayerStorageValue(cid,3066) == -1 then
            selfSay('Would you like to marry?', cid)
            talkState[talkUser] = 1
        elseif getPlayerStorageValue(cid,3066) == 1 then
            local fid = getPlayerGUID(cid)
            local marrystatus = getOwnMarryStatus(fid)
            if marrystatus ~= 0 then
                local newpartner = getPlayerNameByGUID(marrystatus)
                selfSay('Have you ever set a wedding date with{' .. newpartner .. '}, now I need to talk to your partner. you want {cancel}?', cid)
                talkState[talkUser] = 5
            else
                setPlayerStorageValue(cid,3066,-1)
                selfSay('Would you like to marry?', cid)
                talkState[talkUser] = 1
            end
        elseif getPlayerStorageValue(cid,3066) == 2 then
            selfSay('You are already married. If you want a {divorce}, just say it.', cid)
            talkState[talkUser] = 0
        end

    elseif msgcontains(msg, 'divorce') then
        if getPlayerStorageValue(cid,3066) == 2 then
            selfSay('Are you sure you want to divorce your partner?', cid)
            talkState[talkUser] = 6
        else
            selfSay('You are not married. Would you like to {marry}?', cid)
            talkState[talkUser] = 0
        end
    end

    if talkState[talkUser] == 1 then
        if msgcontains(msg, 'yes') then
            local fid = getPlayerGUID(cid)
            local marrystatus = getMarryStatus(fid)
            if marrystatus == FALSE then
                selfSay('And what is the name of your future partner?', cid)
                talkState[talkUser] = 2
            else
                local marryname = getPlayerNameByGUID(marrystatus)
                selfSay('{' .. marryname .. '} marked the wedding date with you. Do you want to {continue} or {cancel the wedding?}', cid)
                talkState[talkUser] = 4
            end
        end

    elseif talkState[talkUser] == 2 then
        local p = msg
        local player = getPlayerName(cid)
        local fid = getPlayerGUID(cid)
        local sid = getPlayerGUIDByName(p)
        if not sid or sid == 0 then
            selfSay('There is no player with this name.', cid)
            talkState[talkUser] = 0
        elseif sid == fid then
            selfSay('Do not worry, you will always be married to yourself.', cid)
            talkState[talkUser] = 0
        else
            local marrystatus = getMarryStatus(fid)
            local pmarriage = getPlayerMarriage(sid)
            local ownstatus = getOwnMarryStatus(cid)
            if pmarriage == FALSE then
                if marrystatus == FALSE then
                    if ownstatus == FALSE then
                        setPlayerStorageValue(cid,3066,1)
                        addMarryStatus(fid,sid)
                        selfSay('You just set a marriage date {' .. p .. '}.', cid)
                        talkState[talkUser] = 0
                    else
                        local partnername = getPlayerNameByGUID(ownstatus)
                        selfSay('{' .. p .. '} already marked the date of marriage {' .. partnername .. '}.', cid)
                        talkState[talkUser] = 0
                    end
                else
                    local marryname = getPlayerNameByGUID(marrystatus)
                    selfSay('{' .. marryname .. '} marked the wedding date with you. You want to {continue} or {cancel the wedding?}', cid)
                    talkState[talkUser] = 4
                end
            else
                local pname = getPlayerNameByGUID(pmarriage)
                selfSay('Sorry, but {' .. p .. '} is married {' .. pname .. '}.', cid)
                talkState[talkUser] = 0
            end
        end

    elseif talkState[talkUser] == 4 then
        if msgcontains(msg, 'continue') then
            local fid = getPlayerGUID(cid)
            local sid = getMarryStatus(fid)
            local marryname = getPlayerNameByGUID(sid)
            local pid = getPlayerByNameWildcard(marryname)
                local tmf = getCreaturePosition(cid)
                local    tms = getCreaturePosition(pid)
                local text = {'I love you ',' My love! "," My passion!'}
                local chance1 = math.random(1,table.getn(text))
                local chance2 = math.random(1,table.getn(text))
                local dateFormat = "%A %d"..getMonthDayEnding(os.date("%d")).." %B %Y"
                                local ring = doPlayerAddItem(cid,10502,1)
                                local ring2 = doPlayerAddItem(pid,10502,1)

            if isOnline(fid) == TRUE and isOnline(sid) == TRUE then
            if getDistanceBetween(tmf, tms) <= 3 then
                    setPlayerStorageValue(cid,3066,2)
                    setPlayerStorageValue(pid,3066,2)
                    doCancelMarryStatus(fid)
                    doCancelMarryStatus(sid)
                    setPlayerPartner(cid,sid)
                    setPlayerPartner(pid,fid)
                                        doPlayerAddOutfitId(cid,23,0)
                                        doPlayerAddOutfitId(pid,23,0)
                                        doItemSetAttribute(ring, "description", "" .. getCreatureName(cid) .. " & " .. getCreatureName(pid) .. " forever - married on " ..os.date(dateFormat).. ".")
                                        doItemSetAttribute(ring2, "description", "" .. getCreatureName(cid) .. " & " .. getCreatureName(pid) .. " forever - married on " ..os.date(dateFormat).. ".")
                    doCreatureSay(cid, text[chance1], TALKTYPE_ORANGE_1)
                    doCreatureSay(pid, text[chance2], TALKTYPE_ORANGE_1)
                    doSendMagicEffect(tmf, 35)
                    doSendMagicEffect(tms, 35)
                    selfSay('Congratulations! By now, you can kiss it! Whenever you want this effect, just say {!love}. You need to be close to your partner.', cid)
                    talkState[talkUser] = 0

                else
                    selfSay('Your partner should be close to you so you can get married!', cid)
                    talkState[talkUser] = 0
                end
            else
                selfSay('You and your new partner should be online at the same time.', cid)
                talkState[talkUser] = 0
            end
            


        elseif msgcontains(msg, 'cancel') then
            local fid = getPlayerGUID(cid)
            local sid = getMarryStatus(fid)
            local marryname = getPlayerNameByGUID(sid)
            local pid = getPlayerByNameWildcard(marryname)
            if isOnline(sid) == TRUE then
                setPlayerStorageValue(pid,3066,-1)
            end
            doCancelMarryStatus(sid)
            selfSay('You canceled your wedding date with {' .. marryname .. '}.', cid)
            talkState[talkUser] = 0
        end

    elseif talkState[talkUser] == 5 then
        if msgcontains(msg, 'cancel') or msgcontains(msg, 'yes') then
            local fid = getPlayerGUID(cid)
            setPlayerStorageValue(cid,3066,-1)
            doCancelMarryStatus(fid)
            talkState[talkUser] = 0
        end

    elseif talkState[talkUser] == 6 then
        if msgcontains(msg, 'yes') then
            local fid = getPlayerGUID(cid)
            local sid = getPlayerPartner(cid)
            local marryname = getPlayerNameByGUID(sid)
            local pid = getPlayerByNameWildcard(marryname)
            if (isOnline(fid) == TRUE and isOnline(sid) == TRUE) then
                setPlayerStorageValue(cid,3066,-1)
                setPlayerStorageValue(pid,3066,-1)
                setPlayerPartner(cid,0)
                setPlayerPartner(pid,0)
                                doPlayerAddOutfitId(cid,23,-1)
                                doPlayerAddOutfitId(pid,23,-1)
                selfSay('You just divorced your former partner.', cid)
                talkState[talkUser] = 0
            else
                selfSay('You and your partner must be online at the same time.', cid)
                talkState[talkUser] = 0
            end
        end

    end


    return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())