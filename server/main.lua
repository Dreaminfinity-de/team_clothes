ESX = nil
offduty = true
oldjobname = nil
oldjobgrade = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


for k,v in pairs(Config.skins) do
	RegisterCommand(k, function(source)

		local xPlayer = ESX.GetPlayerFromId(source)
		
		if source > 0 then
			if xPlayer.getGroup() == 'superadmin' or xPlayer.getGroup() == k then

				TriggerClientEvent("team_clothes:changeSkin", source, k)
				
				--print("You are not console.")
			else
				xPlayer.showNotification(_U('command_denied'))
			end
		else
			--print("This is console!")
		end
	end, false) -- this true bool means that the user cannot execute the command unless they have the 'command.commandName' ACL object allowed to one of their identifiers.
end



RegisterNetEvent('offduty')
AddEventHandler('offduty', function(k)
	offduty = k
end)

RegisterNetEvent('setjob')
AddEventHandler('setjob', function(group)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob('team', Config.skins[group].jobgrade)
end)

RegisterNetEvent('setjobback')
AddEventHandler('setjobback', function(name, grade)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob(name, grade)
end)
