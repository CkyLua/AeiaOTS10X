  function onDeath(cid, corpse)
        if getPlayerStorageValue(cid, 36901) > 0 and getPlayerStorageValue(cid, 35700) < 1 then
                setPlayerStorageValue(cid, 36901, 0)
        end
        return true
end  