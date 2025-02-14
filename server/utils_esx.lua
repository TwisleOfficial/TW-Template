if Config.Framework ~= 'esx' then return end
ESX = exports["es_extended"]:getSharedObject()

---@param src number # player source
---@param title string # noti title can be empty string for qb
---@param desc string # noti desc
---@param type string # success or error
---@param duration number # success or error
function doNotify(src, title, desc, type, duration)
  local plr = ESX.GetPlayerFromId(src)
  if not plr then return false end
  TriggerClientEvent('esx:showNotification', src, title.. ' ' ..desc, type, duration)
end

---@param src number # player source
---@param amount number # amount to take from player
function takeMoney(src, amount)
  local plr = ESX.GetPlayerFromId(src)
  if not plr then return false end
  if plr.getMoney() >= amount then
    plr.removeMoney(amount)
    return true
  else
    return false
  end
end

---@param src number # player source
---@param amount number # amount to take from player
function addMoney(src, amount)
  local plr = ESX.GetPlayerFromId(src)
  if not plr then return false end
  plr.addMoney(amount)
end

---@param src number # player source
---@param item string # item name
---@param amount number # amount to take from player
function removeItem(src, item, amount)
  local plr = ESX.GetPlayerFromId(src)
  if not plr then return false end
  plr.removeInventoryItem(item, amount)
end

---@param src number # player source
---@param item string # item name
---@param amount number # amount to take from player
function addItem(src, item, amount)
  local plr = ESX.GetPlayerFromId(src)
  if not plr then return false end
  if plr.canCarryItem(item, amount) then
    plr.addInventoryItem(item, amount)
  else
    doNotify(src, 'Inventory: ', 'You cant carry that!', 'error', 5000)
  end
end