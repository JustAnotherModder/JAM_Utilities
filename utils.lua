JAM_Utilities = {}
JUtils = JAM_Utilities
AddEventHandler('JAM_Utilities:GetSharedObject', function(cb) cb(JAM_Utilities); end)

JUtils.Keys = {
    ["ESC"] 		= 322, 	["F1"] 			= 288, 	["F2"] 			= 289, 	["F3"] 			= 170, 	["F5"] 	= 166, 	["F6"] 	= 167, 	["F7"] 	= 168, 	["F8"] 	= 169, 	["F9"] 	= 56, 	["F10"] 	= 57, 
    ["~"] 			= 243, 	["1"] 			= 157, 	["2"] 			= 158, 	["3"] 			= 160, 	["4"] 	= 164, 	["5"] 	= 165, 	["6"] 	= 159, 	["7"] 	= 161, 	["8"] 	= 162, 	["9"] 		= 163, 	["-"] 	= 84, 	["="] 		= 83, 	["BACKSPACE"] 	= 177, 
    ["TAB"] 		= 37,  	["Q"] 			= 44, 	["W"] 			= 32, 	["E"] 			= 38, 	["R"] 	= 45, 	["T"] 	= 245, 	["Y"] 	= 246, 	["U"] 	= 303, 	["P"] 	= 199, 	["["] 		= 39, 	["]"] 	= 40, 	["ENTER"] 	= 18,
    ["CAPS"] 		= 137, 	["A"] 			= 34, 	["S"] 			= 8, 	["D"] 			= 9, 	["F"] 	= 23, 	["G"] 	= 47, 	["H"] 	= 74, 	["K"] 	= 311, 	["L"] 	= 182,
    ["LEFTSHIFT"] 	= 21,  	["Z"] 			= 20, 	["X"] 			= 73, 	["C"] 			= 26, 	["V"] 	= 0, 	["B"] 	= 29, 	["N"] 	= 249, 	["M"] 	= 244, 	[","] 	= 82, 	["."] 		= 81,
    ["LEFTCTRL"] 	= 36,  	["LEFTALT"] 	= 19, 	["SPACE"] 		= 22, 	["RIGHTCTRL"] 	= 70, 
    ["HOME"] 		= 213, 	["PAGEUP"] 		= 10, 	["PAGEDOWN"] 	= 11, 	["DELETE"] 		= 178,
    ["LEFT"] 		= 174, 	["RIGHT"] 		= 175, 	["TOP"] 		= 27, 	["DOWN"] 		= 173,
    ["NENTER"] 		= 201, 	["N4"] 			= 108, 	["N5"] 			= 60, 	["N6"] 			= 107, 	["N+"] 	= 96, 	["N-"] 	= 97, 	["N7"] 	= 117, 	["N8"] 	= 61, 	["N9"] 	= 118
}

function JUtils.DrawTextTemplate(text,x,y,font,scale1,scale2,colour1,colour2,colour3,colour4,wrap1,wrap2,centre,outline,dropshadow1,dropshadow2,dropshadow3,dropshadow4,dropshadow5,edge1,edge2,edge3,edge4,edge5)
    return {
      text         =                    "",
      x            =                    -1,
      y            =                    -1,
      font         =  font         or    6,
      scale1       =  scale1       or  0.5,
      scale2       =  scale2       or  0.5,
      colour1      =  colour1      or  255,
      colour2      =  colour2      or  255,
      colour3      =  colour3      or  255,
      colour4      =  colour4      or  255,
      wrap1        =  wrap1        or  0.0,
      wrap2        =  wrap2        or  1.0,
      centre       =  ( type(centre) ~= "boolean" and true or centre ),
      outline      =  outline      or    1,
      dropshadow1  =  dropshadow1  or    2,
      dropshadow2  =  dropshadow2  or    0,
      dropshadow3  =  dropshadow3  or    0,
      dropshadow4  =  dropshadow4  or    0,
      dropshadow5  =  dropshadow5  or    0,
      edge1        =  edge1        or  255,
      edge2        =  edge2        or  255,
      edge3        =  edge3        or  255,
      edge4        =  edge4        or  255,
      edge5        =  edge5        or  255,
    }
end

function JUtils.DrawText(t)
  if not t or not t.text or t.text == "" or t.x == -1 or t.y == -1
  then return false
  end
  -- Setup Text
  SetTextFont (t.font)
  SetTextScale (t.scale1, t.scale2)
  SetTextColour (t.colour1,t.colour2,t.colour3,t.colour4)
  SetTextWrap (t.wrap1,t.wrap2)
  SetTextCentre (t.centre)
  SetTextOutline (t.outline)
  SetTextDropshadow (t.dropshadow1,t.dropshadow2,t.dropshadow3,t.dropshadow4,t.dropshadow5)
  SetTextEdge (t.edge1,t.edge2,t.edge3,t.edge4,t.edge5)
  SetTextEntry ("STRING")

  -- Draw Text
  AddTextComponentSubstringPlayerName (t.text)
  DrawText (t.x,t.y)
  return true
end

function JUtils:GetXYDist(x1,y1,z1,x2,y2,z2)
  return math.sqrt(  ( (x1 or 0) - (x2 or 0) )*(  (x1 or 0) - (x2 or 0) )+( (y1 or 0) - (y2 or 0) )*( (y1 or 0) - (y2 or 0) )+( (z1 or 0) - (z2 or 0) )*( (z1 or 0) - (z2 or 0) )  )
end

function JUtils:GetVecDist(v1,v2)
  if not v1 or not v2 or not v1.x or not v2.x then return 0 ; end
  return math.sqrt(  ( (v1.x or 0) - (v2.x or 0) )*(  (v1.x or 0) - (v2.x or 0) )+( (v1.y or 0) - (v2.y or 0) )*( (v1.y or 0) - (v2.y or 0) )+( (v1.z or 0) - (v2.z or 0) )*( (v1.z or 0) - (v2.z or 0) )  )
end

function JUtils.GetHashKey(strToHash)
  if type(strToHash) == "number" then return strToHash; end;
  return GetHashKeyPrev(tostring(strToHash or "") or "")%0x100000000;
end
GetHashKeyPrev = GetHashKeyPrev or GetHashKey
GetHashKey     = JUtils.GetHashKey

function JUtils.InRange(num, target, range)
  local hit = false
  for i = target, (target + range), 1 do
    if i == num then hit = true; end
  end
  for i = (target - range), target, 1 do
    if i == num then hit = true; end
  end
  return hit
end

function JUtils.LoadModelsInTable(table)
  if type(table) ~= 'table' then return; end
  for k,v in pairs(table) do
    local hash = JUtils.GetHashKey(v)
    if not HasModelLoaded(hash) then
      RequestModel(hash)
      Citizen.Wait(0)
    end
  end
end

function JUtils.ReleaseTableOfModels(table)
  if type(table) ~= 'table' then return; end
  for k,v in pairs(table) do    
    SetModelAsNoLongerNeeded(v)
  end
end

function JUtils.LoadAudioBank(audioBank)
  while not RequestAmbientAudioBank(audioBank, false) do
    RequestAmbientAudioBank(audioBank, false) 
    Citizen.Wait(0)
  end
end

function JUtils.LoadTextureDict(textureDict)
  while not HasStreamedTextureDictLoaded(textureDict) do
    RequestStreamedTextureDict(textureDict, false)
    Citizen.Wait(0)
  end
end

function JUtils.ToggleUI()
  local isHidden = IsRadarHidden()
  if isHidden then num = 1.0 else num = 0.0; end
  TriggerEvent('es:setMoneyDisplay', num)
  DisplayRadar(isHidden)
  ESX.UI.HUD.SetDisplay(num)
  return isHidden
end

function JUtils.SetUI(val)
  if val == true then num = 1.0 else num = 0.0; end
  TriggerEvent('es:setMoneyDisplay', num)
  DisplayRadar(val)
  ESX.UI.HUD.SetDisplay(num)
end

function JUtils.GetCoordsInFrontOfCam(...)
    local unpack   = table.unpack
    local coords,direction    = GetGameplayCamCoord(), JUtils.RotationToDirection()
    local inTable  = {...}
    local retTable = {}

    if ( #inTable == 0 ) or ( inTable[1] < 0.000001 ) then inTable[1] = 0.000001 ; end

    for k,distance in pairs(inTable) do
        if ( type(distance) == "number" )
        then
            if    ( distance == 0 )
            then
                retTable[k] = coords
            else
                retTable[k] =
                  vector3(
                    coords.x + ( distance*direction.x ),
                    coords.y + ( distance*direction.y ),
                    coords.z + ( distance*direction.z )
                  )
            end
        end
    end
    return unpack(retTable)
end

function JUtils.RotationToDirection(rot)
  if     ( rot == nil ) then rot = GetGameplayCamRot(2);  end
  local  rotZ = rot.z  * ( 3.141593 / 180.0 )
  local  rotX = rot.x  * ( 3.141593 / 180.0 )
  local  c = math.cos(rotX);
  local  multXY = math.abs(c)
  local  res = vector3( ( math.sin(rotZ) * -1 )*multXY, math.cos(rotZ)*multXY, math.sin(rotX) )
  return res
end

function JUtils:Startup()  
  while not self.ESX or not ESX do        
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; self.ESX = obj; end);
    Citizen.Wait(0)
  end
end

Citizen.CreateThread(function(...) JUtils:Startup(...); end)