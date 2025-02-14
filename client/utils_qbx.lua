if Config.Framework ~= 'qbx' then return end

---@param duration number # length of progress
---@param label string # progress text
---@param anim table # {dict, clip}
function doProgressBar(duration, label, anim)
    if Config.Progress == 'ox-normal' then
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
    elseif Config.Progress == 'ox-circle' then
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
    else
        dbug('No Progressbar set!')
        return false
    end
end

---@param duration number # Length of noti
---@param title string # noti title can be empty string for qb
---@param desc string # noti desc
---@param type string # success or error
function doNotify(duration, title, desc, type)
    lib.notify({
        title = title,
        description = desc,
        type = type,
        duration = duration,
    })
end