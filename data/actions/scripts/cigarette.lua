function onUse(cid, item, frompos, item2, topos)
local lvl = getPlayerLevel(cid)
doSendAnimatedText(frompos,"L & M ;p",110)
doPlayerSendCancel(cid,"Buhhh... .")
doSendMagicEffect(frompos,2)
if item.type > 1 then
doChangeTypeItem(item.uid,item.type-1)
else
doRemoveItem(item.uid,0)
end
return 1
end  