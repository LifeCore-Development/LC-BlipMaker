local QBCore = exports['qb-core']:GetCoreObject()  

function tprint (tbl, indent)
	if not indent then indent = 0 end
	for k, v in pairs(tbl) do
	  formatting = string.rep("  ", indent) .. k .. ": "
	  if type(v) == "table" then
		print(formatting)
		tprint(v, indent+1)
	  elseif type(v) == 'boolean' then
		print(formatting .. tostring(v))      
	  else
		print(formatting .. v)
	  end
	end
  end



--BLIP
Citizen.CreateThread(function()

	for k, v in pairs(Config.BlipSettings) do
		k = AddBlipForCoord(v.bliplocation)
		SetBlipSprite (k, v.blipsprite)
		SetBlipDisplay(k, 4)
		SetBlipScale  (k, v.blipscale)
		SetBlipAsShortRange(k, true)
		SetBlipColour(k, v.blipcolor)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName(v.name)
		EndTextCommandSetBlipName(k)
	end
end)


