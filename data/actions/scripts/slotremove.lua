function getSlotType_full(n)
   if not n then
     return false
   end
   if n:match('%[(.+)%]') then
     n = n:match('%[(.+)%]')
     if n == '?' then
       return 0,n
     else
       return n
     end
   else
     return false
   end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
item_slots_a = 0
item_slots_n = ""
item_slots_t = {}
   for _ in Item(itemEx.uid):getAttribute(ITEM_ATTRIBUTE_DESCRIPTION):gmatch('(%[.-%])') do
     item_slots_a = item_slots_a + 1
     item_slots_t[item_slots_a] = getSlotType_full(_)
   end
   
   if item_slots_t[1] == nil then
     return false
   end

   for i = 1, #item_slots_t - 1 do
   item_slots_n = item_slots_n .. "[" .. item_slots_t[i] .. "]"
   end
   
   doRemoveItem(item.uid,1)
   doSendMagicEffect(toPosition,CONST_ME_MAGIC_RED)
   doSetItemSpecialDescription(itemEx.uid, item_slots_n)
   doPlayerSendTextMessage(cid,20,"Attribute removed.")
return true
end