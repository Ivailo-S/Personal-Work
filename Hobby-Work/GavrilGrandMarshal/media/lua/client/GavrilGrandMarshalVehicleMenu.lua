if LimoVehicleMenu == nil then LimoVehicleMenu = {} end
if LimoVehicleMenu.UI == nil then LimoVehicleMenu.UI = {} end

function LimoVehicleMenu.UI.addOptions(playerObj)
	local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
	if menu == nil then return end

	local vehicle = playerObj:getVehicle()
	if vehicle == nil then return end

	local seat = vehicle:getSeat(playerObj)

-- Adds the TV radial option for rear passengers of the Gavril Limo, kudos to RaathTuxicator with his RV code!
-- Note: The base PZ game seems to set any 'signal device', i.e. a radio or television set to be in the front seats on default, nothing much can be done about that.

	if seat >=2 and (vehicle:getScriptName() == "Base.GavrilGrandMarshalLimo" or vehicle:getScriptName() == "Base.GavrilGrandMarshalLuxeLimo") then
		for partIndex=1,vehicle:getPartCount() do
			local part = vehicle:getPartByIndex(partIndex-1)
			if part:getDeviceData() then
				if seat >=2 and (part:getInventoryItem():getType() == "TvBlack" or part:getInventoryItem():getType() == "TvWideScreen") then
					menu:addSlice(getText("IGUI_DeviceOptions"), getTexture("media/textures/Item_Television.png"), ISVehicleMenu.onSignalDevice, playerObj, part)
				end
			end
		end
	end

	-- For the limo's sake, the car radio can also be accessed from the rear compartment as well, basically giving the user a full media powerhouse in the back.

	if seat >=2 and (vehicle:getScriptName() == "Base.GavrilGrandMarshalLimo" or vehicle:getScriptName() == "Base.GavrilGrandMarshalLuxeLimo") then
		for partIndex=1,vehicle:getPartCount() do
			local part = vehicle:getPartByIndex(partIndex-1)
			if part:getDeviceData() then
				if seat >=2 and (part:getInventoryItem():getType() == "RadioBlack" or part:getInventoryItem():getType() == "RadioRed") then
					menu:addSlice(getText("IGUI_DeviceOptions"), getTexture("media/ui/vehicles/vehicle_speakersON.png"), ISVehicleMenu.onSignalDevice, playerObj, part)
				end
			end
		end
	end
end

-- Save default function for wrap it
if LimoVehicleMenu.UI.defaultShowRadialMenu == nil then
    LimoVehicleMenu.UI.defaultShowRadialMenu = ISVehicleMenu.showRadialMenu
end

-- Wrap default fuction
function ISVehicleMenu.showRadialMenu(playerObj)
		LimoVehicleMenu.UI.defaultShowRadialMenu(playerObj)

    if playerObj:getVehicle() then
      LimoVehicleMenu.UI.addOptions(playerObj)
    end
end
