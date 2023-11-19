Message = "Você foi kickado por estar ausente."
Minutes = 8

if IsDuplicityVersion() then
	RegisterServerEvent("AFK:Kick", function()
		DropPlayer(source, Message)
	end)	
end

function parseInt(Value)
	local Result = 0
	local Number = tonumber(Value)

	if Number and Number > 0 then
		Result = math.floor(Number)
	end

	return Result
end