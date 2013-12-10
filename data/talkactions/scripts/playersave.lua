function onSay(cid, words, param)
	doPlayerSave(cid, true)
      doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You saved youself.")
	return true
end
