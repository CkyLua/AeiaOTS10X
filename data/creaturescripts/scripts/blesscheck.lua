--Script by Amiroslo
function onLogin(cid)
if(getPlayerBlessing(cid, 1)) then
doPlayerSendTextMessage(cid,13,'You are blessed!')
else
doPlayerSendTextMessage(cid,5,'You are not blessed')
end
return true
end