local sharedItems = exports['qbr-core']:GetItems()

-- use map to mine1
exports['qbr-core']:CreateUseableItem("mapmine1", function(source, item)
    local src = source
	TriggerClientEvent("rsg_mining:client:gotomine1", src, item.name)
end)

-- use map to mine2
exports['qbr-core']:CreateUseableItem("mapmine2", function(source, item)
    local src = source
	TriggerClientEvent("rsg_mining:client:gotomine2", src, item.name)
end)

-- use map to mine3
exports['qbr-core']:CreateUseableItem("mapmine3", function(source, item)
    local src = source
	TriggerClientEvent("rsg_mining:client:gotomine3", src, item.name)
end)

-- give reward
RegisterServerEvent('rsg_mining:server:giveMineReward')
AddEventHandler('rsg_mining:server:giveMineReward', function()
    local src = source
    local Player = exports['qbr-core']:GetPlayer(src)
	local randomNumber = math.random(1,100)
	
	if randomNumber > 0 and randomNumber <= 70 then
		local _subRan = math.random(1,5)
			if _subRan == 1 then
				Player.Functions.AddItem('copper', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['copper'], "add")
				TriggerClientEvent('rsg_notify:client:notifiy', src, 'you found some copper', 5000)
			elseif _subRan == 2 then
				Player.Functions.AddItem('aluminum', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['aluminum'], "add")
				TriggerClientEvent('rsg_notify:client:notifiy', src, 'you found some aluminum', 5000)
			elseif _subRan == 3 then
				Player.Functions.AddItem('iron', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['iron'], "add")
				TriggerClientEvent('rsg_notify:client:notifiy', src, 'you found some iron', 5000)
			elseif _subRan == 4 then
				Player.Functions.AddItem('steel', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['steel'], "add")
				TriggerClientEvent('rsg_notify:client:notifiy', src, 'you found some steel', 5000)
			else
			TriggerClientEvent('rsg_notify:client:notifiy', src, 'you did not find anything!', 5000)
		end
			
	elseif randomNumber > 70 and randomNumber <= 100 then
		local _subRan = math.random(1,4)
			if _subRan == 1 then
				Player.Functions.AddItem('smallnugget', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['smallnugget'], "add")
				TriggerClientEvent('rsg_notify:client:notifiy', src, 'you found a small gold nugget', 5000)
			elseif _subRan == 2 then
				Player.Functions.AddItem('mediumnugget', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['mediumnugget'], "add")
				TriggerClientEvent('rsg_notify:client:notifiy', src, 'you found a medium gold nugget', 5000)
			elseif _subRan == 3 then
				Player.Functions.AddItem('largenugget', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['largenugget'], "add")
				TriggerClientEvent('rsg_notify:client:notifiy', src, 'you found a large gold nugget', 5000)
			else
			TriggerClientEvent('rsg_notify:client:notifiy', src, 'You did not find anything!', 5000)
		end
    end
end)