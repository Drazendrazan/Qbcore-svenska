QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback("qb-gangs:server:FetchConfig", function(source, cb)
    cb(json.decode(LoadResourceFile(GetCurrentResourceName(), "config.json")))
end)

QBCore.Commands.Add("creategang", "Skapa ett whitelistat gängjobb med en stash och bilspawn", {{name = "gang", help = "Name of the gang"}, {name = "label", help = "Gang Label"}}, true, function(source, args)
    name = args[1]
    table.remove(args, 1)
    label = table.concat(args, " ")
    
    TriggerClientEvent("qb-gangs:client:BeginGangCreation", source, name, label)
end, "admin")

RegisterServerEvent("qb-gangs:server:creategang", function(newGang, gangName, gangLabel)
    local permission = QBCore.Functions.GetPermission(source)

    if permission == "admin" or permission == "god" then
        local gangConfig = json.decode(LoadResourceFile(GetCurrentResourceName(), "config.json"))
        gangConfig[gangName] = newGang

        local gangs = json.decode(LoadResourceFile(GetCurrentResourceName(), "gangs.json"))
        gangs[gangName] = {
            label = gangLabel
        }

        SaveResourceFile(GetCurrentResourceName(), "config.json", json.encode(gangConfig), -1)
        TriggerClientEvent("qb-gangs:client:UpdateGangs", -1, gangConfig)

        SaveResourceFile(GetCurrentResourceName(), "gangs.json", json.encode(gangs), -1)
        TriggerClientEvent("QBCore:Client:UpdateGangs", -1, gangs)
        TriggerEvent("QBCore:Server:UpdateGangs", gangs)

        TriggerClientEvent("QBCore:Notify", source, "Gang: "..gangName.." framgångsrikt skapat", "success")
    else
        QBCore.Functions.Kick(source, "Försök att placera skapa ett gäng")
    end
end)

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end


QBCore.Commands.Add("invitegang", "Bjud in en spelare till ditt gäng", {{name = "ID", help = "Player ID"}}, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local gang = Player.PlayerData.gang.name

    if gang == "none" then 
        TriggerClientEvent("QBCore:Notify", source, "Du är inte i ett gäng", "error")
        return 
    end
    if Config["GangLeaders"][gang] ~= nil and has_value(Config["GangLeaders"][gang], Player.PlayerData.citizenid) then
        local id = tonumber(args[1])
        if id == source then return end

        local OtherPlayer = QBCore.Functions.GetPlayer(id)
        if OtherPlayer ~= nil then
            OtherPlayer.Functions.SetGang(gang)
            TriggerClientEvent("QBCore:Notify", source, string.format("%s har blivit inbjuden till ditt gäng", GetPlayerName(id)))
            TriggerClientEvent("QBCore:Notify", id, string.format("%s har bjudit in till dig %s", GetPlayerName(source), QBCore.Shared.Gangs[gang].label))
        else
            TriggerClientEvent("QBCore:Notify", source, "Den här spelaren är inte online", "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Du är inte ledaren för det här gänget", "error")
    end
end)

QBCore.Commands.Add("removegang", "Ta bort en spelare från ditt gäng", {{name = "ID", help = "Player ID"}}, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local gang = Player.PlayerData.gang.name

    if gang == "none" then 
        TriggerClientEvent("QBCore:Notify", source, "Du är inte i ett gäng", "error")
        return 
    end
    if Config["GangLeaders"][gang] ~= nil and has_value(Config["GangLeaders"][gang], Player.PlayerData.citizenid) then
        local id = tonumber(args[1])
        if id == source then return end

        local OtherPlayer = QBCore.Functions.GetPlayer(id)
        if OtherPlayer ~= nil then
            OtherPlayer.Functions.SetGang("none")
            TriggerClientEvent("QBCore:Notify", source, string.format("%s har tagits bort från ditt gäng", GetPlayerName(id)))
            TriggerClientEvent("QBCore:Notify", id, string.format("%s har tagit bort dig från %s", GetPlayerName(source), QBCore.Shared.Gangs[gang].label))
        else
            TriggerClientEvent("QBCore:Notify", source, "Den här spelaren är inte online", "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Du är inte ledaren för det här gänget", "error")
    end
end)
