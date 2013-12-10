local outfits = {5, 6, 7, 8, 9, 15, 18, 23, 24, 25, 29, 33, 37, 40, 48, 50, 53, 54, 57, 58, 59, 61, 62, 63, 64, 65, 66, 68, 69, 70, 71, 76, 78, 93, 96, 97, 98, 100, 126, 127, 193,
				 194, 195, 196, 203, 214, 215, 216, 229, 232, 235, 237, 246, 249, 253, 254, 255, 259, 260, 264, 281, 282, 287, 296, 297, 298, 300, 301}
local outfit =
	{
		lookType = 2,
		lookHead = 0,
		lookBody = 0,
		lookLegs = 0,
		lookFeet = 0,
		lookAddons = 0
	}
local outfit0 =
	{
		lookType = 2,
		lookHead = 0,
		lookBody = 0,
		lookLegs = 0,
		lookFeet = 0,
		lookAddons = 0
	}
function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid,1921) == -1 or getPlayerStorageValue(cid,1921) == #outfits then
setPlayerStorageValue(cid,1921,1)
doSetCreatureOutfit(cid, outfit0, -1)
else
for i=1,#outfits do
if getPlayerStorageValue(cid,1921) == i then
outfit.lookType = outfits[i]
doCreatureSay(cid, "Poof!", TALKTYPE_ORANGE_1)
doSetCreatureOutfit(cid, outfit, -1)
setPlayerStorageValue(cid,1921,i+1)
break
end
end
end
end
