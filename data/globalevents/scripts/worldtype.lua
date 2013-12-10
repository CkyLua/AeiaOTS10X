local t = {
    ["Monday"] = {WORLDTYPE_OPEN, "Its Monday, that means its time to get out there and KILL!"},
    ["Tuesday"] = {WORLDTYPE_OPTIONAL, "Hope you enjoyed PVP Mondays!"},
	["Friday"] = {WORLDTYPE_OPTIONAL, "Time for PVP-E!!!"},
	["Saturday"] = {WORLDTYPE_OPTIONAL, "Hope you enjoyed PVPE Fridays!"}
}

function onTime()
local v = t[os.date("%A")]
    if v then
        setWorldType(v[1])
        doBroadcastMessage(v[2], MESSAGE_EVENT_ADVANCE)
    end
    return true
end