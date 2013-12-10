  function onSay(cid, words, param, channel)
local config = {
          groupID = 6, -- Protect GroupID 1,2,3,4,5,6 = GOD
          temple = { x = 1000, y = 1000, z = 7 },
          depo = { x = 1028, y = 996, z = 7 }
          };
 
        for _, cid in ipairs(getPlayersOnline()) do

if  (getPlayerGroupId(cid) == config.groupID) then
        if(param == '') then
                        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Help: use !tpall x,y,z or !tpall depo or !tpall temple.")
        return TRUE
end

for _, cid in ipairs(getPlayersOnline()) do
if  (getPlayerGroupId(cid) < config.groupID) then
                    if(param == 'carlin') then
                        doTeleportThing(cid, config.temple)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "All were teleported to the temple.")
                        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_YELLOW)

                	elseif(param == 'edron') then
                        doTeleportThing(cid, config.depo)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "All were teleported to the depo.")
                        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_YELLOW)


                else
                local t = string.explode(param, ",")
                        doTeleportThing(cid, { x = t[1], y = t[2], z = t[3] }  )
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Everyone was teleported to: [X:"..t[1].."], [Y:"..t[2].."], [Z:"..t[3].."]")
                        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_YELLOW)
end
end
end
end
end
        return TRUE
end 