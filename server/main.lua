QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('my_script:loadCounter', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local identifier = Player.PlayerData.license

    MySQL.single('SELECT count FROM player_counters WHERE identifier = ?', {identifier}, function(result)
        local count = result and result.count or 0
        TriggerClientEvent('my_script:setCounter', src, count)
    end)
end)

RegisterNetEvent('my_script:saveCounter', function(count)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local identifier = Player.PlayerData.license

    MySQL.insert('INSERT INTO player_counters (identifier, count) VALUES (?, ?) ON DUPLICATE KEY UPDATE count = ?', {identifier, count, count})
end)
