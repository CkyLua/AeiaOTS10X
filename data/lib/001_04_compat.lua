getThingFromPos = getThingfromPos
getThingPosition = getThingPos
TALKTYPE_MONSTER = 34
TALKTYPE_MONSTER_SAY = 34
TALKTYPE_MONSTER_YELL = 35
MESSAGE_LOOT = 20

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

function isSummon(uid)
return Creature(uid):getMaster() ~= nil
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


	function getItemAttack(uid) return ItemType(getThing(uid).itemid):getAttack() end
	function getItemDefense(uid) return ItemType(getThing(uid).itemid):getDefense() end
	function getItemArmor(uid) return ItemType(getThing(uid).itemid):getArmor() end
	function getItemWeaponType(uid) return ItemType(getThing(uid).itemid):getWeaponType() end
	function isArmor(uid) if (getItemArmor(uid) ~= 0 and getItemWeaponType(uid) == 0) then return true else return false end end
	function isWeapon(uid) return isInArray({1,2,3}, getItemWeaponType(uid)) end
	function isShield(uid) return getItemWeaponType(uid) == 4 end
	function isBow(uid) return (getItemWeaponType(uid) == 5 and (not ItemType(getThing(uid).itemid):isStackable())) end
	
	
 function doPlayerWithdrawMoney(cid, amount)
   local balance = getPlayerBalance(cid)
   if(amount > balance or not doPlayerAddMoney(cid, amount)) then
     return false
   end

   doPlayerSetBalance(cid, balance - amount)
   return true
   end

   function doPlayerDepositMoney(cid, amount)
   if(not doPlayerRemoveMoney(cid, amount)) then
     return false
   end

   doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
   return true
   end
  
   function playerExists(name)
    local a = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = "' .. name .. '" LIMIT 1')
      if a then
       return true
      end
      return false
   end
  
   function doPlayerTransferMoneyTo(cid, target, amount)
     local balance = getPlayerBalance(cid)
     if(amount > balance) then
       return false
     end

     local tid = getPlayerByName(target)
     if(tid) then
       doPlayerSetBalance(tid, getPlayerBalance(tid) + amount)
     else
       if(playerExists(target) == false) then
         return false
       end

       db.query("UPDATE `players` SET `balance` = `balance` + '" .. amount .. "' WHERE `name` = '" .. target .. "'")
     end

     doPlayerSetBalance(cid, getPlayerBalance(cid) - amount)
     return true
   end