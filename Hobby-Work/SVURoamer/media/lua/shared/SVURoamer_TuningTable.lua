require "ATA2TuningTable"

local function copy(obj, seen)
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[copy(k, s)] = copy(v, s) end
  return res
end

local carRecipe = "ATAVanillaRecipes"
local timeLong = 45
local timeLong2 = 30
local timeMid = 20
local timeMid2 = 15
local timeShort = 10
local protectionLight = "protectionLight"
local protectionHeavy = "protectionHeavy"
local protectionMods = "protectionMods"

local NewCarTuningTable = {}
-- Entries
-- Specify each vehicle script here.
NewCarTuningTable["TemplateRoamer"] = {
	addPartsFromVehicleScript = "",
	parts = {}
}
	NewCarTuningTable["Roamer"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["LongRoamer"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["RoamerSheriff"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["RoamerFire"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}

-- A template of sorts to streamline code. DO NOT EDIT!!!
-- TemplateRoamer
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontLeft"] = {
	Light = {
		shader = "vehiclewheel",
		icon = "media/ui/tuning2/protection_window_side.png",
		--secondModel = "StaticPart",
		category = protectionLight,
		protection = {"WindowFrontLeft"},
		removeIfBroken = true,
		install = {
			area = "TireFrontLeft",
			weight = "auto",
			use = {
				MetalPipe = 2,
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
			},
			recipes = {carRecipe},
			requireInstalled = {"WindowFrontLeft"},
			time = timeLong,
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
			time = timeLong,
		}
	},
	Heavy = {
		shader = "vehiclewheel",
		icon = "media/ui/tuning2/protection_window_sheet_side.png",
		--secondModel = "StaticPart",
		category = protectionHeavy,
		protection = {"WindowFrontLeft"},
		disableOpenWindowFromSeat = "SeatFrontLeft",
		removeIfBroken = true,
		install = {
			area = "TireFrontLeft",
			weight = "auto",
			use = {
				MetalPipe = 2,
				SheetMetal = 2,
				Screws=4,
				BlowTorch = 5,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				primary = "Base.Wrench",
				secondary = "Base.Screwdriver",
			},
			skills = {
				MetalWelding = 5,
			},
			recipes = {carRecipe},
			requireInstalled = {"WindowFrontLeft"},
			time = timeLong,
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
				MetalWelding = 4,
			},
			result = "auto",
			time = timeLong,
		}
	}
}

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"].Light.protection = {"WindowFrontRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"].Light.install.requireInstalled = {"WindowFrontRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"].Light.install.area = "TireFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"].Light.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"].Light.protection = {"WindowRearLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"].Light.install.requireInstalled = {"WindowRearLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"].Light.install.area = "TireRearLeft"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"].Light.uninstall.area = "TireRearLeft"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"].Light.protection = {"WindowRearRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"].Light.install.requireInstalled = {"WindowRearRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"].Light.install.area = "TireRearRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"].Light.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"].Heavy.protection = {"WindowFrontRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"].Heavy.install.requireInstalled = {"WindowFrontRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"].Heavy.disableOpenWindowFromSeat = "SeatFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"].Heavy.protection = {"WindowRearLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"].Heavy.install.requireInstalled = {"WindowRearLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"].Heavy.disableOpenWindowFromSeat = "SeatRearLeft"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"].Heavy.install.area = "TireRearLeft"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"].Heavy.uninstall.area = "TireRearLeft"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"].Heavy.protection = {"WindowRearRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"].Heavy.install.requireInstalled = {"WindowRearRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"].Heavy.disableOpenWindowFromSeat = "SeatRearRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"].Heavy.install.area = "TireRearRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"].Heavy.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"].Light.protection = {"WindowMiddleLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"].Light.install.requireInstalled = {"WindowMiddleLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.install.area = "TireFrontLeft"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.uninstall.area = "TireFrontLeft"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"].Light.protection = {"WindowMiddleRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"].Light.install.requireInstalled = {"WindowMiddleRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.protection = {"WindowMiddleLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.install.requireInstalled = {"WindowMiddleLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.disableOpenWindowFromSeat = {"SeatMiddleLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.install.area = "TireFrontLeft"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.uninstall.area = "TireFrontLeft"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.protection = {"WindowMiddleRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.install.requireInstalled = {"WindowMiddleRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.disableOpenWindowFromSeat = {"SeatMiddleRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshield"] = {
	Light = {
		icon = "media/ui/tuning2/protection_window_windshield.png",
		category = protectionLight,
		protection = {"Windshield"},
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
				primary = "Base.Screwdriver",
			},
			skills = {
				MetalWelding = 3,
			},
			recipes = {carRecipe},
			requireInstalled = {"Windshield"},
			time = timeLong,
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
			time = timeLong,
		}
	},
	Heavy = {
		icon = "media/ui/tuning2/protection_window_sheet_windshield.png",
		category = protectionHeavy,
		protection = {"Windshield"},
		removeIfBroken = true,
		install = {
			area = "TireFrontRight",
			weight = "auto",
			use = {
				MetalPipe = 4,
				SheetMetal = 2,
				MetalBar=4,
				Screws=6,
				BlowTorch = 5,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				primary = "Base.Screwdriver",
			},
			skills = {
				MetalWelding = 5,
			},
			recipes = {carRecipe},
			requireInstalled = {"Windshield"},
			time = timeLong,
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
				MetalWelding = 4,
			},
			result = "auto",
			time = timeLong,
		}
	}
}

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshield"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"].Light.protection = {"WindshieldRear"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"].Light.install.requireInstalled = {"WindshieldRear"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"].Light.install.area = "TireRearRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"].Light.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"].Heavy.protection = {"WindshieldRear"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"].Heavy.install.requireInstalled = {"WindshieldRear"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"].Heavy.install.area = "TireRearRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"].Heavy.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2Bullbar"] = {
	Default = {
		icon = "media/ui/tuning2/van_bullbar_1.png",
		name = "IGUI_ATA2_Bullbar",
		category = protectionMods,
		protection = {"HeadlightLeft", "HeadlightRight", "EngineDoor"},
		install = {
			weight = "auto",
			animation = "ATA_PickLock",
			use = {
				MetalPipe = 4,
				MetalBar=2,
				Screws=6,
				BlowTorch = 6,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				primary = "Base.Wrench",
			},
			skills = {
				MetalWelding = 4,
				Mechanics = 2,
			},
			recipes = {"Intermediate Mechanics", carRecipe},
			time = timeMid, 
		},
		uninstall = {
			weight = "auto",
			animation = "ATA_Crowbar_DoorLeft",
			use = {
				BlowTorch=3,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				both = "Base.Crowbar",
			},
			skills = {
				MetalWelding = 3,
			},
			result = "auto",
			time = timeShort,
		}
	}
}

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionTrunk"] = {
	Light = {
		icon = "media/ui/tuning2/bus_protection_window_side.png",
		category = protectionLight,
		protection = {"TruckBed", "TrunkDoor", "GasTank"},
		install = {
			use = {
				MetalPipe = 4,
				MetalBar = 2,
				Screws = 4,
				BlowTorch = 4,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				primary = "Base.Wrench",
			},
			skills = {
				MetalWelding = 4,
			},
			recipes = {carRecipe},
			requireInstalled = {"TruckBed"},
			time = timeLong2, 
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
			time = timeMid2,
		}
	},
	Heavy = {
		icon = "media/ui/tuning2/van_hood_protection.png",
		category = protectionHeavy,
		protection = {"TruckBed", "TrunkDoor", "GasTank"},
		install = {
			use = {
				SheetMetal = 4,
				MetalPipe = 4,
				MetalBar = 2,
				Screws = 6,
				BlowTorch = 4,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				primary = "Base.Wrench",
			},
			skills = {
				MetalWelding = 6,
			},
			recipes = {carRecipe},
			requireInstalled = {"TruckBed"},
			time = timeLong2, 
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
				MetalWelding = 5,
			},
			result = "auto",
			time = timeMid2,
		}
	}
}

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorsRear"] = {
	Light = {
		icon = "media/ui/tuning2/bus_protection_window_side.png",
		category = protectionLight,
		protection = {"TruckBed", "DoorRear"},
		install = {
			use = {
				MetalPipe = 4,
				MetalBar = 2,
				Screws = 4,
				BlowTorch = 4,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				primary = "Base.Wrench",
			},
			skills = {
				MetalWelding = 4,
			},
			recipes = {carRecipe},
			requireInstalled = {"TruckBed"},
			time = timeLong2, 
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
			time = timeMid2,
		}
	},
	Heavy = {
		icon = "media/ui/tuning2/van_hood_protection.png",
		category = protectionHeavy,
		protection = {"TruckBed", "DoorRear"},
		install = {
			use = {
				SheetMetal = 4,
				MetalPipe = 4,
				MetalBar = 2,
				Screws = 6,
				BlowTorch = 4,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				primary = "Base.Wrench",
			},
			skills = {
				MetalWelding = 6,
			},
			recipes = {carRecipe},
			requireInstalled = {"TruckBed"},
			time = timeLong2, 
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
				MetalWelding = 5,
			},
			result = "auto",
			time = timeMid2,
		}
	}
}

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionHood"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionHood"].Light.protection = {"EngineDoor"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionHood"].Light.install.requireInstalled = {"EngineDoor"}

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionHood"].Heavy.protection = {"EngineDoor"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionHood"].Heavy.install.requireInstalled = {"EngineDoor"}

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontLeft"] = {
	Light = {
		icon = "media/ui/tuning2/bus_protection_window_side.png",
		secondModel = "StaticPart",
		category = protectionLight,
		protection = {"DoorFrontLeft"},
		install = {
			area = "TireFrontLeft",
			weight = "auto",
			use = {
				MetalPipe = 4,
				MetalBar=4,
				Screws=4,
				BlowTorch = 8,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				primary = "Base.Wrench",
			},
			skills = {
				MetalWelding = 4,
			},
			recipes = {carRecipe},
			requireInstalled = {"DoorFrontLeft"},
			time = timeLong,
		},
		uninstall = {
			area = "TireFrontLeft",
			animation = "ATA_IdleLeverOpenMid",
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
			time = timeMid,
		}
	},
	Heavy = {
		icon = "media/ui/tuning2/van_hood_protection.png",
		secondModel = "StaticPart",
		category = protectionHeavy,
		protection = {"DoorFrontLeft"},
		install = {
			area = "TireFrontLeft",
			weight = "auto",
			use = {
				MetalPipe = 4,
				MetalBar=4,
				SheetMetal=6,
				Screws=10,
				BlowTorch = 8,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				primary = "Base.Wrench",
			},
			skills = {
				MetalWelding = 6,
			},
			recipes = {carRecipe},
			requireInstalled = {"DoorFrontLeft"},
			time = timeLong,
		},
		uninstall = {
			area = "TireFrontLeft",
			animation = "ATA_IdleLeverOpenMid",
			use = {
				BlowTorch=8,
			},
			tools = {
				bodylocation = "Base.WeldingMask",
				both = "Base.Crowbar",
			},
			skills = {
				MetalWelding = 5,
			},
			result = "auto",
			time = timeMid,
		}
	}
}

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"].Light.protection = {"DoorFrontRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"].Light.install.requireInstalled = {"DoorFrontRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"].Light.install.area = "TireFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"].Light.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"].Light.protection = {"DoorRearLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"].Light.install.requireInstalled = {"DoorRearLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"].Light.install.area = "TireRearLeft"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"].Light.uninstall.area = "TireRearLeft"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"].Light.protection = {"DoorRearRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"].Light.install.requireInstalled = {"DoorRearRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"].Light.install.area = "TireRearRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"].Light.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"].Heavy.protection = {"DoorFrontRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"].Heavy.install.requireInstalled = {"DoorFrontRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"].Heavy.protection = {"DoorRearLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"].Heavy.install.requireInstalled = {"DoorRearLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"].Heavy.install.area = "TireRearLeft"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"].Heavy.uninstall.area = "TireRearLeft"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"].Heavy.protection = {"DoorRearRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"].Heavy.install.requireInstalled = {"DoorRearRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"].Heavy.install.area = "TireRearRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"].Heavy.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleLeft"].Light.protection = {"DoorMiddleLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleLeft"].Light.install.requireInstalled = {"DoorMiddleLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleLeft"].Light.install.area = "TireFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleLeft"].Light.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleRight"].Light.protection = {"DoorMiddleRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleRight"].Light.install.requireInstalled = {"DoorMiddleRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleRight"].Light.install.area = "TireFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleRight"].Light.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.protection = {"DoorMiddleLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.install.requireInstalled = {"DoorMiddleLeft"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.protection = {"DoorMiddleRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.install.requireInstalled = {"DoorMiddleRight"}
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateRoamer"].parts["ATA2InteractiveTrunkRoofRack"] = {
	Default = {
		icon = "media/ui/tuning2/roof_rack_2.png",
		category = protectionMods,
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
			},
			skills = {
				MetalWelding = 4,
			},
			recipes = {carRecipe},
			time = timeLong, 
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
			time = timeMid,
		}
	}
}

NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWheels"] = {
	ATAProtection = {
		removeIfBroken = true,
		icon = "media/ui/tuning2/wheel_chain.png",
		category = protectionMods, 
		protectionModel = true, 
		protection = {"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"}, 
		install = { 
			sound = "ATA2InstallWheelChain",
			use = { 
				ATAProtectionWheelsChain = 1,
				BlowTorch = 4,
			},
			tools = { 
				bodylocation = "Base.WeldingMask", 
				primary = "Base.Wrench",
			},
			skills = {
				Mechanics = 2,
				MetalWelding = 3,
			},
			recipes = {carRecipe},
			requireInstalled = {"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"},
			time = timeLong, 
		},
		uninstall = {
			sound = "ATA2InstallWheelChain",
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
			result = {
				UnusableMetal=2,
			},
			time = timeMid,
		}
	}
}

-- Here you actually specify what goes on the car, based on what's in the armor script file.
-- Again, if it's not in the armor script file it won't work!

-- Roamer
NewCarTuningTable["Roamer"].parts["ATA2ProtectionWindowFrontLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionWindowRearLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionWindowRearRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionWindshield"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshield"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionWindshieldRear"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"])
NewCarTuningTable["Roamer"].parts["ATA2Bullbar"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2Bullbar"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionTrunk"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionHood"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionDoorFrontLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionDoorFrontRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionDoorRearLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionDoorRearRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"])
NewCarTuningTable["Roamer"].parts["ATA2InteractiveTrunkRoofRack"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2InteractiveTrunkRoofRack"])
NewCarTuningTable["Roamer"].parts["ATA2ProtectionWheels"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWheels"])

-- LongRoamer
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionWindowFrontLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionWindowMiddleLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleLeft"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionWindowMiddleRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowMiddleRight"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionWindshield"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshield"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionWindshieldRear"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"])
NewCarTuningTable["LongRoamer"].parts["ATA2Bullbar"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2Bullbar"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionDoorsRear"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorsRear"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionHood"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionHood"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionDoorFrontLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionDoorFrontRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionDoorMiddleLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleLeft"])
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionDoorMiddleRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorMiddleRight"])
NewCarTuningTable["LongRoamer"].parts["ATA2InteractiveTrunkRoofRack"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2InteractiveTrunkRoofRack"])
NewCarTuningTable["LongRoamer"].parts["ATA2InteractiveTrunkRoofRack"].Default.containerCapacity = 80
NewCarTuningTable["LongRoamer"].parts["ATA2ProtectionWheels"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWheels"])

-- RoamerSheriff
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionWindowFrontLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionWindowRearLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionWindowRearRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionWindshield"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshield"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionWindshieldRear"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionTrunk"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionHood"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionHood"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionHood"].Light.protection = {"HeadlightLeft", "HeadlightRight", "EngineDoor"}
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionHood"].Heavy.protection = {"HeadlightLeft", "HeadlightRight", "EngineDoor"}
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionDoorFrontLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionDoorFrontRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionDoorRearLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionDoorRearRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2InteractiveTrunkRoofRack"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2InteractiveTrunkRoofRack"])
NewCarTuningTable["RoamerSheriff"].parts["ATA2ProtectionWheels"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWheels"])

-- RoamerFire
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionWindowFrontLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowFrontRight"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionWindowRearLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearLeft"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionWindowRearRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindowRearRight"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionWindshield"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshield"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionWindshieldRear"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWindshieldRear"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionTrunk"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionHood"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionHood"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionHood"].Light.protection = {"HeadlightLeft", "HeadlightRight", "EngineDoor"}
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionHood"].Heavy.protection = {"HeadlightLeft", "HeadlightRight", "EngineDoor"}
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionDoorFrontLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionDoorFrontRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorFrontRight"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionDoorRearLeft"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearLeft"])
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionDoorRearRight"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionDoorRearRight"])
NewCarTuningTable["RoamerFire"].parts["ATA2InteractiveTrunkRoofRack"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2InteractiveTrunkRoofRack"])
NewCarTuningTable["RoamerFire"].parts["ATA2InteractiveTrunkRoofRack"].Default.containerCapacity = 80
NewCarTuningTable["RoamerFire"].parts["ATA2ProtectionWheels"] = copy(NewCarTuningTable["TemplateRoamer"].parts["ATA2ProtectionWheels"])

NewCarTuningTable["RoamerI6"] = NewCarTuningTable["Roamer"]
NewCarTuningTable["RoamerFossoil"] = NewCarTuningTable["Roamer"]
NewCarTuningTable["RoamerMcCoy"] = NewCarTuningTable["Roamer"]
NewCarTuningTable["RoamerI64WD"] = NewCarTuningTable["Roamer"]
NewCarTuningTable["RoamerRanger"] = NewCarTuningTable["RoamerSheriff"]
NewCarTuningTable["RoamerV8"] = NewCarTuningTable["Roamer"]
NewCarTuningTable["RoamerV84WD"] = NewCarTuningTable["Roamer"]
NewCarTuningTable["RoamerXT"] = NewCarTuningTable["Roamer"]
NewCarTuningTable["RoamerXT4WD"] = NewCarTuningTable["Roamer"]
NewCarTuningTable["RoamerLXT"] = NewCarTuningTable["LongRoamer"]
NewCarTuningTable["RoamerLXT4WD"] = NewCarTuningTable["LongRoamer"]
NewCarTuningTable["RoamerRS"] = NewCarTuningTable["Roamer"]
NewCarTuningTable["RoamerRSLXT"] = NewCarTuningTable["LongRoamer"]

ATA2Tuning_AddNewCars(NewCarTuningTable)
