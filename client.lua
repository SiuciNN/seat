ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function SeatControl(seat)
    local playerPed = GetPlayerPed(-1)
    if (IsPedSittingInAnyVehicle(playerPed)) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if IsVehicleSeatFree(vehicle, seat) then
            SetPedIntoVehicle(GetPlayerPed(-1), vehicle, seat)
        end
    end
end


RegisterCommand("s", function(source, args, rawCommand)
    local seatID = tonumber(args[1])
    if seatID ~= nil then
        if seatID == 1 then
            SeatControl(-1)
        elseif seatID == 2 then
            SeatControl(0)
        elseif seatID == 3 then
            SeatControl(1)
        elseif seatID == 4 then
            SeatControl(2)
        end
    end
end, false)
