local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'bow'}, 2456, 400,'bow')
shopModule:addBuyableItem({'crossbow'}, 2455, 500,'crossbow')

shopModule:addBuyableItem({'royal spear'}, 7378, 15, 1,'royal spear')
shopModule:addBuyableItem({'spear'}, 2389, 10, 1,'spear')

shopModule:addBuyableItem({'arrow'}, 2544, 3, 1,'arrow')
shopModule:addBuyableItem({'sniper arrow'}, 7364, 5, 1,'sniper arrow')
shopModule:addBuyableItem({'earth arrow'}, 7850, 5, 1,'earth arrow')
shopModule:addBuyableItem({'flaming arrow'}, 7840, 5, 1,'flaming arrow')
shopModule:addBuyableItem({'flash arrow'}, 7838, 5, 1,'flash arrow')
shopModule:addBuyableItem({'onyx arrow'}, 7365, 7, 1,'onyx arrow')
shopModule:addBuyableItem({'shiver arrow'}, 7839, 5, 1,'shiver arrow')
shopModule:addBuyableItem({'poison arrow'}, 2545, 2, 1,'poison arrow')
shopModule:addBuyableItem({'burst arrow'}, 2546, 20, 1,'burst arrow')
shopModule:addBuyableItem({'bolt'}, 2543, 4, 1,'bolt')
shopModule:addBuyableItem({'power bolt'}, 2547, 7, 1,'power bolt')
shopModule:addBuyableItem({'piercing bolt'}, 7363, 5, 1,'piercing bolt')
shopModule:addBuyableItem({'infernal bolt'}, 6529, 50, 1,'infernal bolt')
shopModule:addBuyableItem({'throwing star'}, 2399, 42, 1,'throwing star')
shopModule:addBuyableItem({'assassin star'}, 7368, 100, 1,'assassin star')
shopModule:addBuyableItem({'viper star'}, 7366, 2, 1,'viper star')
shopModule:addBuyableItem({'throwing knife'}, 2410, 25, 1,'throwing knife')
shopModule:addBuyableItem({'small stone'}, 1294, 30, 1,'small stone')

shopModule:addSellableItem({'bow'}, 2456, 130,'bow')
shopModule:addSellableItem({'crossbow'}, 2455, 160,'crossbow')
shopModule:addSellableItem({'elvish bow'}, 7438, 2000,'elvish bow')
shopModule:addSellableItem({'arbalest'}, 5803, 125000,'arbalest')
shopModule:addSellableItem({'hive bow'}, 15643, 28000,'hive bow')
shopModule:addSellableItem({'ornate crossbow'}, 15644, 12000,'ornate crossbow')
shopModule:addSellableItem({'yols bow'}, 8856, 30000,'yols bow')
shopModule:addSellableItem({'royal crossbow'}, 8851, 350000,'royal crossbow')
shopModule:addSellableItem({'composite hornbow'}, 8855, 25000,'composite hornbow')
shopModule:addSellableItem({'chain bolter'}, 8850, 250000,'chain bolter')
shopModule:addSellableItem({'warsinger bow'}, 8854, 250000,'warsinger bow')
shopModule:addSellableItem({'modified crossbow'}, 8849, 10000,'modified crossbow')
shopModule:addSellableItem({'thorn spitter'}, 16111, 500000,'thorn spitter')
shopModule:addSellableItem({'silkweaver bow'}, 8857, 12000,'silkweaver bow')
shopModule:addSellableItem({'etethriels elemental bow'}, 8858, 30000,'etethriels elemental bow')
shopModule:addSellableItem({'the devileye'}, 8852, 800000,'the devileye')
shopModule:addSellableItem({'the ironworker'}, 8853, 80000,'the ironworker')
shopModule:addSellableItem({'mycological bow'}, 18454, 35000, 'mycological bow')
shopModule:addSellableItem({'crystal crossbow'}, 18453, 35000, 'crystal crossbow')
shopModule:addSellableItem({'spear'}, 2389, 3,'spear')

npcHandler:addModule(FocusModule:new())