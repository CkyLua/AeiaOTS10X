local config = {
    loginMessage = getConfigValue('loginMessage'),
    useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
    local loss = getConfigValue('deathLostPercent')
    if(loss ~= nil) then
        doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
    end

    if(not isPlayerGhost(cid)) then
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
    end

    registerCreatureEvent(cid, "Mail")
    registerCreatureEvent(cid, "GuildMotd")
    registerCreatureEvent(cid, "Idle")
    registerCreatureEvent(cid, "5cc")
    registerCreatureEvent(cid, "10cc")
    registerCreatureEvent(cid, "remover")
    registerCreatureEvent(cid, "FirstItems")

    if(config.useFragHandler) then
        registerCreatureEvent(cid, "SkullCheck")
    end
    registerCreatureEvent(cid, "ReportBug")
    registerCreatureEvent(cid, "KilledMonstersCounter")
    -- New insertion.
    registerCreatureEvent(cid, "KillingInTheNameOf")
    registerCreatureEvent(cid, "Advance")
    registerCreatureEvent(cid, "demonOakLogout")
    registerCreatureEvent(cid, "demonOakDeath") 
    registerCreatureEvent(cid, "VipCheck")
	registerCreatureEvent(cid, "CreateTeleport")
    return true
end
