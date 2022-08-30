QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Commands.Add("me", "Character interactions", {}, false, function(source, args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local text = table.concat(args, " ")
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('3dme:triggerDisplay', -1, Player.PlayerData.charinfo.firstname.. " " .. Player.PlayerData.charinfo.lastname.. " " .. text, source)
    TriggerEvent("cash-log:server:CreateLog", "me", "Me", "white", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..")** " ..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.. " **" ..text, false)
end)

--TriggerClientEvent('3dme:triggerDisplay', -1,  Player.PlayerData.charinfo.firstname.." " ..Player.PlayerData.charinfo.lastname.."  " .. text, source)--]]