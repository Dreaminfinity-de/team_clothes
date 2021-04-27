ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("support", function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
	
    if source > 0 then
		if xPlayer.getGroup() == 'superadmin' then
			TriggerClientEvent("support:changeSkin", source)
			--print("You are not console.")
		else
			xPlayer.showNotification(_U('command_denied'))
		end
    else
        --print("This is console!")
    end
end, false) -- this true bool means that the user cannot execute the command unless they have the 'command.commandName' ACL object allowed to one of their identifiers.