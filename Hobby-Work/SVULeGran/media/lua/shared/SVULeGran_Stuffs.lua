---Like DoParam but for vehicles
---@param vehicle string Name of the vehicle script
---@param param string The parameter(s) to apply to this script
---@param module string Optional: the module of the vehicle
---@see Item#DoParam
---@see VehicleScript#Load
local DoVehicleParam = function(vehicle, param, module)
	module = module or "Base"
	local vehicleScript = ScriptManager.instance:getVehicle(module .. "." .. vehicle)
	if not vehicleScript then return end
	vehicleScript:Load(vehicle, "{" .. param .. "}")
end

---Utility to change the armor of a vehicle
---@param vehicle string Name of the vehicle script
---@param armor string Name of a armor template
---@see DoVehicleParam
local SetArmor = function(vehicle, armor, module)
	module = module or "Base"
	DoVehicleParam(vehicle, "template! = " .. armor .. ",")
end

---Utility to change the horn sound of a vehicle
---@param vehicle string Name of the vehicle script
---@param sound string Name of a sound
---@see DoVehicleParam
local SetHornSound = function(vehicle, sound)
	DoVehicleParam(vehicle, "sound { horn = " .. sound .. ",}")
end


-- ONLY EDIT BELOW THIS LINE!!! --

-- It's pretty simple.
-- Specify the vehicle's script name, and the armor's script name for said vehicle.

SetArmor("PreLeGranReg","PU_Armor_LeGranSed");
SetArmor("PreLeGranS","PU_Armor_LeGranSed");
SetArmor("PreLeGranSV6","PU_Armor_LeGranSed");
SetArmor("PreLeGranSE","PU_Armor_LeGranSed");
SetArmor("PreLeGranSEV6","PU_Armor_LeGranSed");
SetArmor("LeGranLuxe","PU_Armor_LeGranSed");
SetArmor("PreLeGranSWagon","PU_Armor_LeGranWag");
SetArmor("PreLeGranSV6Wagon","PU_Armor_LeGranWag");
SetArmor("PreLeGranSEWagon","PU_Armor_LeGranWag");
SetArmor("PreLeGranSEV6Wagon","PU_Armor_LeGranWag");
SetArmor("LeGranLuxeWagon","PU_Armor_LeGranWag");
SetArmor("PreLeGranSport","PU_Armor_LeGranSed");
SetArmor("PreLeGranSportV6","PU_Armor_LeGranSed");
SetArmor("PreLeGranTaxi","PU_Armor_LeGranSed");
SetArmor("PreLeGranTaxiWagon","PU_Armor_LeGranWag");
SetArmor("PostLeGranReg","PU_Armor_LeGranSed");
SetArmor("PostLeGranS","PU_Armor_LeGranSed");
SetArmor("PostLeGranSV6","PU_Armor_LeGranSed");
SetArmor("PostLeGranSE","PU_Armor_LeGranSed");
SetArmor("PostLeGranSEV6","PU_Armor_LeGranSed");
SetArmor("PostLeGranRegWagon","PU_Armor_LeGranWag");
SetArmor("PostLeGranSWagon","PU_Armor_LeGranWag");
SetArmor("PostLeGranSV6Wagon","PU_Armor_LeGranWag");
SetArmor("PostLeGranSEWagon","PU_Armor_LeGranWag");
SetArmor("PostLeGranSEV6Wagon","PU_Armor_LeGranWag");
SetArmor("LeGranTowingPackage","PU_Armor_LeGranSed");
SetArmor("LeGranCampagne","PU_Armor_LeGranOffroad");
SetArmor("PostLeGranSport","PU_Armor_LeGranSed");
SetArmor("PostLeGranSportV6","PU_Armor_LeGranSed");
SetArmor("PostLeGranTaxi","PU_Armor_LeGranSed");
SetArmor("PostLeGranTaxiWagon","PU_Armor_LeGranSed");
SetArmor("LeGranPolice","PU_Armor_LeGranSed");
SetArmor("LeGranFire","PU_Armor_LeGranOffroad");
SetArmor("LeGranUndercover","PU_Armor_LeGranSed");
SetArmor("LeGranRally","PU_Armor_LeGranSed");

