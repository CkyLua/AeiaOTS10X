local config =
{
    item = 10142,  -- WPISZ ID ITEMA KTÓRY MA USUWAÆ FRAGI PRAWYM KLIKNIÊCIEM 
    level = 1,
    count = 0
}
function onUse(cid, item, frompos, item2, topos)
if getPlayerLevel(cid) >= config.level then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your frags have been removed.")
        doRemoveItem(item.uid)
        db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
        doPlayerSetSkullEnd(cid, 0, SKULL_RED)  
        doPlayerSetSkullEnd(cid, 0, SKULL_BLACK) 
    else
        doPlayerSendCancel(cid, "You dot have enough level")
    end
    return TRUE
end