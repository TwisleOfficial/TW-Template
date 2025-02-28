if Config.Framework == 'qb' then QBCore = exports['qb-core']:GetCoreObject() end

---@param orgin string # orgin where this is being called
---@param playerId number # center of check
---@param faildDist number # how bad they failed the check
local function SendConsoleAlert(orgin, playerId, faildDist)
  print(
    '\n^8[CHEATING-ALERT]^7 ' .. orgin .. ' Distance Check Failed!',
    '\n^8[CHEATING-ALERT]^7 Player Name: ' .. GetPlayerName(playerId),
    '\n^8[CHEATING-ALERT]^7 ' .. GetPlayerIdentifierByType(playerId, 'license'),
    '\n^8[CHEATING-ALERT]^7 Over Vaild Distance By ' .. faildDist .. ' units!'
  )
end

---@param playerId number # Player Id To Check
---@param coords vector3 # center of check
---@param radius number # radius of check
local function DistanceCheck(playerId, coords, radius)
  local dist = #(GetEntityCoords(GetPlayerPed(playerId)) - coords)

  if dist > radius then
    return false
  else
    return true
  end
end

---@param src number # player source
---@param duration number # Length of noti
---@param title string # noti title can be empty string for qb
---@param desc string # noti desc
---@param type string # success or error
local function DoNotify(src, duration, title, desc, type)
  if Config.Notification == 'ox' then
    TriggerClientEvent('ox_lib:notify', src, {
      title = title,
      description = desc,
      type = type,
      duration = duration,
      showDuration = true,
    })
  elseif Config.Notification == 'qb' then
    TriggerClientEvent('QBCore:Notify', src, title .. ' ' .. desc, type, duration)
  end
end

---@param src number # player source
---@param amount number # amount to take from player
local function takeMoney(src, amount, reason)
  if Config.Framework == 'qbx' then
    if qbx:GetMoney(src, 'cash') >= amount then
      qbx:RemoveMoney(src, 'cash', amount, reason)
      return true
    elseif qbx:GetMoney(src, 'bank') >= amount then
      qbx:RemoveMoney(src, 'bank', amount, reason)
      return true
    else
      return false
    end
  elseif Config.Framework == 'qb' then
    local plr = qb.Functions.GetPlayer(src)
    if not plr then return false end
    if plr.Functions.GetMoney('cash') >= amount then -- Changed > to >=
      plr.Functions.RemoveMoney('cash', amount)
      return true
    elseif plr.Functions.GetMoney('bank') >= amount then
      plr.Functions.RemoveMoney('bank', amount)
      return true
    else
      return false
    end
  end
end

---@param src number # player source
---@param amount number # amount to take from player
---@param account string # bank or cash
---@param reason string # reason for change
local function addMoney(src, amount, account, reason)
  if Config.Framework == 'qbx' then
    qbx:AddMoney(src, account, amount, reason)
  elseif Config.Framework == 'qb' then
    local plr = qb.Functions.GetPlayer(src)
    if not plr then return false end
    plr.Functions.AddMoney(account, amount)
  end
end

---@param src number # player source
---@param item string # item name
---@param amount number # amount to take from player
local function removeItem(src, item, amount)
  if Config.Inventory == 'ox' then
    exports.ox_inventory:RemoveItem(src, item, amount)
  elseif Config.Inventory == 'qb' then
    exports['qb-inventory']:RemoveItem(src, item, amount)
  end
end

---@param src number # player source
---@param item string # item name
---@param amount number # amount to take from player
local function addItem(src, item, amount)
  if Config.Inventory == 'ox' then
    if exports.ox_inventory:CanCarryItem(src, item, amount) then
      exports.ox_inventory:AddItem(src, item, amount)
    else
      DoNotify(src, 5000, 'Inventory: ', 'You cant carry that!', 'error')
    end
  elseif Config.Inventory == 'qb' then
    if exports['qb-inventory']:CanAddItem(src, item, amount) then
      exports['qb-inventory']:AddItem(src, item, amount)
    else
      DoNotify(src, 5000, 'Inventory: ', 'You cant carry that!', 'error')
    end
  end
end

lib.callback.register('nameOFscript:server:nameOFwhathappens', function(source)
  return true
end)

RegisterNetEvent('nameOFscript:server:nameOFwhathappens', function ()
  -- Templete netevent
end)



AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then return end
end)

AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then return end
end)