local questCreatures =
{
["troll"] = {questStarted = 65000, questStorage = 65100, creatureStorage = 15000, killsRequired = 100, raceName = "Trolls"},
["frost troll"] = {questStarted = 65000, questStorage = 65100, creatureStorage = 15001, killsRequired = 100, raceName = "Trolls"},
["furious troll"] = {questStarted = 65000, questStorage = 65100, creatureStorage = 15002, killsRequired = 100, raceName = "Trolls"},
["island troll"] = {questStarted = 65000, questStorage = 65100, creatureStorage = 15003, killsRequired = 100, raceName = "Trolls"},
["swamp troll"] = {questStarted = 65000, questStorage = 65100, creatureStorage = 15004, killsRequired = 100, raceName = "Trolls"},
["troll champion"] = {questStarted = 65000, questStorage = 65100, creatureStorage = 15005, killsRequired = 100, raceName = "Trolls"},
["troll legionnaire"] = {questStarted = 65000, questStorage = 65100, creatureStorage = 15006, killsRequired = 100, raceName = "Trolls"},
["goblin"] = {questStarted = 65001, questStorage = 65101, creatureStorage = 15007, killsRequired = 150, raceName = "Goblins"},
["goblin assassin"] = {questStarted = 65001, questStorage = 65101, creatureStorage = 15008, killsRequired = 150, raceName = "Goblins"},
["goblin leader"] = {questStarted = 65001, questStorage = 65101, creatureStorage = 15009, killsRequired = 150, raceName = "Goblins"},
["goblin scavenger"] = {questStarted = 65001, questStorage = 65101, creatureStorage = 15010, killsRequired = 150, raceName = "Goblins"},
["rotworm"] = {questStarted = 65002, questStorage = 65102, creatureStorage = 15011, killsRequired = 300, raceName = "Rotworms"},
["carriom worm"] = {questStarted = 65002, questStorage = 65102, creatureStorage = 15012, killsRequired = 300, raceName = "Rotworms"},
["cyclops"] = {questStarted = 65003, questStorage = 65103, creatureStorage = 15013, killsRequired = 500, raceName = "Cyclops"},
["cyclops smith"] = {questStarted = 65003, questStorage = 65103, creatureStorage = 15014, killsRequired = 500, raceName = "Cyclops"},
["cyclops drone"] = {questStarted = 65003, questStorage = 65103, creatureStorage = 15015, killsRequired = 500, raceName = "Cyclops"},
["crocodile"] = {questStarted = 14007, questStorage = 14107, creatureStorage = 15016, killsRequired = 300, raceName = "Crocodiles"},
["tarantula"] = {questStarted = 14008, questStorage = 14108, creatureStorage = 15017, killsRequired = 300, raceName = "Tarantulas"},
["carniphila"] = {questStarted = 14009, questStorage = 14109, creatureStorage = 15018, killsRequired = 150, raceName = "Carniphilas"},
["stone golem"] = {questStarted = 14010, questStorage = 14110, creatureStorage = 15019, killsRequired = 200, raceName = "Stone Golems"},
["mammoth"] = {questStarted = 14011, questStorage = 14111, creatureStorage = 15020, killsRequired = 300, raceName = "Mammoths"},
["ice golem"] = {questStarted = 14012, questStorage = 14112, creatureStorage = 15021, killsRequired = 300, raceName = "Ice Golems"},
["quara predator scout"] = {questStarted = 14013, questStorage = 14113, creatureStorage = 15022, killsRequired = 300, raceName = "Quaras Scout"},
["quara constrictor scout"] = {questStarted = 14013, questStorage = 14113, creatureStorage = 15023, killsRequired = 300, raceName = "Quaras Scout"},
["quara hydromancer scout"] = {questStarted = 14013, questStorage = 14113, creatureStorage = 15024, killsRequired = 300, raceName = "Quaras Scout"},
["quara mantassin scout"] = {questStarted = 14013, questStorage = 14113, creatureStorage = 15025, killsRequired = 300, raceName = "Quaras Scout"},
["quara pincher scout"] = {questStarted = 14013, questStorage = 14113, creatureStorage = 15026, killsRequired = 300, raceName = "Quaras Scout"},
["quara predator"] = {questStarted = 14014, questStorage = 14114, creatureStorage = 15027, killsRequired = 300, raceName = "Quaras"},
["quara constrictor"] = {questStarted = 14014, questStorage = 14114, creatureStorage = 15028, killsRequired = 300, raceName = "Quaras"},
["quara hydromancer"] = {questStarted = 14014, questStorage = 14114, creatureStorage = 15029, killsRequired = 300, raceName = "Quaras"},
["quara mantassin"] = {questStarted = 14014, questStorage = 14114, creatureStorage = 15030, killsRequired = 300, raceName = "Quaras"},
["quara pincher"] = {questStarted = 14014, questStorage = 14114, creatureStorage = 15031, killsRequired = 300, raceName = "Quaras"},
["water elemental"] = {questStarted = 14015, questStorage = 14115, creatureStorage = 15032, killsRequired = 70, raceName = "Water Elementals"},
["roaring water elemental"] = {questStarted = 14015, questStorage = 14115, creatureStorage = 15033, killsRequired = 70, raceName = "Water Elementals"},
["slick water elemental"] = {questStarted = 14015, questStorage = 14115, creatureStorage = 15034, killsRequired = 70, raceName = "Water Elementals"},
["massive water elemental"] = {questStarted = 14015, questStorage = 14115, creatureStorage = 15035, killsRequired = 70, raceName = "Water Elementals"},
["earth elemental"] = {questStarted = 14016, questStorage = 14116, creatureStorage = 15036, killsRequired = 70, raceName = "Earth Elementals"},
["jagged earth elemental"] = {questStarted = 14016, questStorage = 14116, creatureStorage = 15037, killsRequired = 70, raceName = "Earth Elementals"},
["massive earth elemental"] = {questStarted = 14016, questStorage = 14116, creatureStorage = 15038, killsRequired = 70, raceName = "Earth Elementals"},
["muddy earth elemental"] = {questStarted = 14016, questStorage = 14116, creatureStorage = 15039, killsRequired = 70, raceName = "Earth Elementals"},
["energy elemental"] = {questStarted = 14017, questStorage = 14117, creatureStorage = 15040, killsRequired = 70, raceName = "Energy Elementals"},
["charged energy elemental"] = {questStarted = 14017, questStorage = 14117, creatureStorage = 15041, killsRequired = 70, raceName = "Energy Elementals"},
["massive energy elemental"] = {questStarted = 14017, questStorage = 14117, creatureStorage = 15042, killsRequired = 70, raceName = "Energy Elementals"},
["overcharged energy elemental"] = {questStarted = 14017, questStorage = 14117, creatureStorage = 15043, killsRequired = 70, raceName = "Energy Elementals"},
["fire elemental"] = {questStarted = 14018, questStorage = 14118, creatureStorage = 15044, killsRequired = 70, raceName = "Fire Elementals"},
["blazing fire elemental"] = {questStarted = 14018, questStorage = 14118, creatureStorage = 15045, killsRequired = 70, raceName = "Fire Elementals"},
["blistering fire elemental"] = {questStarted = 14018, questStorage = 14118, creatureStorage = 15046, killsRequired = 70, raceName = "Fire Elementals"},
["massive fire elemental"] = {questStarted = 14018, questStorage = 14118, creatureStorage = 15047, killsRequired = 70, raceName = "Fire Elementals"},
["mutated rat"] = {questStarted = 14019, questStorage = 14119, creatureStorage = 15048, killsRequired = 200, raceName = "Mutated Rats"},
["giant spider"] = {questStarted = 14020, questStorage = 14120, creatureStorage = 15049, killsRequired = 500, raceName = "Giant Spiders"},
["hydra"] = {questStarted = 14021, questStorage = 14121, creatureStorage = 15050, killsRequired = 500, raceName = "Hydras"},
["sea serpent"] = {questStarted = 14001, questStorage = 14101, creatureStorage = 15051, killsRequired = 500, raceName = "Sea Serpents"},
["behemoth"] = {questStarted = 14022, questStorage = 14122, creatureStorage = 15052, killsRequired = 500, raceName = "Behemoths"},
["serpent spawn"] = {questStarted = 14002, questStorage = 14102, creatureStorage = 15053, killsRequired = 375, raceName = "Serpents Spawn"},
["green djinn"] = {questStarted = 65022, questStorage = 65122, creatureStorage = 15054, killsRequired = 125, raceName = "Green Djinns"},
["efreet"] = {questStarted = 65022, questStorage = 65122, creatureStorage = 15055, killsRequired = 125, raceName = "Green Djinns"},
["blue djinn"] = {questStarted = 65023, questStorage = 65123, creatureStorage = 15056, killsRequired = 125, raceName = "Blue Djinns"},
["marid"] = {questStarted = 65023, questStorage = 65123, creatureStorage = 15057, killsRequired = 125, raceName = "Blue Djinns"},
["pirate buccaneer"] = {questStarted = 65024, questStorage = 65124, creatureStorage = 15058, killsRequired = 300, raceName = "Pirates"},
["pirate corsair"] = {questStarted = 65024, questStorage = 65124, creatureStorage = 15059, killsRequired = 300, raceName = "Pirates"},
["pirate cutthroat"] = {questStarted = 65024, questStorage = 65124, creatureStorage = 15060, killsRequired = 300, raceName = "Pirates"},
["pirate ghost"] = {questStarted = 65024, questStorage = 65124, creatureStorage = 15061, killsRequired = 300, raceName = "Pirates"},
["pirate marauder"] = {questStarted = 65024, questStorage = 65124, creatureStorage = 15062, killsRequired = 300, raceName = "Pirates"},
["pirate skeleton"] = {questStarted = 65024, questStorage = 65124, creatureStorage = 15063, killsRequired = 300, raceName = "Pirates"},
["minotaur"] = {questStarted = 14004, questStorage = 14104, creatureStorage = 15070, killsRequired = 500, raceName = "Minotaurs"},
["necromancer"] = {questStarted = 14003, questStorage = 14103, creatureStorage = 15071, killsRequired = 1000, raceName = "Magicians"},
["priestess"] = {questStarted = 14003, questStorage = 14103, creatureStorage = 15072, killsRequired = 1000, raceName = "Magicians"},
["dragon"] = {questStarted = 65030, questStorage = 65130, creatureStorage = 15065, killsRequired = 500, raceName = "Dragons"},
["dragon lord"] = {questStarted = 65030, questStorage = 65130, creatureStorage = 15066, killsRequired = 500, raceName = "Dragons"},
["frost dragon"] = {questStarted = 65030, questStorage = 65130, creatureStorage = 15067, killsRequired = 500, raceName = "Dragons"},
["ghastly dragon"] = {questStarted = 65030, questStorage = 65130, creatureStorage = 15068, killsRequired = 500, raceName = "Dragons"},
["undead dragon"] = {questStarted = 65030, questStorage = 65130, creatureStorage = 15069, killsRequired = 500, raceName = "Dragons"},
["demon"] = {questStarted = 14023, questStorage = 14123, creatureStorage = 15075, killsRequired = 6666, raceName = "Demons"}
}
local msgType = MESSAGE_STATUS_CONSOLE_ORANGE
function onKill(cid, target, lastHit)
local creature = questCreatures[getCreatureName(target):lower()]
if creature then
if isPlayer(target) then return true end
if getCreatureStorage(cid, creature.questStarted) > 0 then
if getCreatureStorage(cid, creature.questStorage) < creature.killsRequired then
if getCreatureStorage(cid, creature.questStorage) < 0 then
doCreatureSetStorage(cid, creature.questStorage, 0)
end
if (not isSummon(target)) then
if getCreatureStorage(cid, creature.creatureStorage) < 0 then
doCreatureSetStorage(cid, creature.creatureStorage, 0)
end
doCreatureSetStorage(cid, creature.questStorage, getCreatureStorage(cid, creature.questStorage) + 1)
doCreatureSetStorage(cid, creature.creatureStorage, getCreatureStorage(cid, creature.creatureStorage) + 1)
doPlayerSendTextMessage(cid, msgType, "[Mission]: " .. getCreatureStorage(cid,creature.questStorage) .. "/" .. creature.killsRequired .. " " .. creature.raceName .. " defeated.")
end
end
end
end
return true
end