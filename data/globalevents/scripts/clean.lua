function executeClean()
	doCleanMap()
	doBroadcastMessage("Clean done. Next clean in 2 hours.")
	return true
end

function onThink(interval)
	doBroadcastMessage("Cleanup in 30 seconds, pick up your stuff!")
	addEvent(executeClean, 40000)
	return true
end
