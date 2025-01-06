local count = 0 
local nuiActive = false

RegisterCommand('toggleNUI', function()
    nuiActive = not nuiActive
    SetNuiFocus(nuiActive, nuiActive)
    SendNUIMessage({
        action = nuiActive and "open" or "close",
        count = count
    })
end, false)

RegisterKeyMapping('toggleNUI', 'Otwórz menu NUI', 'keyboard', 'F5')

RegisterNUICallback('add', function(_, cb)
    count = count + 1
    SendNUIMessage({ action = "update", count = count })
    TriggerServerEvent('my_script:saveCounter', count)
    cb('ok')
end)

RegisterNUICallback('close', function(_, cb)
    nuiActive = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "close" })
    cb('ok')
end)

RegisterNetEvent('my_script:setCounter', function(serverCount)
    count = serverCount
    print('Licznik załadowany: ' .. count)
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('my_script:loadCounter')
end)