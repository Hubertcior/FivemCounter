local count = 0 -- początkowa wartość
local nuiActive = false

-- Funkcja otwierająca/zamykająca NUI
RegisterCommand('toggleNUI', function()
    nuiActive = not nuiActive
    SetNuiFocus(nuiActive, nuiActive)
    SendNUIMessage({
        action = nuiActive and "open" or "close",
        count = count
    })
end, false)

RegisterKeyMapping('toggleNUI', 'Otwórz menu NUI', 'keyboard', 'F5')

-- Obsługa komunikatów z NUI
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

-- Wczytaj licznik przy dołączeniu
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('my_script:loadCounter')
end)