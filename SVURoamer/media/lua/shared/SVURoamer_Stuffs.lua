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

SetArmor("RoamerI6","PU_Armor_BaseRoamer");
SetArmor("RoamerFossoil","PU_Armor_BaseRoamer");
SetArmor("RoamerMcCoy","PU_Armor_BaseRoamer");
SetArmor("RoamerI64WD","PU_Armor_StandardRoamer");
SetArmor("RoamerRanger","PU_Armor_SheriffRoamer");
SetArmor("RoamerV8","PU_Armor_StandardRoamer");
SetArmor("RoamerV84WD","PU_Armor_StandardRoamer");
SetArmor("RoamerSheriff","PU_Armor_SheriffRoamer");
SetArmor("RoamerXT","PU_Armor_StandardRoamer");
SetArmor("RoamerXT4WD","PU_Armor_StandardRoamer");
SetArmor("RoamerLXT","PU_Armor_LongStandardRoamer");
SetArmor("RoamerLXT4WD","PU_Armor_LongStandardRoamer");
SetArmor("RoamerFire","PU_Armor_FireRoamer");
SetArmor("RoamerRS","PU_Armor_RSRoamer");
SetArmor("RoamerRSLXT","PU_Armor_RSLXTRoamer");
