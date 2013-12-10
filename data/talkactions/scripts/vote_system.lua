--Vote System by Vooden
function vote_clean()
         setGlobalStorageValue(9955, 0)
         setGlobalStorageValue(2222, 0)
         setGlobalStorageValue(2223, 0)
return 1
end
function vote_end()
         doBroadcastMessage("Results of the vote : "..getGlobalStorageValue(2222).." said yes and "..getGlobalStorageValue(2223).." said no.")
	   addEvent(vote_clean, 2000)
         return 1
end
function onSay(cid, words, param)
local vote_end_time = 60 -- czas glosowania
         if getGlobalStorageValue(9955) ~= 1 then
                    if words == '/vote' then
                       addEvent(vote_end, vote_end_time * 1000)
                       doBroadcastMessage(""..param.." To vote say !yes or !no. You cant change your decision.")
                       setGlobalStorageValue(9955, 1)
                    end
         end
     if getGlobalStorageValue(9955) == 1 then    
         if words == '!yes' and getPlayerStorageValue(cid,7236) <= os.time() then
           setGlobalStorageValue(2222, getGlobalStorageValue(2222) + 1)
           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'I said yes.')
           setPlayerStorageValue(cid,7236, os.time()+(vote_end_time))
         elseif words == '!no' and getPlayerStorageValue(cid,7236) <= os.time() then
           setGlobalStorageValue(2223, getGlobalStorageValue(2223) + 1)
           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'I said no.')
           setPlayerStorageValue(cid,7236, os.time()+(vote_end_time))
         elseif getPlayerStorageValue(cid,7236) >= os.time() then
           doPlayerSendCancel(cid,"You have already voted.") 
         end
     else
         doPlayerSendCancel(cid,"Voting has not started yet.")
     end    
return 1
end