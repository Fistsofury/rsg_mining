local sharedItems = exports['qbr-core']:GetItems()
local mines
local miningactive = false

-- create prompts for mining
Citizen.CreateThread(function()
    for mines, v in pairs(Config.MiningLocations) do
        exports['qbr-core']:createPrompt(v.name, v.coords, Config.MiningKey, 'Start Mining', {
            type = 'client',
            event = 'rsg_mining:clent:startmining',
            args = {},
        })
        if v.showblip == true then
            local StoreBlip = N_0x554d9d53f696d002(1664425300, v.coords)
            SetBlipSprite(StoreBlip, 2255188926, 1)
            SetBlipScale(StoreBlip, 0.2)
        end
    end
end)

-- map gps to mine1
RegisterNetEvent('rsg_mining:client:gotomine1') -- grizzly mine
AddEventHandler('rsg_mining:client:gotomine1', function()
	StartGpsMultiRoute(GetHashKey("COLOR_RED"), true, true)
	AddPointToGpsMultiRoute(-1404.681, 1157.0645, 226.1493)
	SetGpsMultiRouteRender(true)
end)

-- map gps to mine2
RegisterNetEvent('rsg_mining:client:gotomine2') -- cave mine
AddEventHandler('rsg_mining:client:gotomine2', function()
	StartGpsMultiRoute(GetHashKey("COLOR_RED"), true, true)
	AddPointToGpsMultiRoute(804.93652, 1922.3994, 256.92324)
	SetGpsMultiRouteRender(true)
end)

-- map gps to mine3
RegisterNetEvent('rsg_mining:client:gotomine3') -- annesburg mine
AddEventHandler('rsg_mining:client:gotomine3', function()
	StartGpsMultiRoute(GetHashKey("COLOR_RED"), true, true)
	AddPointToGpsMultiRoute(2802.69, 1342.9, 71.27)
	SetGpsMultiRouteRender(true)
end)

-- start mining / may break your pickaxe
RegisterNetEvent('rsg_mining:clent:startmining')
AddEventHandler('rsg_mining:clent:startmining', function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if miningactive == false then
			if hasItem and miningactive == false then
				miningactive = true
				local player = PlayerPedId()
				TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_PICKAXE_WALL'), Config.MiningTime, true, false, false, false)
				Wait(Config.MiningTime)
				ClearPedTasks(player)
				SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
				miningactive = false
				randomNumber = math.random(1,100)
				if randomNumber > 95 then
					TriggerServerEvent('QBCore:Server:RemoveItem', "pickaxe", 1)
					TriggerEvent("inventory:client:ItemBox", sharedItems["pickaxe"], "remove")
					exports['rsg_notify']:DisplayNotification('your pickaxe is broken', 5000)
				else
					TriggerServerEvent('rsg_mining:server:giveMineReward')
				end
			else
				exports['rsg_notify']:DisplayNotification('you don\'t have a pickaxe!', 5000)
			end
		else
			exports['rsg_notify']:DisplayNotification('you are already mining!', 5000)
		end
	end, { ['pickaxe'] = 1 })
end)