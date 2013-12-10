random_items = {
{1,2492,1}, --  0.1% do DSM
{1,2160,8}, --  0.1% do 8cc
{3,2446,10}, --  0.3% do pharaoh sword
{30,2146,12}, -- 3% do 12 small sapphires
{20,2152,6}, -- 2% do 6 platinum coins
{20,2056,1}, -- 2% do wypalonej pochodni
{40,2152,3}, -- 4% do 3 platinum coins
{80,7909,4}, -- 8% do orzeszkow
{80,2146,4}, -- 8% do 4 small sapphires
{80,7759,2}, -- 8% do enchanted small sapphire
{80,2643,1}, -- 8% do butow xD
{80,2152,1}, -- 8% do platinum coin
{100,2391,1}, -- 10% do war hammera
{150,2512,1}, -- 15% do tarczy
{150,2229,1}, -- 15% do smieci
{150,2228,1}, -- 15% do smieci
{150,2230,1}, -- 15% do smieci
{150,2233,1}, -- 15% do smieci
{200,2148,60}, -- 20% do 60 gold coins
{400,2146,2}, -- 30% do 2 small sapphires
{400,2148,40}, -- 40% do 40 gold coins
{1000,2148,20} -- 100% do 20 gold coins
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 8633) then
	randomliczb = math.random(0,100)

		if randomliczb > 50 then
			if getPlayerLevel(cid) >= 5 then
            		local item = {}
            		local reward = 0
            		local count = ""
            		for i = 1, #random_items do
            	      item = random_items[i]
                			if (math.random(0,999) < item[1]) then
                    			reward = item[2]
                    			subType = item[3]
                    			if subType > 1 then
                        		count = subType .. " "
                    		end
                    		break
                	end
            end

       doPlayerAddItem(cid, reward, subType)

	doSendMagicEffect(fromPosition,34)
      doPlayerSendTextMessage(cid, 22, "*kop* *kop*")
	doCreatureAddHealth(cid,-math.random(0,100))
	doPlayerAddExp(cid,math.random(0,500))
		end
else
	   		doSendMagicEffect(fromPosition,2)
                  doPlayerSendTextMessage(cid, 22, "Nic nie znalazles.")
			doCreatureAddHealth(cid,-math.random(0,100))
end
	end


end