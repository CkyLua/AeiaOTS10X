-----------------------------------
-------<<< TileCar-Script >>>------
-----<<< created by Zyntax >>>-----
-----------------------------------
-----<<< Special Thanks to >>>-----
-----<<< RAGHEED& COLANDUS >>>-----
-----------------------------------
-------<<< @ OTFans.net >>>--------
-----------------------------------

--Edit the STARTing Position--
local start = {x=985, y=1360, z=8}

--- 0 = create tile GORA
--- 1 = create tile LEWO
-- -1 = create tile PRAWO
--- 2 = create tile POLUDNIE
local d = {-1,-1,-1,-1,0,0,0,0,1,1,0,0,0,0,-1,-1,-1,0,0,0,0,-1,0,0,0,0,0,0,1,0,0,0,0,-1,-1,-1,0,-1,0,-1,-1,-1,-1,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,-1,-1,-1,2,2,2,2,2,2,2,-1,-1,-1,2,2,2,2,2,1,2,2,2,2,2,2,-1,-1,-1,-1,-1,2,-1,-1,-1,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,2,2,2,2,2,-1,2,-1,-1,0,0,0,0,-1,-1,-1,-1,-1,-1,-1,2,2,2,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,-1,-1,-1,2,-1,-1,-1,2,2,2,2,2,1,1,1,2,2,2,2,2,-1,-1,-1,-1,-1,-1,-1,2,2,2,2,-1,-1,-1,-1,0,0,-1,-1,-1,-1,2,2,-1,-1,-1,-1}
local speed = 750 --Every 0.5 seconds a tile will be created.

--EXPLAINING:
--local d = {up,up,up,left,left,left,up,up,up,up,right,right,right,right,down,down,down,right,right,up,up,up,up,up,left,left,left,up}

-----!!!DO NOT EDIT THE LINES BELOW!!!----
local count = 1
local U = 0
local S = 0
local position = {}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.itemid == 1946 then
        doPlayerSendCancel(cid, 'You have to wait.')
    else
        doTransformItem(item.uid, 1946)
        addEvent(go, speed, count, start, cid, U, S)
    end
return true
end

function go(count, start, cid, U, S)
    if d[count] == 0 then
        U = U-1
    elseif d[count] == 1 then
        S = S-1
    elseif d[count] == -1 then
        S = S+1
    elseif d[count] == 2 then
        U = U+1
    elseif count == (#d+3) then
        doTransformItem(getThingFromPos({x=985, y=1359, z=8, stackpos=1}).uid, 1945)
        return true
    end
    table.insert (position, {x=start.x+S, y=start.y+U, z=start.z})
    if count <= 2 then
        doCreateItem(9146, position[count])
    elseif count > 2 and count <= (#d) then
        doCreateItem(9146, position[count])
        doCreateItem(100, position[count-2])
        doSendMagicEffect(position[count-2], 2)
        teleport(cid, start, count)
    elseif count > (#d) and count <= (#d+2) then
        doCreateItem(100, position[count-2])
        doSendMagicEffect(position[count-2], 2)
        teleport(cid, start, count)
    end
    addEvent(go, speed, count+1, start, cid, U, S)
end

function teleport(cid, start, count)
local pos = {x=position[count-2].x, y=position[count-2].y, z=position[count-2].z, stackpos=255}
    if isPlayer(getThingFromPos(pos).uid) == TRUE then
        doTeleportThing(cid, start)
        doSendMagicEffect(start, 10)
        doPlayerSay(cid, 'Damn! I\'m too slow!', 19)
    end
end