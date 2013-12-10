function onUse(cid, item, fromPosition, itemEx, toPosition)
	local leverpos1 = {x=902, y=1265, z=11, stackpos=1}
	local lever1 = getThingfromPos(leverpos1)
	local leverpos2 = {x=899, y=1306, z=11, stackpos=1}
	local lever2 = getThingfromPos(leverpos2)
	local leverpos3 = {x=943, y=1277, z=11, stackpos=1}
	local lever3 = getThingfromPos(leverpos3)
	local leverpos4 = {x=930, y=1281, z=11, stackpos=1}
	local lever4 = getThingfromPos(leverpos4)
	local leverpos5 = {x=903, y=1279, z=12, stackpos=1}
	local lever5 = getThingfromPos(leverpos5)
	local leverpos6 = {x=906, y=1313, z=12, stackpos=1}
	local lever6 = getThingfromPos(leverpos6)
	local leverpos7 = {x=916, y=1311, z=12, stackpos=1}
	local lever7 = getThingfromPos(leverpos7)
	local leverpos8 = {x=930, y=1312, z=12, stackpos=1}
	local lever8 = getThingfromPos(leverpos8)
	local leverpos9 = {x=943, y=1302, z=12, stackpos=1}
	local lever9 = getThingfromPos(leverpos9)
	local leverpos10 = {x=909, y=1306, z=13, stackpos=1}
	local lever10 = getThingfromPos(leverpos10)
	local leverpos11 = {x=899, y=1299, z=13, stackpos=1}
	local lever11 = getThingfromPos(leverpos11)
	local leverpos12 = {x=930, y=1301, z=13, stackpos=1}
	local lever12 = getThingfromPos(leverpos12)
	local leverpos13 = {x=947, y=1275, z=13, stackpos=1}
	local lever13 = getThingfromPos(leverpos13)
	local leverpos14 = {x=945, y=1296, z=14, stackpos=1}
	local lever14 = getThingfromPos(leverpos14)
	local wallpos1 = {x=907, y=1280, z=11, stackpos=1}
	local wallpos2 = {x=908, y=1280, z=11, stackpos=1}
	local wall1 = getThingfromPos(wallpos1)
	local wall2 = getThingfromPos(wallpos2)
	if(item.actionid == 10283) then
		if(item.itemid == 1945) then
			doTransformItem(item.uid,item.itemid+1)
		elseif(item.itemid == 1946) then
			doTransformItem(item.uid,item.itemid-1)
		end
		if(item.actionid == 10283 and lever1.itemid == 1946 and lever2.itemid == 1946 and lever3.itemid == 1946 and lever4.itemid == 1946 and lever5.itemid == 1946 and lever6.itemid == 1946 and lever7.itemid == 1946 and lever8.itemid == 1946 and lever9.itemid == 1946 and lever10.itemid == 1946 and lever11.itemid == 1946 and lever12.itemid == 1946 and lever13.itemid == 1946 and lever14.itemid == 1946 and wall1.itemid == 0 and wall2.itemid == 0) then
			doCreateItem(1304,1,wallpos1)
			doCreateItem(1304,1,wallpos2)
		elseif(item.actionid == 10283 and lever1.itemid == 1946 and lever2.itemid == 1946 and lever3.itemid == 1946 and lever4.itemid == 1946 and lever5.itemid == 1946 and lever6.itemid == 1946 and lever7.itemid == 1946 and lever8.itemid == 1946 and lever9.itemid == 1946 and lever10.itemid == 1946 and lever11.itemid == 1946 and lever12.itemid == 1946 and lever13.itemid == 1946 and lever14.itemid == 1946 and wall1.itemid == 1304 and wall2.itemid == 1304) then
			doRemoveItem(wall1.uid,1)
			doRemoveItem(wall2.uid,1)
		else
			doPlayerSendCancel(cid,"All fourteen levers have to be pulled to remove stones.")
		end
	else 
		doPlayerSendCancel(cid,"Sorry, not possible.") 
	end
	return TRUE	
end