if Config.Framework ~= 'qb' then return end
QBCore = exports['qb-core']:GetCoreObject()

---@param src number # player source
---@param duration number # Length of noti
---@param title string # noti title can be empty string for qb
---@param desc string # noti desc
---@param type string # success or error
function doNotify(src, duration, title, desc, type)
  TriggerClientEvent('QBCore:Notify', src, title .. ': ' .. desc, type, duration)
end

---@param src number # player source
---@param amount number # amount to take from player
function takeMoney(src, amount)
  local plr = QBCore.Functions.GetPlayer(src)
  if not plr then return false end
  if plr.Functions.GetMoney('cash') >= amount then
    plr.Functions.RemoveMoney('cash', amount)
    return true
  elseif plr.Functions.GetMoney('bank') >= amount then
    plr.Functions.RemoveMoney('bank', amount)
    return true
  else
    return false
  end
end

---@param src number # player source
---@param amount number # amount to take from player
---@param account string # bank or cash
function addMoney(src, amount, account)
  local plr = QBCore.Functions.GetPlayer(src)
  if not plr then return false end
  plr.Functions.AddMoney(account, amount)
end

---@param src number # player source
---@param item string # item name
---@param amount number # amount to take from player
function removeItem(src, item, amount)
  if not src then return false end
  exports['qb-inventory']:RemoveItem(src, item, amount)
end

---@param src number # player source
---@param item string # item name
---@param amount number # amount to take from player
function addItem(src, item, amount)
  if exports['qb-inventory']:CanAddItem(src, item, amount) then
    exports['qb-inventory']:AddItem(src, item, amount)
  else
    doNotify(src, 5000, 'Inventory: ', 'You cant carry that!', 'error')
  end
end