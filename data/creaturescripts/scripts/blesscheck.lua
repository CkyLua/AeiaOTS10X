--Script by Amiroslo
function onLogin(cid)
	if (getPlayerBlessing(cid, 1) and getPlayerBlessing(cid, 2) and getPlayerBlessing(cid, 3) and getPlayerBlessing(cid, 4) and getPlayerBlessing(cid, 5)) then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You are blessed!')
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'You are not blessed')
	end
	return true
end