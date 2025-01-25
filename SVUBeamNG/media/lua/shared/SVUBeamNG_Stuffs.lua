---Like DoParam but for vehicles
---Tbh I don't know how much of this code is just redundant for this patch, but fuck it I'm leaving it anyways
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

-- Now the actual important stuff: Just applying the armor models to their associated vehicle

-- Bruckell LeGran

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

-- ETK I-Series

SetArmor("ETK2400tiEvo","PU_Armor_ETKEvo");
SetArmor("ETK2400tixEvo","PU_Armor_ETKEvo");
SetArmor("RallyETK","PU_Armor_ETK");
SetArmor("PreETK2400","PU_Armor_ETK");
SetArmor("PreETK2400i","PU_Armor_ETK");
SetArmor("PreETK2400ix","PU_Armor_ETK");
SetArmor("PreETK2400ti","PU_Armor_ETK");
SetArmor("PreETK2400tix","PU_Armor_ETK");
SetArmor("PostETK2400","PU_Armor_ETK");
SetArmor("PostETK2400i","PU_Armor_ETK");
SetArmor("PostETK2400ix","PU_Armor_ETK");
SetArmor("PostETK2400ti","PU_Armor_ETK");
SetArmor("PostETK2400tix","PU_Armor_ETK");
SetArmor("PreETK3000i","PU_Armor_ETK");
SetArmor("PreETK3000ix","PU_Armor_ETK");
SetArmor("PostETK3000i","PU_Armor_ETK");
SetArmor("PostETK3000ix","PU_Armor_ETK");

-- Gavril Grand Marshal

SetArmor("GavrilGrandMarshal","PU_Armor_Gavril");
SetArmor("GavrilGrandMarshalLuxe","PU_Armor_Gavril");
SetArmor("GavrilGrandMarshalSport","PU_Armor_Gavril");
SetArmor("GavrilGrandMarshalInterceptor","PU_Armor_Gavril");
SetArmor("GavrilGrandMarshalPolice","PU_Armor_Gavril");
SetArmor("GavrilGrandMarshalUndercover","PU_Armor_Gavril");
SetArmor("GavrilGrandMarshalTaxi","PU_Armor_Gavril");

-- Gavril Roamer

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

-- Ibishu Covet

SetArmor("IbishuCovetDx","PU_Armor_Covet");
SetArmor("IbishuDrivingSchool","PU_Armor_Covet");
SetArmor("IbishuCovetDxi","PU_Armor_Covet");
SetArmor("IbishuCovetLxi","PU_Armor_Covet");
SetArmor("IbishuCovetZxi","PU_Armor_Covet");
SetArmor("IbishuCovetZxiSpecial","PU_Armor_Covet");
SetArmor("IbishuCovetGtz","PU_Armor_Covet");
SetArmor("IbishuCovetTurbo","PU_Armor_Turbo_Covet");
SetArmor("IbishuCovetRally","PU_Armor_Turbo_Covet");

-- Ibishu Hopper

SetArmor("XT4Hopper","PU_Armor_BaseHopper");
SetArmor("XT6Hopper","PU_Armor_BaseHopper");
SetArmor("LXT4Hopper","PU_Armor_BaseHopper");
SetArmor("LXT6Hopper","PU_Armor_BaseHopper");
SetArmor("ZXT6Hopper","PU_Armor_PremiumHopper");
SetArmor("DuneHopper","PU_Armor_PremiumHopper");
SetArmor("SportHopper","PU_Armor_PremiumHopper");
SetArmor("RangerHopper","PU_Armor_PremiumHopper");
SetArmor("SheriffHopper","PU_Armor_BaseHopper");
