local config = {
	savePlayersOnAdvance = true
}

function onAdvance(cid, skill, oldLevel, newLevel)
	if(config.savePlayersOnAdvance) then
		Player(cid):save()
	end
	return true
end
