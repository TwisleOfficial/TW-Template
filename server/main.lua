if Config.Framework == 'esx' then ESX = exports["es_extended"]:getSharedObject() end
if Config.Framework == 'qb' or Config.Framework == 'qbx' then QBCore = exports['qb-core']:GetCoreObject() end

lib.callback.register('nameOFscript:server:nameOFwhathappens', function(source)
  return true
end)

RegisterNetEvent('nameOFscript:server:nameOFwhathappens', function ()
  -- Templete netevent
end)

AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then return end
end)

AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then return end
end) 