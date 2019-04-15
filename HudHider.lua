JAM_HudHider = {}
JHH = JAM_HudHider

function JHH:Start()
    while not JUtils do
        TriggerEvent('JAM_Utilities:GetSharedObject', function(obj) self.JUtils = obj; JUtils = obj; end)
        Citizen.Wait(100)
    end

    Citizen.Wait(1000)

    JUtils.SetUI(false)

    local playerPed = GetPlayerPed()
    while true do    
        local inVeh = IsPedInAnyVehicle(playerPed, true)        

        if         inVeh and     IsRadarHidden() then JUtils.SetUI(false); DisplayRadar(true); 
        elseif not inVeh and not IsRadarHidden() then JUtils.SetUI(false); DisplayRadar(false); end

        Citizen.Wait(100)
    end
end

Citizen.CreateThread(function(...) JHH:Start(...); end)