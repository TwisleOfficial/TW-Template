Config = {}

Config.Debug = true

Config.Progress = 'ox-circle'      -- ox-normal , ox-circle ( ONLY FOR QBX )

-- Nice debug function so you dont need to check if Config.Debug is true on every print
function dbug(...)
    if Config.Debug then print('^3[DEBUG]^7', ...) end
end

local function detectFramework()
    local esx = GetResourceState('es_extended') == 'started'
    local qbx = GetResourceState('qbx_core') == 'started'
    local qb = GetResourceState('qb-core') == 'started'

    if esx then
        Config.Framework = 'esx'
    elseif qbx then
        Config.Framework = 'qbx'
    elseif qb then
        Config.Framework = 'qb'
    else
        Config.Framework = 'unknown'
    end

    dbug('Detected Framework: ' .. Config.Framework)
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    Wait(1000)
    detectFramework()
end)
