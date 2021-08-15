ESX = nil
oldjobname = nil
oldjobgrade = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("team_clothes:changeSkin")
AddEventHandler("team_clothes:changeSkin", function(group)


	changeSkin_func(group)
end)

RegisterNetEvent("team_clothes:changeJob")
AddEventHandler("team_clothes:changeJob", function()

    changeJob_func()

end)


local offduty = nil




function changeSkin_func(group)
	if offduty == nil then
		client = ESX.GetPlayerData()
		oldjobname = client.job.name
		oldjobgrade = client.job.grade

		TriggerServerEvent('setjob', group)
		

		TriggerEvent('skinchanger:getSkin', function(skin)
			SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
			if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.skins[group].male)
				ESX.ShowNotification(_U('skin_onduty'))
				offduty = skin
				TriggerServerEvent('offduty', false)
			elseif skin.sex == 1 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.skins[group].female)
				ESX.ShowNotification(_U('skin_onduty'))
				offduty = skin
				TriggerServerEvent('offduty', false)
			else
				ESX.ShowNotification('~r~ Error - Sex undefinied!!!')
			end
		
		end)
	
	else
		TriggerServerEvent('setjobback', oldjobname, oldjobgrade)
		oldjobname = nil
		oldjobgrade = nil

		TriggerEvent('skinchanger:getSkin', function(skin)
			SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
			if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, offduty)
				ESX.ShowNotification(_U('skin_offduty'))
				offduty = nil
				TriggerServerEvent('offduty', true)
			elseif skin.sex == 1 then
				TriggerEvent('skinchanger:loadClothes', skin, offduty)
				ESX.ShowNotification(_U('skin_offduty'))
				offduty = nil
				TriggerServerEvent('offduty', true)
			else
				ESX.ShowNotification('~r~ Error - Sex undefinied!!!')
			end
		
		end)
	end
end

function changeJob_func()
	
	if offduty == nil then
		
		return true
		
	end

end