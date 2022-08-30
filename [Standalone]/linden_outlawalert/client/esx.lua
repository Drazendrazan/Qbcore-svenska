QBCore = nil
notLoaded, currentStreetName, intersectStreetName, lastStreet, speedlimit, nearbyPeds, isPlayerWhitelisted, playerPed, playerCoords, job, rank, firstname, lastname, phone = true

CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Wait(200)
    end
    while QBCore.Functions.GetPlayerData().job == nil do
        Wait(100)
    end
    QBCore.PlayerData = QBCore.Functions.GetPlayerData()
    GetPlayerInfo()
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    GetPlayerInfo()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    job = QBCore.PlayerData.job.name
    rank = QBCore.PlayerData.job.grade
    isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

function GetPlayerInfo()
    firstname = QBCore.PlayerData.charinfo.firstname
    lastname = QBCore.PlayerData.charinfo.lastname
    phone = QBCore.PlayerData.charinfo.phone
	job = QBCore.PlayerData.job.name
    rank = QBCore.PlayerData.job.grade
    isPlayerWhitelisted = refreshPlayerWhitelisted()
end