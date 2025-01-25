-- First thing's first here, we need to define what our default BeamNG layout should be. In this case, I just axed anything that was beyond the light and heavy armour for it.
-- Get ready for one helluva bumpy ride

require "ATA2TuningTable"
require "SVUC_TuningTable"

local function copy(obj, seen)
	if type(obj) ~= 'table' then return obj end
	if seen and seen[obj] then return seen[obj] end
	local s = seen or {}
	local res = setmetatable({}, getmetatable(obj))
	s[obj] = res
	for k, v in pairs(obj) do res[copy(k, s)] = copy(v, s) end
	return res
end

local function SVUC_SandboxVars(input)
	return SandboxVars.SVUC[input]
end

Events.OnInitGlobalModData.Add(SVUC_SandboxVars)
function SVUC_TemplateBeamNG()
	local SVUC = {}
	SVUC.timeLight = SVUC_SandboxVars("timeLight")
	SVUC.timeHeavy = SVUC_SandboxVars("timeHeavy")
	SVUC.timeReinforced = SVUC_SandboxVars("timeReinforced")
	SVUC.timeMods = SVUC_SandboxVars("timeMods")
	SVUC.timeWheels = SVUC_SandboxVars("timeWheels")
	SVUC.protectionHealthTriger = SVUC_SandboxVars("protectionHealthTriger")
	SVUC.protectionLightHealthDelta = SVUC_SandboxVars("protectionLightHealthDelta")
	SVUC.protectionHeavyHealthDelta = SVUC_SandboxVars("protectionHeavyHealthDelta")
	SVUC.protectionReinforcedHealthDelta = SVUC_SandboxVars("protectionReinforcedHealthDelta")
	SVUC.protectionBullbarSmallHealthDelta = SVUC_SandboxVars("protectionBullbarSmallHealthDelta")
	SVUC.protectionBullbarMediumHealthDelta = SVUC_SandboxVars("protectionBullbarMediumHealthDelta")
	SVUC.protectionBullbarLargeHealthDelta = SVUC_SandboxVars("protectionBullbarLargeHealthDelta")
	SVUC.protectionPlowHealthDelta = SVUC_SandboxVars("protectionPlowHealthDelta")
	SVUC.protectionWheelsHealthDelta = SVUC_SandboxVars("protectionWheelsHealthDelta")
	SVUC.protectionEngineSmallPowerIncrease = SVUC_SandboxVars("protectionEngineSmallPowerIncrease") * 10
	SVUC.protectionEngineMediumPowerIncrease = SVUC_SandboxVars("protectionEngineMediumPowerIncrease") * 10
	SVUC.protectionEngineLargePowerIncrease = SVUC_SandboxVars("protectionEngineLargePowerIncrease") * 10
	SVUC.protectionEnginePipedPowerIncrease = SVUC_SandboxVars("protectionEnginePipedPowerIncrease") * 10
	SVUC.protectionEngineSnorkelPowerIncrease = SVUC_SandboxVars("protectionEngineSnorkelPowerIncrease") * 10
	SVUC.protectionMods = "protectionMods"
	SVUC.protectionEngineMods = "protectionEngineMods"
	SVUC.protectionLight = "protectionLight"
	SVUC.protectionHeavy = "protectionHeavy"
	SVUC.protectionLightSpiked = "protectionLightSpiked"
	SVUC.protectionHeavySpiked = "protectionHeavySpiked"
	SVUC.protectionLightRusted = "protectionLightRusted"
	SVUC.protectionHeavyRusted = "protectionHeavyRusted"
	SVUC.protectionLightSpikedRusted = "protectionLightSpikedRusted"
	SVUC.protectionHeavySpikedRusted = "protectionHeavySpikedRusted"
	SVUC.protectionReinforced = "protectionReinforced"
	SVUC.protectionReinforcedRusted = "protectionReinforcedRusted"

	TemplateTuningTable = {}
	-- Entries
	TemplateTuningTable["TemplateBeamNG"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}

	-- TemplateBeamNG
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2Bullbar"] = {
		Small = {
			icon = "media/ui/tuning2/mustang_bullbar_1.png",
			name = "IGUI_ATA2_Bullbar_Small",
			category = SVUC.protectionMods,
			protection = {"HeadlightLeft", "HeadlightRight", "EngineDoor"},
			protectionHealthDelta = SVUC.protectionBullbarSmallHealthDelta,
			protectionTriger = SVUC.protectionHealthTriger,
			removeIfBroken = true,
			install = {
				weight = "auto",
				animation = "ATA_PickLock",
				use = {
					MetalPipe = 4,
					MetalBar=2,
					Screws=4,
					BlowTorch = 5,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					primary = "Base.Wrench",
					secondary = "Base.Screwdriver",
				},
				skills = {
					MetalWelding = 3,
					Mechanics = 2,
				},
				time = SVUC.timeMods, 
			},
			uninstall = {
				weight = "auto",
				animation = "ATA_Crowbar_DoorLeft",
				use = {
					BlowTorch=4,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					both = "Base.Crowbar",
				},
				skills = {
					MetalWelding = 2,
				},
				result = "auto",
				time = SVUC.timeMods,
			}
		}
	}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2Bullbar"] = {
		Large = {
			icon = "media/ui/tuning2/van_bullbar_1.png",
			name = "IGUI_ATA2_Bullbar_Large",
			category = SVUC.protectionMods,
			protection = {"HeadlightLeft", "HeadlightRight", "EngineDoor"},
			protectionHealthDelta = SVUC.protectionBullbarLargeHealthDelta,
			-- Notice: Who the fuck forgot the additional 'g' here? This shit made me waste so much time I coulda just smoked a pack and lost less time of my life.
			protectionTriger = SVUC.protectionHealthTriger,
			removeIfBroken = true,
			install = {
				weight = "auto",
				animation = "ATA_PickLock",
				use = {MetalPipe = 6, MetalBar=6, Screws=8, BlowTorch = 5},
				tools = {
					bodylocation = "Base.WeldingMask",
					primary = "Base.Wrench",
					secondary = "Base.Screwdriver",
				},
				skills = {MetalWelding = 6, Mechanics = 4},
				time = SVUC.timeMods, 
			},
			uninstall = {
				weight = "auto",
				animation = "ATA_Crowbar_DoorLeft",
				use = {
					BlowTorch=4,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					both = "Base.Crowbar",
				},
				skills = {MetalWelding = 5},
				result = "auto",
				time = SVUC.timeMods,
			}
		}
	}

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"] = {
		Light = {
			icon = "media/ui/tuning2/protection_window_side.png",
			name = "IGUI_VehiclePartATA2ProtectionWindowFrontLeftLight",
			category = SVUC.protectionLight,
			protection = {"WindowFrontLeft"},
			protectionHealthDelta = SVUC.protectionLightHealthDelta,
			protectionTriger = SVUC.protectionHealthTriger,
			removeIfBroken = true,
			install = {
				area = "TireFrontLeft",
				weight = "auto",
				use = {
					MetalPipe = 4,
					MetalBar=4,
					Screws=6,
					BlowTorch = 5,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					primary = "Base.Wrench",
					secondary = "Base.Screwdriver",
				},
				skills = {
					MetalWelding = 3,
				},
				requireInstalled = {"WindowFrontLeft"},
				time = SVUC.timeLight,
			},
			uninstall = {
				area = "TireFrontLeft",
				animation = "ATA_IdleLeverOpenMid",
				use = {
					BlowTorch=4,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					both = "Base.Crowbar",
				},
				skills = {
					MetalWelding = 2,
				},
				result = "auto",
				time = SVUC.timeLight,
			}
		}
	}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Light)
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy.icon = "media/ui/tuning2/protection_window_sheet_side.png"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy.name = "IGUI_VehiclePartATA2ProtectionWindowFrontLeftHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy.category = SVUC.protectionHeavy
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy.disableOpenWindowFromSeat = "SeatFrontLeft"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy.protectionHealthDelta = SVUC.protectionHeavyHealthDelta
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy.install.use = {MetalPipe = 4, SheetMetal = 2, MetalBar=4, Screws=6, BlowTorch = 5,}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy.install.skills = {MetalWelding = 6}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy.install.time = SVUC.timeHeavy
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy.uninstall.skills = {MetalWelding = 5}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"].Heavy.uninstall.time = SVUC.timeHeavy

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Light.name = "IGUI_VehiclePartATA2ProtectionWindowFrontRightLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Light.protection = {"WindowFrontRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Light.install.requireInstalled = {"WindowFrontRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Light.install.area = "TireFrontRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Light.uninstall.area = "TireFrontRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Heavy.name = "IGUI_VehiclePartATA2ProtectionWindowFrontRightHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Heavy.protection = {"WindowFrontRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Heavy.install.requireInstalled = {"WindowFrontRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Heavy.disableOpenWindowFromSeat = "SeatFrontRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Heavy.install.area = "TireFrontRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"].Heavy.uninstall.area = "TireFrontRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Light.name = "IGUI_VehiclePartATA2ProtectionWindowRearLeftLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Light.protection = {"WindowRearLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Light.install.requireInstalled = {"WindowRearLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Light.install.area = "TireRearLeft"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Light.uninstall.area = "TireRearLeft"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Heavy.name = "IGUI_VehiclePartATA2ProtectionWindowRearLeftHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Heavy.protection = {"WindowRearLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Heavy.install.requireInstalled = {"WindowRearLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Heavy.disableOpenWindowFromSeat = "SeatRearLeft"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Heavy.install.area = "TireRearLeft"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"].Heavy.uninstall.area = "TireRearLeft"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Light.name = "IGUI_VehiclePartATA2ProtectionWindowRearRightLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Light.protection = {"WindowRearRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Light.install.requireInstalled = {"WindowRearRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Light.install.area = "TireRearRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Light.uninstall.area = "TireRearRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Heavy.name = "IGUI_VehiclePartATA2ProtectionWindowRearRightHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Heavy.protection = {"WindowRearRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Heavy.install.requireInstalled = {"WindowRearRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Heavy.disableOpenWindowFromSeat = "SeatRearRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Heavy.install.area = "TireRearRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"].Heavy.uninstall.area = "TireRearRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Light.name = "IGUI_VehiclePartATA2ProtectionWindowMiddleLeftLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Light.protection = {"WindowMiddleLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Light.install.requireInstalled = {"WindowMiddleLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Light.install.area = "TireFrontLeft"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Light.uninstall.area = "TireFrontLeft"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.name = "IGUI_VehiclePartATA2ProtectionWindowMiddleLeftHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.protection = {"WindowMiddleLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.install.requireInstalled = {"WindowMiddleLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.disableOpenWindowFromSeat = nil
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.install.area = "TireFrontLeft"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.uninstall.area = "TireFrontLeft"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Light.name = "IGUI_VehiclePartATA2ProtectionWindowMiddleRightLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Light.protection = {"WindowMiddleRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Light.install.requireInstalled = {"WindowMiddleRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Light.install.area = "TireFrontRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Light.uninstall.area = "TireFrontRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.name = "IGUI_VehiclePartATA2ProtectionWindowMiddleRightHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.protection = {"WindowMiddleRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.install.requireInstalled = {"WindowMiddleRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.disableOpenWindowFromSeat = nil
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.install.area = "TireFrontRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.uninstall.area = "TireFrontRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"] = {
		Light = {
			icon = "media/ui/tuning2/protection_window_windshield.png",
			name = "IGUI_VehiclePartATA2ProtectionWindshieldLight",
			category = SVUC.protectionLight,
			protection = {"Windshield"},
			protectionHealthDelta = SVUC.protectionLightHealthDelta,
			protectionTriger = SVUC.protectionHealthTriger,
			removeIfBroken = true,
			install = {
				area = "TireFrontRight",
				weight = "auto",
				use = {
					MetalPipe = 4,
					MetalBar=4,
					Screws=6,
					BlowTorch = 5,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					primary = "Base.Wrench",
					secondary = "Base.Screwdriver",
				},
				skills = {
					MetalWelding = 3,
				},
				requireInstalled = {"Windshield"},
				time = SVUC.timeLight,
			},
			uninstall = {
				area = "TireFrontRight",
				animation = "ATA_IdleLeverOpenMid",
				use = {
					BlowTorch=4,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					both = "Base.Crowbar",
				},
				skills = {
					MetalWelding = 2,
				},
				result = "auto",
				time = SVUC.timeLight,
			}
		}
	}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Heavy = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Light)
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Heavy.icon = "media/ui/tuning2/protection_window_sheet_windshield.png"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Heavy.name = "IGUI_VehiclePartATA2ProtectionWindshieldHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Heavy.category = SVUC.protectionHeavy
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Heavy.protectionHealthDelta = SVUC.protectionHeavyHealthDelta
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Heavy.install.use = {MetalPipe = 4, SheetMetal = 2, MetalBar=4, Screws=6, BlowTorch = 5,}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Heavy.install.skills = {MetalWelding = 6}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Heavy.install.time = SVUC.timeHeavy
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Heavy.uninstall.skills = {MetalWelding = 5}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"].Heavy.uninstall.time = SVUC.timeHeavy

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"].Light.name = "IGUI_VehiclePartATA2ProtectionWindshieldRearLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"].Light.protection = {"WindshieldRear"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"].Light.install.requireInstalled = {"WindshieldRear"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"].Light.install.area = "TireRearRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"].Light.uninstall.area = "TireRearRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"].Heavy.name = "IGUI_VehiclePartATA2ProtectionWindshieldRearHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"].Heavy.protection = {"WindshieldRear"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"].Heavy.install.requireInstalled = {"WindshieldRear"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"].Heavy.install.area = "TireRearRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"].Heavy.uninstall.area = "TireRearRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"] = {
		Light = {
			icon = "media/ui/tuning2/bus_protection_window_side.png",
			name = "IGUI_VehiclePartATA2ProtectionTrunkLight",
			category = SVUC.protectionLight,
			protection = {"TruckBed", "TrunkDoor", "GasTank"},
			protectionHealthDelta = SVUC.protectionLightHealthDelta,
			protectionTriger = SVUC.protectionHealthTriger,
			removeIfBroken = true,
			install = {
				use = {
					MetalPipe = 4,
					MetalBar=4,
					Screws=6,
					BlowTorch = 5,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					primary = "Base.Wrench",
					secondary = "Base.Screwdriver",
				},
				skills = {
					MetalWelding = 4,
				},
				requireInstalled = {"TruckBed"},
				time = SVUC.timeLight, 
			},
			uninstall = {
				animation = "ATA_IdleLeverOpenMid",
				use = {
					BlowTorch=4,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					both = "Base.Crowbar",
				},
				skills = {
					MetalWelding = 3,
				},
				result = "auto",
				time = SVUC.timeLight,
			}
		}
	}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Heavy = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Light)
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Heavy.name = "IGUI_VehiclePartATA2ProtectionTrunkHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Heavy.icon = "media/ui/tuning2/van_hood_protection.png"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Heavy.category = SVUC.protectionHeavy
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Heavy.protectionHealthDelta = SVUC.protectionHeavyHealthDelta
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Heavy.install.use = {SheetMetal = 4, MetalPipe = 4, MetalBar = 2, Screws = 6, BlowTorch = 4,}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Heavy.install.skills = {MetalWelding = 6}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Heavy.install.time = SVUC.timeHeavy
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Heavy.uninstall.skills = {MetalWelding = 5}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"].Heavy.uninstall.time = SVUC.timeHeavy

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorsRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorsRear"].Light.name = "IGUI_VehiclePartATA2ProtectionDoorsRearLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorsRear"].Light.protection = {"TruckBed", "DoorRear", "GasTank"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorsRear"].Heavy.name = "IGUI_VehiclePartATA2ProtectionDoorsRearHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorsRear"].Heavy.protection = {"TruckBed", "DoorRear", "GasTank"}

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"].Light.name = "IGUI_VehiclePartATA2ProtectionHoodLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"].Light.protection = {"EngineDoor"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"].Light.install.requireInstalled = {"EngineDoor"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"].Light.install.requireUninstalled = {"ATA2AirScoop"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"].Heavy.name = "IGUI_VehiclePartATA2ProtectionHoodHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"].Heavy.protection = {"EngineDoor"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"].Heavy.install.requireInstalled = {"EngineDoor"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"].Heavy.install.requireUninstalled = {"ATA2AirScoop"}

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHoodNoScoop"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHoodNoScoop"].Light.name = "IGUI_VehiclePartATA2ProtectionHoodLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHoodNoScoop"].Light.protection = {"EngineDoor"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHoodNoScoop"].Light.install.requireInstalled = {"EngineDoor"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHoodNoScoop"].Heavy.name = "IGUI_VehiclePartATA2ProtectionHoodHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHoodNoScoop"].Heavy.protection = {"EngineDoor"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHoodNoScoop"].Heavy.install.requireInstalled = {"EngineDoor"}

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"] = {
		Light = {
			icon = "media/ui/tuning2/bus_protection_window_side.png",
			name = "IGUI_VehiclePartATA2ProtectionDoorFrontLeftLight",
			secondModel = "StaticPart",
			category = SVUC.protectionLight,
			protection = {"DoorFrontLeft"},
			protectionHealthDelta = SVUC.protectionLightHealthDelta,
			protectionTriger = SVUC.protectionHealthTriger,
			removeIfBroken = true,
			install = {
				area = "TireFrontLeft",
				weight = "auto",
				use = {
					MetalPipe = 4,
					MetalBar=4,
					Screws=6,
					BlowTorch = 5,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					primary = "Base.Wrench",
					secondary = "Base.Screwdriver",
				},
				skills = {
					MetalWelding = 4,
				},
				requireInstalled = {"DoorFrontLeft"},
				time = SVUC.timeLight,
			},
			uninstall = {
				area = "TireFrontLeft",
				animation = "ATA_IdleLeverOpenMid",
				use = {
					BlowTorch=4,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					both = "Base.Crowbar",
				},
				skills = {
					MetalWelding = 3,
				},
				result = "auto",
				time = SVUC.timeLight,
			}
		}
	}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Heavy = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Light)
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Heavy.icon = "media/ui/tuning2/van_hood_protection.png"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Heavy.name = "IGUI_VehiclePartATA2ProtectionDoorFrontLeftHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Heavy.category = SVUC.protectionHeavy
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Heavy.protectionHealthDelta = SVUC.protectionHeavyHealthDelta
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Heavy.install.use = {MetalPipe = 4, SheetMetal = 2, MetalBar=4, Screws=6, BlowTorch = 5,}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Heavy.install.skills = {MetalWelding = 6}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Heavy.install.time = SVUC.timeHeavy
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Heavy.uninstall.skills = {MetalWelding = 5}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"].Heavy.uninstall.time = SVUC.timeHeavy

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"].Light.name = "IGUI_VehiclePartATA2ProtectionDoorFrontRightLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"].Light.protection = {"DoorFrontRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"].Light.install.requireInstalled = {"DoorFrontRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"].Light.install.area = "TireFrontRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"].Light.uninstall.area = "TireFrontRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"].Heavy.protection = {"DoorFrontRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"].Heavy.name = "IGUI_VehiclePartATA2ProtectionDoorFrontRightHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"].Heavy.install.requireInstalled = {"DoorFrontRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"].Heavy.install.area = "TireFrontRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"].Heavy.uninstall.area = "TireFrontRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"].Light.name = "IGUI_VehiclePartATA2ProtectionDoorRearLeftLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"].Light.protection = {"DoorRearLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"].Light.install.requireInstalled = {"DoorRearLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"].Light.install.area = "TireRearLeft"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"].Light.uninstall.area = "TireRearLeft"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"].Heavy.protection = {"DoorRearLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"].Heavy.name = "IGUI_VehiclePartATA2ProtectionDoorRearLeftHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"].Heavy.install.requireInstalled = {"DoorRearLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"].Heavy.install.area = "TireRearLeft"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"].Heavy.uninstall.area = "TireRearLeft"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"].Light.name = "IGUI_VehiclePartATA2ProtectionDoorMiddleLeftLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"].Light.protection = {"DoorMiddleLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"].Light.install.requireInstalled = {"DoorMiddleLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"].Light.install.area = "TireFrontLeft"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"].Light.uninstall.area = "TireFrontLeft"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.protection = {"DoorMiddleLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.name = "IGUI_VehiclePartATA2ProtectionDoorMiddleLeftHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.install.requireInstalled = {"DoorMiddleLeft"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.install.area = "TireFrontLeft"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.uninstall.area = "TireFrontLeft"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"].Light.name = "IGUI_VehiclePartATA2ProtectionDoorMiddleRightLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"].Light.protection = {"DoorMiddleRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"].Light.install.requireInstalled = {"DoorMiddleRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"].Light.install.area = "TireFrontRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"].Light.uninstall.area = "TireFrontRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.protection = {"DoorMiddleRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.name = "IGUI_VehiclePartATA2ProtectionDoorMiddleRightHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.install.requireInstalled = {"DoorMiddleRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.install.area = "TireFrontRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.uninstall.area = "TireFrontRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"].Light.name = "IGUI_VehiclePartATA2ProtectionDoorRearRightLight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"].Light.protection = {"DoorRearRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"].Light.install.requireInstalled = {"DoorRearRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"].Light.install.area = "TireRearRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"].Light.uninstall.area = "TireRearRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"].Heavy.protection = {"DoorRearRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"].Heavy.name = "IGUI_VehiclePartATA2ProtectionDoorRearRightHeavy"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"].Heavy.install.requireInstalled = {"DoorRearRight"}
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"].Heavy.install.area = "TireRearRight"
	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"].Heavy.uninstall.area = "TireRearRight"

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2InteractiveTrunkRoofRack"] = {
		Default = {
			icon = "media/ui/tuning2/roof_rack_2.png",
			category = SVUC.protectionMods,
			--interactiveTrunk = {
				--filling = {"ATA_VanDeRumba_roof_bag1", "ATA_VanDeRumba_roof_bag2", "ATA_VanDeRumba_roof_bag3", "ATA_VanDeRumba_roof_bag4", "ATA_VanDeRumba_roof_bag5", "ATA_VanDeRumba_roof_bag6"},
				--items = {
					--{
						--itemTypes = {"MetalDrum"},
						--modelNameByCount = {"ATA_VanDeRumba_roof_barrel"},
					--},
					--{
						--itemTypes = {"PetrolCan", "EmptyPetrolCan"},
						--modelNameByCount = {"ATA_VanDeRumba_roof_gascan0", "ATA_VanDeRumba_roof_gascan1", "ATA_VanDeRumba_roof_gascan2", "ATA_VanDeRumba_roof_gascan3", "ATA_VanDeRumba_roof_gascan4", "ATA_VanDeRumba_roof_gascan5", "ATA_VanDeRumba_roof_gascan6", "ATA_VanDeRumba_roof_gascan7", "ATA_VanDeRumba_roof_gascan8", },
					--},
				--}
			--},
			containerCapacity = 50,
			install = {
				area = "TruckBed",
				use = {
					MetalPipe = 6,
					SheetMetal = 6,
					MetalBar=4,
					BlowTorch = 10,
					Screws=12,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					primary = "Base.Wrench",
					secondary = "Base.Screwdriver",
				},
				skills = {
					MetalWelding = 4,
				},
				time = SVUC.timeMods, 
			},
			uninstall = {
				area = "TruckBed",
				animation = "ATA_IdleLeverOpenHigh",
				use = {
					BlowTorch=8,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					both = "Base.Crowbar",
				},
				skills = {
					MetalWelding = 3,
				},
				result = "auto",
				time = SVUC.timeMods,
			}
		}
	}

	TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"] = {
		ATAProtection = {
			removeIfBroken = true,
			icon = "media/ui/tuning2/wheel_chain.png",
			category = SVUC.protectionMods, 
			protectionModel = true,
			protection = {"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"}, 
			protectionHealthDelta = SVUC.protectionWheelsHealthDelta,
			protectionTriger = SVUC.protectionHealthTriger,
			install = {
				area = "TireFrontLeft",
				sound = "ATA2InstallWheelChain",
				use = { 
					ATAProtectionWheelsChain = 1,
					BlowTorch = 4,
				},
				tools = { 
					bodylocation = "Base.WeldingMask", 
					primary = "Base.Wrench",
					secondary = "Base.Screwdriver",
				},
				skills = {
					Mechanics = 2,
					MetalWelding = 3,
				},
				requireInstalled = {"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"},
				time = SVUC.timeWheels, 
			},
			uninstall = {
				area = "TireFrontLeft",
				sound = "ATA2InstallWheelChain",
				use = {
					BlowTorch=4,
				},
				tools = {
					bodylocation = "Base.WeldingMask",
					both = "Base.Crowbar",
				},
				skills = {
					Mechanics = 2,
					MetalWelding = 2,
				},
				result = {
					UnusableMetal=2,
				},
				time = SVUC.timeWheels,
			}
		}
	}

	return TemplateTuningTable
end
Events.OnInitGlobalModData.Add(SVUC_TemplateBeamNG)

-- Because our almighty God has forsaken us, I must also redefine the recipes because I have long been sent to purgatory eons ago.

function SVUBeamNG_setVehicleRecipesArmor(tuningtable, carRecipe, vehicle, part)
	tuningtable[vehicle].parts[part].Light.install.recipes = {carRecipe}
	tuningtable[vehicle].parts[part].Heavy.install.recipes = {carRecipe}
end
function SVUBeamNG_setVehicleRecipesArmorHood(tuningtable, carRecipe, vehicle, part)
	tuningtable[vehicle].parts[part].Light.install.recipes = {carRecipe}
	tuningtable[vehicle].parts[part].Heavy.install.recipes = {carRecipe}
end
function SVUBeamNG_setVehicleRecipesBullbars(tuningtable, carRecipe, vehicle, part)
	tuningtable[vehicle].parts[part].Large.install.recipes = {carRecipe}
end
function SVUBeamNG_setVehicleRecipesBullbarsTruck(tuningtable, carRecipe, vehicle, part)
	tuningtable[vehicle].parts[part].Large.install.recipes = {carRecipe}
end

	-- Now: The Basic Template Models for Each BeamNG car to follow:

local function SVU_TuningTable()
	local TemplateTuningTable = SVUC_TemplateBeamNG()
	local NewCarTuningTable = {}

	NewCarTuningTable["3DoorVehicle"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["3DoorVehicleWithLightbar"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["5DoorSedan"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["5DoorWagon"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["5DoorVehicleWithLightbar"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["5DoorVehicleWithBullbar"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["6SeaterVehicle"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}

	local carRecipe = "ATAVanillaRecipes"

	-- And for each of the above, include and exclude what each bit actually offers as upgrades.

	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionWindowFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionWindshield"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2Bullbar"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2Bullbar"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionTrunk"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionDoorFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2InteractiveTrunkRoofRack"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2InteractiveTrunkRoofRack"])
	NewCarTuningTable["3DoorVehicle"].parts["ATA2ProtectionWheels"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"])

	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionWindowFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionWindshield"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2Bullbar"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2Bullbar"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionTrunk"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionDoorFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"])
	NewCarTuningTable["3DoorVehicleWithLightbar"].parts["ATA2ProtectionWheels"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"])

	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindowFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"])
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"])
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"])
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindshield"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"])
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionTrunk"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"])
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionDoorFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"])
	NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWheels"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"])

	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionWindowFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionWindshield"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2Bullbar"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2Bullbar"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionTrunk"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionDoorFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionDoorRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionDoorRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2InteractiveTrunkRoofRack"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2InteractiveTrunkRoofRack"])
	NewCarTuningTable["5DoorSedan"].parts["ATA2ProtectionWheels"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"])

	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionWindowFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionWindshield"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2Bullbar"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2Bullbar"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionTrunk"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionDoorFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionDoorRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionDoorRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2InteractiveTrunkRoofRack"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2InteractiveTrunkRoofRack"])
	NewCarTuningTable["5DoorWagon"].parts["ATA2InteractiveTrunkRoofRack"].Default.containerCapacity = 70
	NewCarTuningTable["5DoorWagon"].parts["ATA2ProtectionWheels"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"])

	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionWindowFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionWindshield"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2Bullbar"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2Bullbar"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionTrunk"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionDoorFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionDoorRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionDoorRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"])
	NewCarTuningTable["5DoorVehicleWithLightbar"].parts["ATA2ProtectionWheels"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"])

	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionWindowFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionWindshield"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionTrunk"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionDoorFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionDoorRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionDoorRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2InteractiveTrunkRoofRack"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2InteractiveTrunkRoofRack"])
	NewCarTuningTable["5DoorVehicleWithBullbar"].parts["ATA2ProtectionWheels"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"])

	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionWindowFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionWindshield"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionTrunk"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionDoorFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionDoorRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionDoorRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2InteractiveTrunkRoofRack"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2InteractiveTrunkRoofRack"])
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2InteractiveTrunkRoofRack"].Default.containerCapacity = 80
	NewCarTuningTable["5DoorVehicleExtendedWithBullbar"].parts["ATA2ProtectionWheels"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"])

	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindowFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindshield"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionTrunk"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionDoorFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionDoorRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearLeft"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionDoorRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorRearRight"])
	NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"].parts["ATA2ProtectionWheels"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"])

	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionWindowFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontLeft"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionWindowFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowFrontRight"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionWindowMiddleLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleLeft"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionWindowMiddleRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowMiddleRight"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionWindowRearLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearLeft"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionWindowRearRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindowRearRight"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionWindshield"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshield"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionWindshieldRear"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWindshieldRear"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2Bullbar"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2Bullbar"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionTrunk"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionTrunk"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionHood"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionHood"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionDoorFrontLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontLeft"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionDoorFrontRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorFrontRight"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionDoorMiddleLeft"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleLeft"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionDoorMiddleRight"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionDoorMiddleRight"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2InteractiveTrunkRoofRack"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2InteractiveTrunkRoofRack"])
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2InteractiveTrunkRoofRack"].Default.containerCapacity = 80
	NewCarTuningTable["6SeaterVehicle"].parts["ATA2ProtectionWheels"] = copy(TemplateTuningTable["TemplateBeamNG"].parts["ATA2ProtectionWheels"])

	-- Now for each BeamNG model declaration for the templates above

	NewCarTuningTable["PreLeGranReg"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreLeGranS"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreLeGranSV6"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreLeGranSE"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreLeGranSEV6"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["LeGranLuxe"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreLeGranSWagon"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["PreLeGranSV6Wagon"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["PreLeGranSEWagon"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["PreLeGranSEV6Wagon"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["LeGranLuxeWagon"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["PreLeGranSport"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreLeGranSportV6"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreLeGranTaxi"] = NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"]
	NewCarTuningTable["PreLeGranTaxiWagon"] = NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"]
	NewCarTuningTable["PostLeGranReg"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostLeGranS"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostLeGranSV6"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostLeGranSE"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostLeGranSEV6"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostLeGranRegWagon"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["PostLeGranSWagon"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["PostLeGranSV6Wagon"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["PostLeGranSEWagon"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["PostLeGranSEV6Wagon"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["LeGranTowingPackage"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["LeGranCampagne"] = NewCarTuningTable["5DoorWagon"]
	NewCarTuningTable["PostLeGranSport"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostLeGranSportV6"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostLeGranTaxi"] = NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"]
	NewCarTuningTable["PostLeGranTaxiWagon"] = NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"]
	NewCarTuningTable["LeGranPolice"] = NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"]
	NewCarTuningTable["LeGranFire"] = NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"]
	NewCarTuningTable["LeGranUndercover"] = NewCarTuningTable["5DoorVehicleWithBullbar"]
	NewCarTuningTable["LeGranRally"] = NewCarTuningTable["5DoorSedan"]

	NewCarTuningTable["ETK2400tiEvo"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["ETK2400tixEvo"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreETK2400"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreETK2400i"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreETK2400ix"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreETK2400ti"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreETK2400tix"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostETK2400"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostETK2400i"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostETK2400ix"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostETK2400ti"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostETK2400tix"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostETK2400ix"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreETK3000i"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PreETK3000ix"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostETK3000i"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["PostETK3000ix"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["RallyETK"] = NewCarTuningTable["5DoorSedan"]

	NewCarTuningTable["GavrilGrandMarshal"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["GavrilGrandMarshalLuxe"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["GavrilGrandMarshalSport"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["GavrilGrandMarshalUndercover"] = NewCarTuningTable["5DoorVehicleWithBullbar"]
	NewCarTuningTable["GavrilGrandMarshalPolice"] = NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"]
	NewCarTuningTable["GavrilGrandMarshalInterceptor"] = NewCarTuningTable["5DoorVehicleWithLightbarAndBullbar"]
	NewCarTuningTable["GavrilGrandMarshalTaxi"] = NewCarTuningTable["5DoorVehicleWithLightbar"]

	NewCarTuningTable["RoamerI6"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["RoamerFossoil"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["RoamerMcCoy"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["RoamerSheriff"] = NewCarTuningTable["5DoorVehicleWithBullbar"]
	NewCarTuningTable["RoamerFire"] = NewCarTuningTable["5DoorExtendedWithBullbar"]
	NewCarTuningTable["RoamerI64WD"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["RoamerRanger"] = NewCarTuningTable["5DoorVehicleWithBullbar"]
	NewCarTuningTable["RoamerV8"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["RoamerV84WD"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["RoamerXT"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["RoamerXT4WD"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["RoamerLXT"] = NewCarTuningTable["6SeaterVehicle"]
	NewCarTuningTable["RoamerLXT4WD"] = NewCarTuningTable["6SeaterVehicle"]
	NewCarTuningTable["RoamerRS"] = NewCarTuningTable["5DoorSedan"]
	NewCarTuningTable["RoamerRSLXT"] = NewCarTuningTable["6SeaterVehicle"]

	NewCarTuningTable["IbishuCovetDx"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["IbishuDrivingSchool"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["IbishuCovetDxi"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["IbishuCovetLxi"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["IbishuCovetZxi"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["IbishuCovetZxiSpecial"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["IbishuCovetGtz"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["IbishuCovetTurbo"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["IbishuCovetRally"] = NewCarTuningTable["3DoorVehicle"]

	NewCarTuningTable["XT4Hopper"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["XT6Hopper"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["LXT4Hopper"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["LXT6Hopper"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["ZXT6Hopper"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["SportHopper"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["DuneHopper"] = NewCarTuningTable["3DoorVehicle"]
	NewCarTuningTable["SheriffHopper"] = NewCarTuningTable["3DoorVehicleWithLightbarAndBullbar"]
	NewCarTuningTable["RangerHopper"] = NewCarTuningTable["3DoorVehicleWithLightbar"]

	-- And finally, recipes. Man I love walls of text, am I right?

	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionWindowFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionWindowFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionWindowRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionWindowRearRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionWindshield")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionWindshieldRear")
	SVUBeamNG_setVehicleRecipesBullbars(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2Bullbar")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionTrunk")
	SVUBeamNG_setVehicleRecipesArmorHood(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionHood")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionDoorFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionDoorFrontRight")
	SVUC_setVehicleRecipesMods(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2InteractiveTrunkRoofRack")
	SVUC_setVehicleRecipesWheels(NewCarTuningTable, carRecipe, "3DoorVehicle", "ATA2ProtectionWheels")

	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionWindowFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionWindowFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionWindowRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionWindowRearRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionWindshield")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionWindshieldRear")
	SVUBeamNG_setVehicleRecipesBullbars(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2Bullbar")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionTrunk")
	SVUBeamNG_setVehicleRecipesArmorHood(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionHood")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionDoorFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionDoorFrontRight")
	SVUC_setVehicleRecipesWheels(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbar", "ATA2ProtectionWheels")

	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindowFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindowFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindowRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindowRearRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindshield")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindshieldRear")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionTrunk")
	SVUBeamNG_setVehicleRecipesArmorHood(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionHood")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionDoorFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionDoorFrontRight")
	SVUC_setVehicleRecipesWheels(NewCarTuningTable, carRecipe, "3DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWheels")

	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionWindowFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionWindowFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionWindowRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionWindowRearRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionWindshield")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionWindshieldRear")
	SVUBeamNG_setVehicleRecipesBullbars(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2Bullbar")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionTrunk")
	SVUBeamNG_setVehicleRecipesArmorHood(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionHood")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionDoorFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionDoorFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionDoorRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionDoorRearRight")
	SVUC_setVehicleRecipesMods(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2InteractiveTrunkRoofRack")
	SVUC_setVehicleRecipesWheels(NewCarTuningTable, carRecipe, "5DoorSedan", "ATA2ProtectionWheels")

	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionWindowFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionWindowFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionWindowRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionWindowRearRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionWindshield")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionWindshieldRear")
	SVUBeamNG_setVehicleRecipesBullbars(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2Bullbar")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionTrunk")
	SVUBeamNG_setVehicleRecipesArmorHood(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionHood")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionDoorFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionDoorFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionDoorRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionDoorRearRight")
	SVUC_setVehicleRecipesMods(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2InteractiveTrunkRoofRack")
	SVUC_setVehicleRecipesWheels(NewCarTuningTable, carRecipe, "5DoorWagon", "ATA2ProtectionWheels")

	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionWindowFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionWindowFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionWindowRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionWindowRearRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionWindshield")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionWindshieldRear")
	SVUBeamNG_setVehicleRecipesBullbars(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2Bullbar")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionTrunk")
	SVUBeamNG_setVehicleRecipesArmorHood(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionHood")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionDoorFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionDoorFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionDoorRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionDoorRearRight")
	SVUC_setVehicleRecipesWheels(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbar", "ATA2ProtectionWheels")

	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionWindowFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionWindowFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionWindowRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionWindowRearRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionWindshield")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionWindshieldRear")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionTrunk")
	SVUBeamNG_setVehicleRecipesArmorHood(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionHood")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionDoorFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionDoorFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionDoorRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionDoorRearRight")
	SVUC_setVehicleRecipesMods(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2InteractiveTrunkRoofRack")
	SVUC_setVehicleRecipesWheels(NewCarTuningTable, carRecipe, "5DoorVehicleWithBullbar", "ATA2ProtectionWheels")

	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionWindowFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionWindowFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionWindowRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionWindowRearRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionWindshield")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionWindshieldRear")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionTrunk")
	SVUBeamNG_setVehicleRecipesArmorHood(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionHood")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionDoorFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionDoorFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionDoorRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionDoorRearRight")
	SVUC_setVehicleRecipesMods(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2InteractiveTrunkRoofRack")
	SVUC_setVehicleRecipesWheels(NewCarTuningTable, carRecipe, "5DoorVehicleExtendedWithBullbar", "ATA2ProtectionWheels")

	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindowFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindowFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindowRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindowRearRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindshield")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWindshieldRear")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionTrunk")
	SVUBeamNG_setVehicleRecipesArmorHood(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionHood")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionDoorFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionDoorFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionDoorRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionDoorRearRight")
	SVUC_setVehicleRecipesWheels(NewCarTuningTable, carRecipe, "5DoorVehicleWithLightbarAndBullbar", "ATA2ProtectionWheels")

	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionWindowFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionWindowFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionWindowMiddleLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionWindowMiddleRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionWindowRearLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionWindowRearRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionWindshield")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionWindshieldRear")
	SVUBeamNG_setVehicleRecipesBullbars(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2Bullbar")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionTrunk")
	SVUBeamNG_setVehicleRecipesArmorHood(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionHood")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionDoorFrontLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionDoorFrontRight")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionDoorMiddleLeft")
	SVUBeamNG_setVehicleRecipesArmor(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionDoorMiddleRight")
	SVUC_setVehicleRecipesMods(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2InteractiveTrunkRoofRack")
	SVUC_setVehicleRecipesWheels(NewCarTuningTable, carRecipe, "6SeaterVehicle", "ATA2ProtectionWheels")

	ATA2Tuning_AddNewCars(NewCarTuningTable)
end
Events.OnInitGlobalModData.Add(SVU_TuningTable)

-- And with that, we're finally done with this nightmare. Jesus.