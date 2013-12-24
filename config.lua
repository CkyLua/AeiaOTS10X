-- Combat settings
worldType = "no-pvp"
hotkeyAimbotEnabled = "yes"
protectionLevel = 1
killsToRedSkull = 5
killsToBlackSkull = 10
pzLocked = 60000
removeAmmoWhenUsingDistanceWeapon = "no"
removeChargesFromRunes = "yes"
timeToDecreaseFrags = 24 * 60 * 60 * 1000
whiteSkullTime = 15 * 60 * 1000
stairJumpExhaustion = 800
experienceByKillingPlayers = "yes"

-- Connection Config
ip = "login.aeiaots.pw"
bindOnlyGlobalAddress = "no"
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = "1500"
motd = "Welcome to AeiaOTS! If you find a typo, bug, glitch or just want to make a suggestion, find the God."
onePlayerOnlinePerAccount = "yes"
allowClones = "no"
serverName = "Aeia OTS"
statusTimeout = 60000
replaceKickOnLogin = "yes"
maxPacketsPerSecond = 25

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
housePriceEachSQM = 1000
houseRentPeriod = "never"

-- Item Usage
timeBetweenActions = 200
timeBetweenExActions = 1000

-- Map
mapName = "aeia"
mapAuthor = "Crypton, edited by dominique120"

-- Market
marketOfferDuration = 30 * 24 * 60 * 60
premiumToCreateMarketOffer = "yes"
checkExpiredMarketOffersEachMinutes = 60
maxMarketOffersAtATimePerPlayer = 100

-- MySQL
mysqlHost = "127.0.0.1"
mysqlUser = "otserv"
mysqlPass = "zThA96eAH9u2V8Ty"
mysqlDatabase = "otserv"
mysqlPort = 3306

-- Misc.
allowChangeOutfit = "yes"
freePremium = "yes"
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 4
noDamageToSameLookfeet = "no"

-- Rates
-- NOTE: rateExp is not used if you have enabled stages in data/XML/stages.xml
experienceStages = true
rateExp = 5
rateSkill = 20
rateLoot = 2
rateMagic = 16
rateSpawn = 1

-- Monsters
deSpawnRange = 2
deSpawnRadius = 50

-- Stamina
staminaSystem = "yes"

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process priority.
defaultPriority = "high"
startupDatabaseOptimization = "no"

-- Status server information
ownerName = "Dominique Verellen"
ownerEmail = "dominque120@live.com"
url = "*edit*"
location = "*edit*"
