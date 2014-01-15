getThingFromPos = getThingfromPos
getThingPosition = getThingPos
TALKTYPE_MONSTER = 34
TALKTYPE_MONSTER_SAY = 34
TALKTYPE_MONSTER_YELL = 35
MESSAGE_LOOT = 20
getCreatureStorage = getPlayerStorageValue
doCreatureSetStorage = setPlayerStorageValue

function doPlayerAddExperience(cid, xp)
Player(cid):addExperience(xp, true, true)
return true
end

table.find = function(table, value)
	for i, v in pairs(table) do
		if v == value then
			return i
		end
	end
	return nil
end

string.trim = function (str)
 return str:gsub("^%s*(.-)%s*$", "%1")
end

string.explode = function (str, sep, limit)
if(type(sep) ~= 'string' or isInArray({tostring(str):len(), sep:len()}, 0)) then
	return {}
end

 local i, pos, tmp, t = 0, 1, "", {}
 for s, e in function() return string.find(str, sep, pos) end do
  tmp = str:sub(pos, s - 1):trim()
  table.insert(t, tmp)
  pos = e + 1

  i = i + 1
  if(limit ~= nil and i == limit) then
   break
  end
 end

 tmp = str:sub(pos):trim()
 table.insert(t, tmp)
 return t
end

exhaustion =
{
	check = function (cid, storage)
		if(getPlayerFlagValue(cid, PLAYERFLAG_HASNOEXHAUSTION)) then
			return false
		end

		return getPlayerStorageValue(cid, storage) >= os.time()
	end,

	get = function (cid, storage)
		if(getPlayerFlagValue(cid, PLAYERFLAG_HASNOEXHAUSTION)) then
			return false
		end

		local exhaust = getPlayerStorageValue(cid, storage)
		if(exhaust > 0) then
			local left = exhaust - os.time()
			if(left >= 0) then
				return left
			end
		end

		return false
	end,

	set = function (cid, storage, time)
		setPlayerStorageValue(cid, storage, os.time() + time)
	end,

	make = function (cid, storage, time)
		local exhaust = exhaustion.get(cid, storage)
		if(not exhaust) then
			exhaustion.set(cid, storage, time)
			return true
		end

		return false
	end
}

function getArea(pos, x, y)
t = {}
f_area_i = 1
	for p = -x, x do
	for q = -y, y do
		f_area_i = f_area_i + 1
		t[f_area_i] = {x = pos.x + p, y = pos.y + q, z = pos.z}
	end
	end
	return t
end

	function getItemAttack(uid) return ItemType(getThing(uid).itemid):getAttack() end
	function getItemDefense(uid) return ItemType(getThing(uid).itemid):getDefense() end
	function getItemArmor(uid) return ItemType(getThing(uid).itemid):getArmor() end
	function getItemWeaponType(uid) return ItemType(getThing(uid).itemid):getWeaponType() end
	function isArmor(uid) if (getItemArmor(uid) ~= 0 and getItemWeaponType(uid) == 0) then return true else return false end end
	function isWeapon(uid) return isInArray({1,2,3}, getItemWeaponType(uid)) end
	function isShield(uid) return getItemWeaponType(uid) == 4 end
	function isBow(uid) return (getItemWeaponType(uid) == 5 and (not ItemType(getThing(uid).itemid):isStackable())) end