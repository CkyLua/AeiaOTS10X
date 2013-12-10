function onStepIn(cid, item, frompos, item2, topos) 
local wall = {x=883, y=1220, z=10, stackpos=1}
local getwall = getThingFromPos(wall)
	if item.uid == 10257 then
		doCreateItem(1304, 1, wall)
	end
return TRUE
end