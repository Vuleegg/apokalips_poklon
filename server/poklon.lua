ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('apokalipsa:znj')
AddEventHandler('apokalipsa:znj', function(poklon)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchScalar('SELECT poklon FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(poklon)
        if poklon == 1 then
            xPlayer.showNotification("Poklon je samo za nove stanovnike!")
        else
            xPlayer.addInventoryItem('poklon', 1)
        end
    end)
    if type(poklon) == 'boolean' then
        MySQL.Sync.execute('UPDATE users SET poklon = @poklon WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier,
            ['@poklon'] = poklon
        })
    end
end)

ESX.RegisterUsableItem('poklon', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('poklon', 1)
    xPlayer.addInventoryItem("weapon_pistol", 1)
    xPlayer.addInventoryItem("ammo-9", 25)
end)
