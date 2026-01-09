require 'Vehicles/Vehicles'

function Vehicles.Create.Television(vehicle, part)
	local deviceData = part:createSignalDevice();
	deviceData:setDeviceName("ValuTech Television")
	deviceData:setIsTwoWay(false);
	deviceData:setTransmitRange(0);
	deviceData:setMicRange(0);
	deviceData:setBaseVolumeRange(10);
	deviceData:setIsPortable(false);
	deviceData:setIsTelevision(true);
	deviceData:setMinChannelRange(200);
	deviceData:setMaxChannelRange(1000000);
	deviceData:setIsBatteryPowered(false);
	deviceData:setIsHighTier(false);
	deviceData:setUseDelta(0.007);
	deviceData:setMediaType(1);
	deviceData:generatePresets();
	local invItem = VehicleUtils.createPartInventoryItem(part);
end

function Vehicles.Update.Television(vehicle, part, elapsedMinutes)
	local deviceData = part:getDeviceData()
	if deviceData and deviceData:getIsTurnedOn() and not vehicle:isEngineRunning() and not vehicle:getSquare():haveElectricity() then
		VehicleUtils.chargeBattery(vehicle, -0.000050 * elapsedMinutes) -- Double the power drain rate of a radio, which sounds fair for a whole-ass TV
	end
	vehicle:transmitPartModData(part);
end

