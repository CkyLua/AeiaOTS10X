function onUse(cid, item, frompos, item2, topos)
local lvl = getPlayerLevel(cid)
doCreatureSay(frompos,"Phh,Phh",130)
doPlayerSendCancel(cid,"Phhh... .")
doSendMagicEffect(frompos,2)
if item.type > 1 then
doChangeTypeItem(item.uid,item.type-1)
else
doRemoveItem(item.uid,0)
end
return 1
end  
--[[
function onUse(cid)
		doCreatureSay(uid, "Buhhh....", TALKTYPE_ORANGE_1)
		doRemoveItem(uid, 1, 2093)
	return true
end
]]