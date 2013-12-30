function onUse(cid, item, frompos, item2, topos)
local lvl = getPlayerLevel(cid)
doCreatureSay(frompos,"Buhhh",210)
doPlayerSendCancel(cid,"Buhhh... .")
doSendMagicEffect(frompos,2)
if item.type > 1 then
doChangeTypeItem(item.uid,item.type-1)
else
doRemoveItem(item.uid,1)
end
return 1
end  