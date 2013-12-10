function onUse(cid, item, fromPosition, itemEx, toPosition)
-- config --
local Storage = 5555 -- What global & player storage value to use!
local Price = math.random(500, 1000) -- Cost to gamble (500-1000 gp atm)
-- Win Chances --
local JackpotChance = math.random(1, 1000) -- 0.1% to win the jackpot
local Jackpot = getGlobalStorageValue(Storage) -- the jackpot is 100% of the jackpot..
    local BigWinChance = math.random(1, 400) -- 0.25% to win the "bigwin"
    local BigWinMinPrize = getGlobalStorageValue(Storage)/30 -- 1/30 of the jackpot is the min "bigwin" prize.
    local BigWinMaxPrize = getGlobalStorageValue(Storage)/15 -- 1/15 of the jackpot is the max "bigwin" prize.
    local BigWinPrize = math.random(BigWinMinPrize, BigWinMaxPrize)  -- Dont touch! xD
            local SmallWinChance = math.random(1, 200) -- 0.5% to win the "smallwin"
            local SmallWinMinPrize = getGlobalStorageValue(Storage)/30 -- 1/30 of the jackpot is the "smallwin" prize.
            local SmallWinMaxPrize = getGlobalStorageValue(Storage)/60 -- 1/30 of the jackpot is the "smallwin" prize.
            local SmallWinPrize = math.random(SmallWinMinPrize, SmallWinMaxPrize)  -- Dont touch! xD
-- Free Spin --
local FreeSpinChance = math.random(1, 100) -- 1% to get some free spins
local FreeSpins = math.random(1, 4) -- You can get 1-4 free spins
local FreeSpinStorage = getPlayerStorageValue(cid, Storage) -- Dont touch! xD
-- Item Chances --
    local Item1Chance = math.random(1, 100) -- 1% chance to win item 1
    local Item1 = 2472
    local Item2Chance = math.random(1, 50) -- 2% chance to win item 2
    local Item2 = 2471
-- config end --
if (getPlayerMoney(cid) >= Price or FreeSpinStorage >= 1) then
    if JackpotChance == 1 and getPlayerMoney(cid) >= Price then
        doPlayerAddMoney(cid, Jackpot)
            doPlayerSendTextMessage(cid, 22, "You have won the jackpot! " .. Jackpot .. " gold coins!")
                setGlobalStorageValue(Storage, 100)
                    doSetItemSpecialDescription(item, "Current jackpot: " .. Jackpot .. " gold coins.")
                        if FreeSpinStorage <= 0 then
                            doPlayerRemoveMoney(cid, Price)
                        else
                            setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                                doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
                        end
    else
            setGlobalStorageValue(Storage, Jackpot+Price)
                doPlayerRemoveMoney(cid, Price)
                    doPlayerSendTextMessage(cid, 22, "You lost. The jackpot is now " .. Jackpot .. ".")
                        doSetItemSpecialDescription(item, "Current jackpot: " .. Jackpot .. " gold coins.")
    end
    if JackpotChance >= 2 then
        if BigWinChance == 1 and getPlayerMoney(cid) >= Price then
            doPlayerAddMoney(cid, BigWinPrize)
                doPlayerSendTextMessage(cid, 22, "You have won the Big Win! " .. BigWinPrize .. " gold coins!")
                    setGlobalStorageValue(Storage, Jackpot-BigWinPrize)
                        doSetItemSpecialDescription(item, "Current jackpot: " .. Jackpot .. " gold coins.")
            if FreeSpinStorage <= 0 then
                doPlayerRemoveMoney(cid, Price)
            else
                setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                    doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
            end
        else   
            setGlobalStorageValue(Storage, Jackpot+Price)
                doPlayerSendTextMessage(cid, 22, "You lost. The jackpot is now " .. Jackpot .. ".")
                    doSetItemSpecialDescription(item, "Current jackpot: " .. Jackpot .. " gold coins.")
            if FreeSpinStorage <= 0 then
                doPlayerRemoveMoney(cid, Price)
            else
                setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                    doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
            end
        end
    end
    if JackpotChance >= 2 and BigWinChance >= 2 then
        if SmallWinChance == 1 and getPlayerMoney(cid) >= Price then
            doPlayerAddMoney(cid, SmallWinPrize)
                doPlayerSendTextMessage(cid, 22, "You have won the Small Win! " .. SmallWinPrize .. " gold coins!")
                    setGlobalStorageValue(Storage, Jackpot-SmallWinPrize)
                        doSetItemSpecialDescription(item, "Current jackpot: " .. Jackpot .. " gold coins.")
                            if FreeSpinStorage <= 0 then
                                doPlayerRemoveMoney(cid, Price)
                            else
                                setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                                    doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
                            end
        else   
            setGlobalStorageValue(Storage, Jackpot+Price)
                doPlayerSendTextMessage(cid, 22, "You lost. The jackpot is now " .. Jackpot .. ".")
                    doSetItemSpecialDescription(item, "Current jackpot: " .. Jackpot .. " gold coins.")
            if FreeSpinStorage <= 0 then
                doPlayerRemoveMoney(cid, Price)
            else
                setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                    doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
            end
        end
    end
    if Item1Chance == 1 and getPlayerMoney(cid) >= Price then
        doPlayerSendTextMessage(cid, 22, "You have won " ..Item1 ..".")
            doPlayerAddItem(cid, Item1)
                setGlobalStorageValue(Storage, Jackpot+Price)
                    if FreeSpinStorage <= 0 then
                        doPlayerRemoveMoney(cid, Price)
                    else
                        setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                            doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
                    end
    else   
        setGlobalStorageValue(Storage, Jackpot+Price)
            doPlayerSendTextMessage(cid, 22, "You lost. The jackpot is now " .. Jackpot .. ".")
                doSetItemSpecialDescription(item, "Current jackpot: " .. Jackpot .. " gold coins.")
                    if FreeSpinStorage <= 0 then
                        doPlayerRemoveMoney(cid, Price)
                    else
                        setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                            doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
                    end
    end
    if Item2Chance == 1 and getPlayerMoney(cid) >= Price then  
        doPlayerSendTextMessage(cid, 22, "You have won " ..Item2 ..".")
            doPlayerAddItem(cid, Item2)
                setGlobalStorageValue(Storage, Jackpot+Price)
                    if FreeSpinStorage <= 0 then
                        doPlayerRemoveMoney(cid, Price)
                    else
                        setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                            doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
                    end
    else   
        setGlobalStorageValue(Storage, Jackpot+Price)
            doPlayerSendTextMessage(cid, 22, "You lost. The jackpot is now " .. Jackpot .. ".")
                doSetItemSpecialDescription(item, "Current jackpot: " .. Jackpot .. " gold coins.")
                    if FreeSpinStorage <= 0 then
                        doPlayerRemoveMoney(cid, Price)
                    else
                        setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                            doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
                    end
    end    
    if FreeSpinChance == 1 and JackpotChance >= 2 and BigWinChance >= 2 and SmallWinChance >= 2 then
        setPlayerStorageValue(cid, Storage, FreeSpinStorage+FreeSpins)
            doPlayerSendTextMessage(cid, 22, "You have won some free spins! " .. FreeSpinStorage .. " spins left!")
                if FreeSpinStorage <= 0 then
                    doPlayerRemoveMoney(cid, Price)
                else
                    setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                        doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
                end
    else
        setGlobalStorageValue(Storage, Jackpot+Price)
            doPlayerSendTextMessage(cid, 22, "You lost. The jackpot is now " .. Jackpot .. ".")
                doSetItemSpecialDescription(item, "Current jackpot: " .. Jackpot .. " gold coins.")
                    if FreeSpinStorage <= 0 then
                        doPlayerRemoveMoney(cid, Price)
                    else
                        setPlayerStorageValue(cid, Storage, FreeSpinStorage-1)
                            doPlayerSendTextMessage(cid, 22, "You have used one of your free spins! " .. FreeSpinStorage .. " spins left!")
                    end
    end
else
            doPlayerSendTextMessage(cid, 22, "You don't have enough money. You need a random ammount between 500 and 1000 gold coins.")
end  
end