JAM_HudHider = {}
JHH = JAM_HudHider

function JHH:Start()
    while not JUtils do
        TriggerEvent('JAM_Utilities:GetSharedObject', function(obj) self.JUtils = obj; JUtils = obj; end)
        Citizen.Wait(100)
    end

    Citizen.Wait(1000)

    JUtils.SetUI(false)

    local tick = 1
    local playerPed = PlayerPedId()

    while true do   
        if tick % 100 == 0 then 
            local inVeh = IsPedInAnyVehicle(playerPed, true)     

            if         inVeh and     IsRadarHidden() then JUtils.SetUI(false); DisplayRadar(true); 
            elseif not inVeh and not IsRadarHidden() then JUtils.SetUI(false); DisplayRadar(false); end

            if tick % 1000 == 0 and not inVeh then JUtils.SetUI(false); end
        end

        DisplayCash(false)
        DisplayAmmoThisFrame(false)
        tick = tick + 1
        Citizen.Wait(0)
    end
end

--Citizen.CreateThread(function(...) JHH:Start(...); end)
