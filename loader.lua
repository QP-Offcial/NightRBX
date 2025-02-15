local rootid = game.PlaceId
local https = game:GetService("HttpService")
local mainrepgames = "https://github.com/QP-Offcial/NightRBX/blob/main/games/"
local rawmainrep = "https://raw.githubusercontent.com/QP-Offcial/NightRBX/main/games/"

local suc, err = pcall(function()
    local req
    req = http.request({
        Url = "https://games.roblox.com/v1/games?universeIds="..tostring(game.GameId),
        Method = "GET"
    }).Body
    rootid = https:JSONDecode(req).data[1].rootPlaceId
end)

local gamexists = pcall(function()
    local game = game:HttpGet(mainrepgames..rootid..".lua")
end)

if gamexists  then
    loadstring(game:HttpGet(rawmainrep..rootid..".lua"))()
elseif suc and not gamexists then
    print("game not supported")
else
    print("failed to get game(solara issue im guessing) or not supported")
end