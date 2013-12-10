local cfg = 
{
    points = 25,
    effect = CONST_ME_GIFT_WRAPS
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if(not isPlayer(itemEx.uid)) then
        return false
    end

    db.executeQuery("UPDATE `znote_accounts` SET `points` = `points` + " .. cfg.points .. " WHERE `account_id` = '" .. getAccountIdByName(getCreatureName(itemEx.uid)) .. "' LIMIT 1;")
    doCreatureSay(cid, "You got " .. cfg.points .. " premium points!", TALKTYPE_ORANGE_1, false, nil, toPosition)
    doSendMagicEffect(toPosition, cfg.effect)
    doRemoveItem(item.uid, 1)
    return true
end  


--getAccountIdByAccount


-- ORIGINAL "getAccountByName"