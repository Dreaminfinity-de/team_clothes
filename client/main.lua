ESX = nil
onduty = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('team_clothes:setOnduty')
AddEventHandler('team_clothes:setOnduty', function(group)
	client = ESX.GetPlayerData()

	TriggerEvent('skinchanger:getSkin', function(skin)
		onduty = true

		TriggerServerEvent('team_clothes:saveSkin', skin)

		playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			while onduty do
				Citizen.Wait(0)
				SetEntityInvincible(playerPed, true)
			end
			SetEntityInvincible(playerPed, false)
		end)

		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.skins[group].male)
		elseif skin.sex == 1 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.skins[group].female)
		else
			ESX.ShowNotification('~r~ Error - Sex undefined!!!')
		end
	
	end)
end)

RegisterNetEvent('team_clothes:setOffduty')
AddEventHandler('team_clothes:setOffduty', function(group)
	onduty = false
	playerPed = GetPlayerPed(-1)
end)
