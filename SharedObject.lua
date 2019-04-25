JAM_Utilities = {}
JUtils = JAM_Utilities

AddEventHandler('JAM_Utilities:GetSharedObject', function(cb) cb(JUtils); end)