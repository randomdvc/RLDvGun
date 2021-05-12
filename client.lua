RegisterNetEvent('VehicleDeleteGunOn')
RegisterNetEvent('VehicleDeleteGunOff')
local toggle = false

AddEventHandler('VehicleDeleteGunOn', function()
	toggle = true
	drawNotification("~g~Vehicle Delete Gun Enabled!")
end)

AddEventHandler('VehicleDeleteGunOff', function()
	toggle = false
	drawNotification("~r~Vehicle Delete Gun Disabled!")
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if toggle then
			if IsPlayerFreeAiming(PlayerId()) then
				local entity = getEntity(PlayerId())
					if IsPedShooting(GetPlayerPed(-1)) then
						SetEntityAsMissionEntity(entity, true, true)
						if Config.DVGunEntities then
							DeleteEntity(entity)
						else
							local vehicle = GetVehicleIndexFromEntityIndex(entity)
							DeleteVehicle(vehicle)
						end
					end
			end
		end
	end
end)

function getEntity(player) --Function To Get Entity Player Is Aiming At
	local result, entity = GetEntityPlayerIsFreeAimingAt(player)
	return entity
end

function drawNotification(text) --Just Don't Edit!
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end



