local config =
{
    item = 8976,  -- itemid the item you right click on and reset your frags.
    level = 10,
    count = 1
}

function onUse(cid, item, frompos, item2, topos)
if getPlayerLevel(cid) >= config.level then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your "..getPlayerRedSkullTicks(cid).." frags has been removed.")
        doRemoveItem(item.uid)
        doPlayerSetRedSkullTicks(cid, 0)
    else
        doPlayerSendCancel(cid, "You dot have enough level")
    end
    return TRUE
end 