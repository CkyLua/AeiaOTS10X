function onSay(cid, words, param)
	if Player(cid):getAccountType() >= ACCOUNT_TYPE_GAMEMASTER then
		saveServer()
	end
return false
end