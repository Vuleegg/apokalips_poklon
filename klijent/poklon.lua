ESX = exports['es_extended']:getSharedObject()

CreateThread(function()
    RequestModel(GetHashKey(`prop_rub_boxpile_02`))
    while not HasModelLoaded(`prop_rub_boxpile_02`) do Wait(100) end
    PostaviSefrs = CreateObject(`prop_rub_boxpile_02`, vector3(-240.611, -981.649, 28.287), false, true)
    SetEntityHeading(PostaviSefrs, 60.0)
    FreezeEntityPosition(PostaviSefrs, true)
    SetEntityInvincible(PostaviSefrs, true)
    PlaceObjectOnGroundProperly(PostaviSefrs)
    SetModelAsNoLongerNeeded(`prop_rub_boxpile_02`)
end)

exports.qtarget:AddBoxZone("poklon", vector3(-240.611, -981.649, 29.287), 0.95, 0.95, {
    name = "poklon",
    heading = 11.0,
    debugPoly = false,
    minZ = 28.287,
    maxZ = 30.287,
}, {
    options = {
        {
            event = "poklon",
            icon = "fas fa-sign-in-alt",
            label = "Uzmite poklon",
        },
    },
    distance = 3.5
})

RegisterNetEvent("poklon", function()
    TriggerServerEvent("apokalipsa:znj", true)
end)

CreateThread(function()
    while true do
        Wait(0)
        local igrac = PlayerPedId()
        local kordinate = GetEntityCoords(igrac)
        local distanca = #(kordinate - vector3(-240.611, -981.649, 29.287))
        local spavaj = true
        if distanca < 30 then
            spavaj = false
            Draw3DText(-240.611, -981.649, 29.287 - 1.15, "[Uzmite poklon]", 7, 0.1, 0.1)
        end
        if spavaj then Wait(1337) end
    end
end)

function Draw3DText(x, y, z, textInput, fontId, scaleX, scaleY)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(94, 102, 198, 0.8) --  ovde mozete promeniti boju texta
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z + 2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end