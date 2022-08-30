QBCore = nil
local banlength = nil
local banreason = 'Unknown'
local kickreason = 'Unknown'

CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj)
            QBCore = obj
        end)
        Wait(200)
    end
end)

local menu = MenuV:CreateMenu(false, 'Admin-menyn', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test')
local menu2 = MenuV:CreateMenu(false, 'Administratörsalternativ', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test1')
local menu3 = MenuV:CreateMenu(false, 'Självalternativ', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test2')
local menu4 = MenuV:CreateMenu(false, 'Spelare online', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test3')
local menu5 = MenuV:CreateMenu(false, 'Hantera server', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test4')
local menu6 = MenuV:CreateMenu(false, 'Tillgängliga väderalternativ', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test5')
local menu7 = MenuV:CreateMenu(false, 'Kontrollera aktuella/lägg till återförsäljare', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test6')
local menu8 = MenuV:CreateMenu(false, 'Ban', 'topright', 155, 0, 0, 'size-150', 'none', 'menuv', 'test7', 'native')
local menu9 = MenuV:CreateMenu(false, 'Kick', 'topright', 155, 0, 0, 'size-150', 'none', 'menuv', 'test8', 'native')
local menu10 = MenuV:CreateMenu(false, 'Behörigheter', 'topright', 155, 0, 0, 'size-150', 'none', 'menuv', 'test9', 'native')

RegisterNetEvent('qb-admin:client:openMenu')
AddEventHandler('qb-admin:client:openMenu', function()
    MenuV:OpenMenu(menu)
end)

local menu_button = menu:AddButton({
    icon = '😃',
    label = 'Administratörsalternativ',
    value = menu2,
    description = 'Övrigt. Administratörsalternativ'
})
local menu_button2 = menu:AddButton({
    icon = '😃',
    label = 'Spelarhantering',
    value = menu4,
    description = 'Visa lista över spelare'
})
local menu_button3 = menu:AddButton({
    icon = '😃',
    label = 'Serverhantering',
    value = menu5,
    description = 'Övrigt. Serveralternativ'
})

local menu_button4 = menu2:AddButton({
    icon = '😃',
    label = 'Självalternativ',
    value = menu3,
    description = 'Övrigt. Självalternativ'
})
local menu_button5 = menu3:AddCheckbox({
    icon = '🎥',
    label = 'NoClip',
    value = menu3,
    description = 'Aktivera/avaktivera NoClip'
})
local menu_button6 = menu3:AddButton({
    icon = '🏥',
    label = 'Återuppliva',
    value = menu3,
    description = 'Återuppliva dig själv'
})
local menu_button7 = menu3:AddCheckbox({
    icon = '👻',
    label = 'Osynlig',
    value = menu3,
    description = 'Aktivera/avaktivera Osynlig'
})
local menu_button8 = menu3:AddCheckbox({
    icon = '⚡',
    label = 'Gudläge',
    value = menu3,
    description = 'Aktivera/avaktivera Gud läge'
})
local menu_button9 = menu3:AddCheckbox({
    icon = '🔫',
    label = 'Ta bort laser',
    value = menu3,
    description = 'Aktivera/avaktivera laser'
})
local menu_button11 = menu5:AddButton({
    icon = '🌡️',
    label = 'Väderalternativ',
    value = menu6,
    description = 'Ändra väder'
})
--[[ local menu_button12 = menu5:AddButton({
    icon = '😃',
    label = 'Manage Dealers',
    value = menu7,
    description = 'Create/Delete Dealers'
}) ]]
local menu_buttom13 = menu5:AddSlider({
    icon = '⏲️',
    label = 'Server tid',
    value = GetClockHours(),
    values = {{
        label = '00',
        value = '00',
        description = 'Tid'
    }, {
        label = '01',
        value = '01',
        description = 'Tid'
    }, {
        label = '02',
        value = '02',
        description = 'Tid'
    }, {
        label = '03',
        value = '03',
        description = 'Tid'
    }, {
        label = '04',
        value = '04',
        description = 'Tid'
    }, {
        label = '05',
        value = '05',
        description = 'Tid'
    }, {
        label = '06',
        value = '06',
        description = 'Tid'
    }, {
        label = '07',
        value = '07',
        description = 'Tid'
    }, {
        label = '08',
        value = '08',
        description = 'Tid'
    }, {
        label = '09',
        value = '09',
        description = 'Tid'
    }, {
        label = '10',
        value = '10',
        description = 'Tid'
    }, {
        label = '11',
        value = '11',
        description = 'Tid'
    }, {
        label = '12',
        value = '12',
        description = 'Tid'
    }, {
        label = '13',
        value = '13',
        description = 'Tid'
    }, {
        label = '14',
        value = '14',
        description = 'Time'
    }, {
        label = '15',
        value = '15',
        description = 'Tid'
    }, {
        label = '16',
        value = '16',
        description = 'Tid'
    }, {
        label = '17',
        value = '17',
        description = 'Tid'
    }, {
        label = '18',
        value = '18',
        description = 'Tid'
    }, {
        label = '19',
        value = '19',
        description = 'Tid'
    }, {
        label = '20',
        value = '20',
        description = 'Tid'
    }, {
        label = '21',
        value = '21',
        description = 'Tid'
    }, {
        label = '22',
        value = '22',
        description = 'Tid'
    }, {
        label = '23',
        value = '23',
        description = 'Tid'
    }}
})

menu_button11:On("select",function()
local elements = {
        [1] = {
            icon = '☀️',
            label = 'Extra soligt',
            value = "EXTRASUNNY",
            description = 'Jag smälter!'
        },
        [2] = {
            icon = '☀️',
            label = 'Soligt',
            value = "CLEAR",
            description = 'Den perfekta dagen!'
        },
        [3] = {
            icon = '☀️',
            label = 'Neutral',
            value = "NEUTRAL",
            description = 'Bara en vanlig dag!'
        },
        [4] = {
            icon = '🌁',
            label = 'Dimma',
            value = "SMOG",
            description = 'Rökmaskin!'
        },
        [5] = {
            icon = '🌫️',
            label = 'Dimma',
            value = "FOGGY",
            description = 'Rökmaskin x2!'
        },
        [6] = {
            icon = '⛅',
            label = 'Molnig',
            value = "OVERCAST",
            description = 'Inte för soligt!'
        },
        [7] = {
            icon = '☁️',
            label = 'Molnig',
            value = "CLOUDS",
            description = 'Var är solen?'
        },
        [8] = {
            icon = '🌤️',
            label = 'Dimma försvinner',
            value = "CLEARING",
            description = 'Molnen börjar klarna!'
        },
        [9] = {
            icon = '☂️',
            label = 'Regn',
            value = "RAIN",
            description = 'Få det att regna!'
        },
       
        [10] = {
            icon = '⛈️',
            label = 'Åska',
            value = "THUNDER",
            description = 'Spring och göm!'
        },
        [11] = {
            icon = '❄️',
            label = 'Snö',
            value = "SNOW",
            description = 'Är det kallt här ute?'
        },
        [12] = {
            icon = '🌨️',
            label = 'Snöstorm',
            value = "BLIZZARD",
            description = 'Snömaskin?'
        },
        [13] = {
            icon = '❄️',
            label = 'Lätt snö',
            value = "SNOWLIGHT",
            description = 'Börjar kännas som jul!'
        },
        [14] = {
            icon = '🌨️',
            label = 'Tung snö (JUL)',
            value = "XMAS",
            description = 'Snöbollskrig!'
        },
        [15] = {
            icon = '🎃',
            label = 'Halloween',
            value = "HALLOWEEN",
            description = 'Vad var det för ljud?!'
        }
    }
    MenuV:OpenMenu(menu6)
    for k,v in ipairs(elements) do 
        local menu_button14 = menu6:AddButton({icon = v.icon,label = v.label,value = v,description = v.description,select = function(btn) 
        local selection = btn.Value
        print(selection.value)
        TriggerServerEvent('qb-weathersync:server:setWeather', selection.value)
            QBCore.Functions.Notify('Vädret ändrades till: '..selection.label)
        end})
    end
end)

local menu_button29 = menu7:AddButton({
    icon = '🔌',
    label = 'Befintliga återförsäljare',
    value = menu7,
    description = 'Skapade återförsäljare'
})
local menu_button30 = menu7:AddButton({
    icon = '➕',
    label = 'Skapa återförsäljare',
    value = menu7,
    description = 'Skapa en ny återförsäljare'
})

-- Player List
menu_button2:On('select', function(item)
    menu4:ClearItems()
    QBCore.Functions.TriggerCallback('test:getplayers', function(players)
        for k, v in pairs(players) do
            local menu_button10 = menu4:AddButton({
                label = 'ID:' .. v["id"] .. ' | ' .. v["name"],
                value = v,
                description = 'Player Name',
                select = function(btn)
                    local select = btn.Value -- get all the values from v!
                    
                    OpenPlayerMenus(select) -- only pass what i select nothing else

                end
            }) -- WORKS
        end
    end)
end)

menu_buttom13:On("select", function(item, value)
    TriggerServerEvent("qb-weathersync:server:setTime", value, value)
    QBCore.Functions.Notify("Time changed to " .. value .. " hs 00 min")

end)

function OpenPlayerMenus(player)

    local Players = MenuV:CreateMenu(false, player.cid .. ' Options', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv') -- Players Sub Menu
    Players:ClearItems()
    MenuV:OpenMenu(Players)
    elements = {
        [1] = {
            icon = '💀',
            label = "Döda",
            value = "kill",
            description = "Döda " .. player.cid
        },
        [2] = {
            icon = '🏥',
            label = "Återuppliva",
            value = "revive",
            description = "Återuppliva " .. player.cid
        },
        [3] = {
            icon = '🥶',
            label = "Freeze",
            value = "freeze",
            description = "Freeze " .. player.cid
        },
        [4] = {
            icon = '👀',
            label = "Spectate",
            value = "spectate",
            description = "Spectate " .. player.cid
        },
        [5] = {
            icon = '➡️',
            label = "Gå till",
            value = "goto",
            description = "Gå till " .. player.cid .. " Position"
        },
        [6] = {
            icon = '⬅️',
            label = "Ta hit personen",
            value = "bring",
            description = "Ta hit personen " .. player.cid .. " to your position"
        },
        [7] = {
            icon = '🎒',
            label = "Öppna inventory",
            value = "inventory",
            description = "Open " .. player.cid .. " inventorys"
        },
        [8] = {
            icon = '👕',
            label = "Ge Klädmeny",
            value = "cloth",
            description = "Ge Klädmeny till" .. player.cid
        },
        [9] = {
            icon = '🥾',
            label = "Kick",
            value = "kick",
            description = "Kick " .. player.cid .. "Du måste ge en anledning"
        },
        [10] = {
            icon = '🚫',
            label = "Ban",
            value = "ban",
            description = "Ban " .. player.cid .. "Du måste ge en anledning"
        },
        [11] = {
            icon = '🎟️',
            label = "Behörigheter",
            value = "perms",
            description = "Ge " .. player.cid .. "Behörigheter"
        }
    }
    for k, v in ipairs(elements) do
        local menu_button10 = Players:AddButton({
            icon = v.icon,
            label = ' ' .. v.label,
            value = v.value,
            description = v.description,
            select = function(btn)
                local values = btn.Value
                if values ~= "ban" and values ~= "kick" and values ~= "perms" then
                    TriggerServerEvent('qb-admin:server:'..values, player)
                elseif values == "ban" then
                    OpenBanMenu(player)
                elseif values == "kick" then
                    OpenKickMenu(player)
                elseif values == "perms" then
                    OpenPermsMenu(player)
                end
            end
        })
    end
end

function OpenBanMenu(banspeler)
    MenuV:OpenMenu(menu8)
    menu8:ClearItems()
    local menu_button15 = menu8:AddButton({
        icon = '',
        label = 'Anledning',
        value = "reason",
        description = 'Ban Anledning',
        select = function(btn)
            banreason = LocalInput('Ban Anledning', 255, 'Anledning')
        end
    })

    local menu_button16 = menu8:AddSlider({
        icon = '⏲️',
        label = 'Längd',
        value = '3600',
        values = {{
            label = '1 timme',
            value = '3600',
            description = 'Banlängd'
        }, {
            label = '6 timmar',
            value ='21600',
            description = 'Banlängd'
        }, {
            label = '12 timmar',
            value = '43200',
            description = 'Banlängd'
        }, {
            label = '1 Dag',
            value = '86400',
            description = 'Banlängd'
        }, {
            label = '3 Dagar',
            value = '259200',
            description = 'Banlängd'
        }, {
            label = '1 vecka',
            value = '604800',
            description = 'Banlängd'
        }, {
            label = '1 månad',
            value = '2678400',
            description = 'Banlängd'
        }, {
            label = '3 månader',
            value = '8035200',
            description = 'Banlängd'
        }, {
            label = '6 månader',
            value = '16070400',
            description = 'Banlängd'
        }, {
            label = '1 år',
            value = '32140800',
            description = 'Banlängd'
        }, {
            label = 'Permanent',
            value = '99999999999',
            description = 'Banlängd'
        }, {
            label = 'Själv',
            value = "self",
            description = 'Hur länge'
        }},
        select = function(btn, newValue, oldValue)
            if newValue == "self" then
                banlength = LocalInputInt('Ban Length', 11, 'Seconds')
            else
                banlength = newValue
            end
        end
    })

    local menu_button17 = menu8:AddButton({
        icon = '',
        label = 'Bekräfta',
        value = "ban",
        description = 'Bekräfta förbudet',
        select = function(btn)
            if banreason ~= 'Unknown' and banlength ~= nil then
                TriggerServerEvent('qb-admin:server:ban', banspeler, banlength, banreason)
                banreason = 'Unknown'
                banlength = nil
            else
                QBCore.Functions.Notify('Du måste ange ett skäl och ange en längd för förbudet!', 'error')
            end
        end
    })
end

function OpenKickMenu(kickplayer)
    MenuV:OpenMenu(menu9)
    menu9:ClearItems()
    local menu_button19 = menu9:AddButton({
        icon = '',
        label = 'Anledning',
        value = "reason",
        description = 'Kick Anledning',
        select = function(btn)
            kickreason = LocalInput('Kick Anledning', 255, 'Anledning')
        end
    })

    local menu_button18 = menu9:AddButton({
        icon = '',
        label = 'Bekräfta',
        value = "kick",
        description = 'Bekräfta sparken',
        select = function(btn)
            if kickreason ~= 'Unknown' then
                TriggerServerEvent('qb-admin:server:kick', kickplayer, kickreason)
                kickreason = 'Unknown'
            else
                QBCore.Functions.Notify('Du måste ge en anledning!', 'error')
            end
        end
    })
end

function OpenPermsMenu(permsply)
    QBCore.Functions.TriggerCallback('qb-admin:server:getrank', function(rankk)
        if rankk then
            local selectedgroup = 'Unknown'
            MenuV:OpenMenu(menu10)
            menu10:ClearItems()
            local menu_button20 = menu10:AddSlider({
                icon = '',
                label = 'Grupp',
                value = 'user',
                values = {{
                    label = 'User',
                    value = 'user',
                    description = 'Grupp'
                }, {
                    label = 'Admin',
                    value = 'admin',
                    description = 'Grupp'
                }, {
                    label = 'God',
                    value = 'god',
                    description = 'Grupp'
                }},
                select = function(btn)
                    local vcal = btn.Value
                    if vcal == 1 then
                        selectedgroup = {}
                        table.insert(selectedgroup, {rank = "user", label = "User"})
                    elseif vcal == 2 then
                        selectedgroup = {}
                        table.insert(selectedgroup, {rank = "admin", label = "Admin"})
                    elseif vcal == 3 then
                        selectedgroup = {}
                        table.insert(selectedgroup, {rank = "god", label = "God"})
                    end
                end
            })

            local menu_button21 = menu10:AddButton({
                icon = '',
                label = 'Bekräfta',
                value = "giveperms",
                description = 'Ge behörighetsgruppen',
                select = function(btn)
                    if selectedgroup ~= 'Unknown' then
                        TriggerServerEvent('qb-admin:server:setPermissions', permsply.id, selectedgroup)
                        selectedgroup = 'Unknown'
                    else
                        QBCore.Functions.Notify('Välj en grupp!', 'error')
                    end
                end
            })
        else
            MenuV:CloseMenu(menu)
        end
    end)
end

-- Toggle NoClip

menu_button5:On('change', function(item, newValue, oldValue)
    ToggleNoClipMode()
end)

-- Revive Self

menu_button6:On('select', function(item)
    TriggerEvent('hospital:client:Revive', PlayerPedId())
end)

-- Invisible

local invisible = false
menu_button7:On('change', function(item, newValue, oldValue)
    if not invisible then
        invisible = true
        SetEntityVisible(PlayerPedId(), false, 0)
    else
        invisible = false
        SetEntityVisible(PlayerPedId(), true, 0)
    end
end)

-- Godmode

local godmode = false
menu_button8:On('change', function(item, newValue, oldValue)
    if not invisible then
        godmode = true
        SetPlayerInvincible(PlayerPedId(), true)
    else
        godmode = false
        SetPlayerInvincible(PlayerPedId(), false)
    end
end)

-- Delete Laser

local deleteLazer = false
menu_button9:On('change', function(item, newValue, oldValue)
    if not deleteLazer then
        deleteLazer = true
    else
        deleteLazer = false
    end
end)

function RotationToDirection(rotation)
	local adjustedRotation = 
	{ 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = 
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination = 
	{ 
		x = cameraCoord.x + direction.x * distance, 
		y = cameraCoord.y + direction.y * distance, 
		z = cameraCoord.z + direction.z * distance 
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end

function DrawEntityBoundingBox(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim = 
	{ 
		x = 0.5*(max.x - min.x), 
		y = 0.5*(max.y - min.y), 
		z = 0.5*(max.z - min.z)
	}

    local FUR = 
    {
		x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x, 
		y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y, 
		z = 0
    }

    local FUR_bool, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL = 
    {
        x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
        y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
        z = 0
    }
    local BLL_bool, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 = 
    {
        x = edge1.x + 2 * dim.y*rightVector.x,
        y = edge1.y + 2 * dim.y*rightVector.y,
        z = edge1.z + 2 * dim.y*rightVector.z
    }

    local edge3 = 
    {
        x = edge2.x + 2 * dim.z*upVector.x,
        y = edge2.y + 2 * dim.z*upVector.y,
        z = edge2.z + 2 * dim.z*upVector.z
    }

    local edge4 = 
    {
        x = edge1.x + 2 * dim.z*upVector.x,
        y = edge1.y + 2 * dim.z*upVector.y,
        z = edge1.z + 2 * dim.z*upVector.z
    }

    local edge6 = 
    {
        x = edge5.x - 2 * dim.y*rightVector.x,
        y = edge5.y - 2 * dim.y*rightVector.y,
        z = edge5.z - 2 * dim.y*rightVector.z
    }

    local edge7 = 
    {
        x = edge6.x - 2 * dim.z*upVector.x,
        y = edge6.y - 2 * dim.z*upVector.y,
        z = edge6.z - 2 * dim.z*upVector.z
    }

    local edge8 = 
    {
        x = edge5.x - 2 * dim.z*upVector.x,
        y = edge5.y - 2 * dim.z*upVector.y,
        z = edge5.z - 2 * dim.z*upVector.z
    }

    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end

Citizen.CreateThread(function()	
	while true do
		Citizen.Wait(0)
        if deleteLazer then
            local color = {r = 255, g = 255, b = 255, a = 200}
            local position = GetEntityCoords(PlayerPedId())
            local hit, coords, entity = RayCastGamePlayCamera(1000.0)
            -- If entity is found then verifie entity
            if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
                local entityCoord = GetEntityCoords(entity)
                local minimum, maximum = GetModelDimensions(GetEntityModel(entity))
                DrawEntityBoundingBox(entity, color)
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                QBCore.Functions.DrawText3D(entityCoord.x, entityCoord.y, entityCoord.z, "Obj: " .. entity .. " Model: " .. GetEntityModel(entity).. " \nPress [~g~E~s~] to delete the object!", 2)
                -- When E pressed then remove targeted entity
                if IsControlJustReleased(0, 38) then
                    -- Set as missionEntity so the object can be remove (Even map objects)
                    SetEntityAsMissionEntity(entity, true, true)
                    --SetEntityAsNoLongerNeeded(entity)
                    --RequestNetworkControl(entity)
                    DeleteEntity(entity)
                end
            -- Only draw of not center of map
            elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
                -- Draws line to targeted position
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
            end
        else
            Citizen.Wait(1000)
        end
	end
end)
