Config = {}

Config.Debug = true

Config.Framework = 'qb'            -- qb , qbx, esx
Config.Notification = 'ox'         -- ox , qb
Config.Inventory = 'ox'            -- ox , qb
Config.Progress = 'ox-circle'      -- ox-normal , ox-circle , qb
Config.OxCirclePosition = 'bottom' -- only matters if Config.Progress = 'ox-circle'


-- Nice debug function so you dont need to check if Config.Debug is true on every print
function dbug(...)
    if Config.Debug then print('^3[DEBUG]^7', ...) end
end