Config = {}

Config.Debug = true

Config.Notification = 'ox' -- ox , qb
Config.Progress = 'ox'     -- ox , qb


-- Will Set The Inv For You
AddEventHandler("onResourceStart", function()
    Wait(100)
    if GetResourceState('ox_inventory') == 'started' then
        Config.Inventory = 'ox'
    elseif GetResourceState('qb-inventory') == 'started' then
        Config.Inventory = 'qb'
    end
end)