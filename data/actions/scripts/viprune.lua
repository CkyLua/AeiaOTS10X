function onUse(cid, item, frompos, item2, topos)

-- Config --

    local hearthstone = 7722 -- Add your ID there
    local price = 1000 -- Cost price
    local messageenter = "Home sweet home!"
    local messageerror = "Only able to use each 30 minute!"
   
-- Config End --

-- Action --
        if doPlayerRemoveMoney(cid, price) == TRUE then
            doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
            doSendMagicEffect(getCreaturePosition(cid), 12)
            doPlayerSendTextMessage(cid,2, messageenter)
        else
           
            doPlayerSendCancel(cid, messageerror)
        end
end