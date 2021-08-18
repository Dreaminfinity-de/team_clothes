ESX = nil
offduty = true
oldjobname = nil
oldjobgrade = nil

onduty = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('team_clothes:saveSkin')
AddEventHandler('team_clothes:saveSkin', function(skin)
	if onduty[source] ~= nil then
		onduty[source].skin = skin
	end
end)



for k,v in pairs(Config.skins) do
	command = k
	RegisterCommand(k, function(source)

		local xPlayer = ESX.GetPlayerFromId(source)
		
		if source > 0 then
			--print("You are not console.")
			if isOnduty(source) then
				setOffduty(source)
			else
				if xPlayer.getGroup() == 'superadmin' or xPlayer.getGroup() == command then
					setOnduty(source, k)
				else
					xPlayer.showNotification(_U('command_denied'))
				end
			end
		else
			--print("This is console!")
		end
	end, false) -- this true bool means that the user cannot execute the command unless they have the 'command.commandName' ACL object allowed to one of their identifiers.
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		for k,v in pairs(onduty) do
			setOffduty(k)
		end
	end
end)



function isOnduty(playerid)
	return onduty[playerid] ~= nil
end

function setOffduty(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob(onduty[source].job, onduty[source].grade)
	TriggerClientEvent('skinchanger:loadClothes', source, onduty[source].skin, onduty[source].skin)
	onduty[source] = nil
	TriggerClientEvent("team_clothes:setOffduty", source)

	xPlayer.showNotification(_U('skin_offduty'))
end

function setOnduty(source, group)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	onduty[source] = { job = xPlayer.getJob().name, grade = xPlayer.getJob().grade }
	xPlayer.setJob('team', Config.skins[group].jobgrade)
	TriggerClientEvent("team_clothes:setOnduty", source, group)
	
	xPlayer.showNotification(_U('skin_onduty'))
end
