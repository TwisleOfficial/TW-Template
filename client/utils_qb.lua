if Config.Framework ~= 'qb' then return end
QBCore = exports['qb-core']:GetCoreObject()

---@param duration number # length of progress
---@param label string # progress text
---@param anim table # {dict, clip}
function doProgressBar(duration, label, anim)
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
end

---@param duration number # Length of noti
---@param title string # noti title can be empty string for qb
---@param desc string # noti desc
---@param type string # success or error
function doNotify(duration, title, desc, type)
    QBCore.Functions.Notify(title .. ": " .. desc, type, duration)
end