local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function() -- Start Thread (Non Loop)

end)

Citizen.CreateThread(function() -- Start Thread (Loop)
    while true do
        Wait(10)
    end
end)

RegisterNetEvent('nameOFscript:client:nameOFwhathappens', function ()
  -- Templete netevent
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end

end)