local Inactivity = {}

RegisterNetEvent("onClientResourceStart", function(Resource)
	if Resource == GetCurrentResourceName() then
		if not Minutes or parseInt(Minutes) == 0 then
			Minutes = 8
		end

		PlayerInactivity()
	end
end)

function PlayerInactivity()
	local Coords, Heading, Position = GetPlayerPosition()

	if not Inactivity["Coords"] then
		UpdatePositions(Coords, Heading, Position)
	else
		if Coords == Inactivity["Coords"] and Heading == Inactivity["Heading"] and Position == Inactivity["Position"] then
			return TriggerServerEvent("AFK:Kick")
		end 

		UpdatePositions(Coords, Heading, Position)
	end

	Citizen.Wait(Minutes * 60000)

	return PlayerInactivity()
end

function GetPlayerPosition()
	local Ped = PlayerPedId()
	return GetEntityCoords(Ped), GetEntityHeading(Ped), GetGameplayCamCoord()
end

function UpdatePositions(Coords, Heading, Position)
	Inactivity["Coords"], Inactivity["Heading"], Inactivity["Position"] = Coords, Heading, Position
end