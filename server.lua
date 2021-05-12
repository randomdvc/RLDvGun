ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local playergroup = nil
AddEventHandler('chatMessage', function(source, n, msg)
	local Message = string.lower(msg)
	if (Message == "/gundvon") then
		local xPlayer = ESX.GetPlayerFromId(source)
		 playergroup = xPlayer.getGroup()
			if playergroup == 'superadmin' then
				TriggerClientEvent('VehicleDeleteGunOn', source)
			else
			  ESX.ShowNotification("Vous n'avez pas accès à cette commande")
			end
		CancelEvent()
	elseif (Message == "/gundvoff") then
		local xPlayer = ESX.GetPlayerFromId(source)
		 playergroup = xPlayer.getGroup()
			if playergroup == 'superadmin' then
				TriggerClientEvent('VehicleDeleteGunOff', source)
			else
			  ESX.ShowNotification("Vous n'avez pas accès à cette commande")
			end
		CancelEvent()
	end
end)