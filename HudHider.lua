-- Citizen.CreateThread(function() 
--     while ESX == nil do
--         TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--         Citizen.Wait(0)
--     end
    
--     local tick = 0
-- 	while true do
-- 		local inVeh = IsPedInAnyVehicle(GetPlayerPed())

-- 		if inVeh then
-- 			DisplayRadar(true)
-- 		else
-- 			DisplayRadar(false)
-- 		end

-- 		if tick % 100 == 0 then
-- 			ESX.UI.HUD.SetDisplay(0.0)
-- 			TriggerEvent('es:setMoneyDisplay', 0.0)
-- 		end

-- 		tick = tick + 1
-- 		Citizen.Wait(0)
-- 	end
-- end)