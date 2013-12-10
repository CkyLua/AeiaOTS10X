local extracap = 1000

function getPlayerCap(cid)
    local test = db.getResult("SELECT `cap` FROM `players` WHERE `id` = " .. getPlayerGUID(cid))
    if test:getID() ~= false then
        local cap = test:getDataInt("cap")
        test:free()
        return cap
    end
    return false
end

function onEquip(cid, item, slot)
doPlayerSetMaxCapacity(cid, (getPlayerCap(cid) + extracap))
return true
end

function onDeEquip(cid, item, slot)
doPlayerSetMaxCapacity(cid, (getPlayerCap(cid) - extracap))
return true
end
