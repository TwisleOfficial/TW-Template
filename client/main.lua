if Config.Framework == 'qb' then QBCore = exports['qb-core']:GetCoreObject() end

---@param duration number # length of progress
---@param label string # progress text
---@param anim? table # {dict, clip}
local function DoProgress(duration, label, anim)
    if not anim then anim = {} end

    if Config.Progress == 'qb' then
        QBCore.Functions.Progressbar(label, label, duration, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            },
            {
                animDict = anim[1],
                anim = anim[2],
            }, {}, {}, function()
                return true
            end, function()
                return false
            end)
    elseif Config.Progress == 'ox-normal' then
        if lib.progressBar({
                duration = duration,
                label = label,
                useWhileDead = false,
                canCancel = true,
                disable = {
                    move = true,
                },
                anim = {
                    dict = anim[1],
                    cip = anim[2],
                }
            })
        then
            return true
        else
            return false
        end
    else
        if lib.progressCircle({
                duration = duration,
                label = label,
                position = Config.OxCirclePosition,
                useWhileDead = false,
                canCancel = true,
                disable = {
                    move = true,
                },
                anim = {
                    dict = anim[1],
                    clip = anim[2],
                }
            })
        then
            return true
        else
            return false
        end
    end
end

---@param duration number # Length of noti
---@param title string # noti title can be empty string for qb
---@param desc string # noti desc
---@param type string # success or error
local function DoNotify(duration, title, desc, type)
    if Config.Notification == 'qb' then
        QBCore.Functions.Notify(title .. ": " .. desc, type, duration)
    else
        lib.notify({
            title = title,
            description = desc,
            type = type,
            duration = duration,
        })
    end
end

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
    if (GetCurrentResourceName() ~= resourceName) then return end

end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
end)