--Script by Amiroslo
function onLogin(cid)
if(getPlayerBlessing(cid, 1)) then
doPlayerSendTextMessage(cid,16,'You are blessed!')
else
doPlayerSendTextMessage(cid,4,'You are not blessed')
end
return true
end