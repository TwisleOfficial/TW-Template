if Config.Framework ~= 'qbx' then return end

---@param src number # player source
---@param duration number # Length of noti
---@param title string # noti title can be empty string for qb
---@param desc string # noti desc
---@param type string # success or error
function doNotify(src, duration, title, desc, type)
  TriggerClientEvent('ox_lib:notify', src, {
    title = title,
    description = desc,
    type = type,
    duration = duration,
    showDuration = true,
  })
end

---@param src number # player source
---@param amount number # amount to take from player
---@param reason string # reason for change
function takeMoney(src, amount, reason)
  local plr = exports.qbx_core:GetPlayer(src)
  if not plr then return end
  if plr.Functions.GetMoney(src, 'cash') >= amount then
    plr.Functions.RemoveMoney(src, 'cash', amount, reason)
    return true
  elseif plr.Functions.GetMoney(src, 'bank') >= amount then
    plr.Functions.RemoveMoney(src, 'bank', amount, reason)
    return true
  else
    return false
  end
end

---@param src number # player source
---@param amount number # amount to take from player
---@param account string # bank or cash
---@param reason string # reason for change
function addMoney(src, amount, account, reason)
  local plr = exports.qbx_core:GetPlayer(src)
  if not plr then return end
  plr.Functions.AddMoney(src, account, amount, reason)
end

---@param src number # player source
---@param item string # item name
---@param amount number # amount to take from player
function removeItem(src, item, amount)
  if not src then return false end
  exports.ox_inventory:RemoveItem(src, item, amount)
end

---@param src number # player source
---@param item string # item name
---@param amount number # amount to take from player
function addItem(src, item, amount)
  if exports.ox_inventory:CanCarryItem(src, item, amount) then
    exports.ox_inventory:AddItem(src, item, amount)
  else
    doNotify(src, 5000, 'Inventory: ', 'You cant carry that!', 'error')
  end
end