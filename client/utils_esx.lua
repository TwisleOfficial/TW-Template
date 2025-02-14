if Config.Framework ~= 'esx' then return end
ESX = exports["es_extended"]:getSharedObject()

---@param duration number # length of progress
---@param label string # progress text
---@param anim table # {dict, clip, lib}
function doProgressBar(duration, label, anim)
    exports["esx_progressbar"]:Progressbar(label, duration, {
        FreezePlayer = true,
        animation = {
            type = anim[1],
            dict = anim[2],
            lib = anim[3],
        },
        onFinish = function()
            return true
        end,
        onCancel = function()
            return false
        end,
    })
end

---@param duration number # Length of noti
---@param title string # noti title can be empty string for qb
---@param desc string # noti desc
---@param type string # success or error
function doNotify(duration, title, desc, type)
    ESX.ShowNotification(title.. ': ' ..desc, type, duration)
end