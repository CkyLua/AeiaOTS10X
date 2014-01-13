
local s = {
    repeatAfterDeath = false,
    detailedInfo = true,
    Storage = 70000, 
    messageType = 'channel', -- options: 'popUp' or 'channel'
--this one below only used if messageType = channel
    channelClass = MESSAGE_EVENT_ORANGE  
    }
 
function onAdvance(cid, skill, oldlevel, newlevel)
    if skill ~= SKILL_LEVEL or not s.repeatAfterDeath and getCreatureStorage(cid, s.Storage) >= newlevel then
        return true 
    end

    local t = {}
    for i = 0, getPlayerInstantSpellCount(cid) - 1 do
        local spell = getPlayerInstantSpellInfo(cid, i)
        if(spell.level ~= 0) and spell.level == newlevel then
            if(spell.manapercent > 0) then
                spell.mana = spell.manapercent .. '%'
            end
            table.insert(t, spell)
        end
    end
 
    table.sort(t, function(a, b) return a.level < b.level end)
    local text, prevLevel = '', -1
    for i, spell in ipairs(t) do
        local line = ''
        if(prevLevel ~= spell.level) then
            if(i ~= 1) then
                line = '\n'
            end
 
            line = line .. 'New spells available (Level '..newlevel..'):\n'
            prevLevel = spell.level
        end
        text = text ..line..' ['..spell.name..'] "'..spell.words..'" '..(s.detailedInfo and 'Mana: '..spell.mana..''..(spell.mlevel > 0 and ' ML: '..spell.mlevel..'' or '') or '')..'\n'
    end
 
    if text == '' then
        return true
    end
 
    doCreatureSetStorage(cid, s.Storage, newlevel)
    if s.messageType == 'popUp' then
        doShowTextDialog(cid, 2175, text)
    elseif s.messageType == 'channel' then
        doPlayerSendTextMessage(cid, s.channelClass, text)
    end
    return true
end