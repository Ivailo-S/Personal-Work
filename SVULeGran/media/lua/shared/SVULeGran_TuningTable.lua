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
NewCarTuningTable["TemplateLeGran"] = {
	addPartsFromVehicleScript = "",
	parts = {}
}
	NewCarTuningTable["LeGran"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["LeGranWagon"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["LeGranTaxi"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}
	NewCarTuningTable["LeGranUndercover"] = {
		addPartsFromVehicleScript = "",
		parts = {}
	}

-- A template of sorts to streamline code. DO NOT EDIT!!!
-- TemplateLeGran
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontLeft"] = {
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

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"].Light.protection = {"WindowFrontRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"].Light.install.requireInstalled = {"WindowFrontRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"].Light.install.area = "TireFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"].Light.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"].Light.protection = {"WindowRearLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"].Light.install.requireInstalled = {"WindowRearLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"].Light.install.area = "TireRearLeft"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"].Light.uninstall.area = "TireRearLeft"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"].Light.protection = {"WindowRearRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"].Light.install.requireInstalled = {"WindowRearRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"].Light.install.area = "TireRearRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"].Light.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"].Heavy.protection = {"WindowFrontRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"].Heavy.install.requireInstalled = {"WindowFrontRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"].Heavy.disableOpenWindowFromSeat = "SeatFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"].Heavy.protection = {"WindowRearLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"].Heavy.install.requireInstalled = {"WindowRearLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"].Heavy.disableOpenWindowFromSeat = "SeatRearLeft"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"].Heavy.install.area = "TireRearLeft"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"].Heavy.uninstall.area = "TireRearLeft"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"].Heavy.protection = {"WindowRearRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"].Heavy.install.requireInstalled = {"WindowRearRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"].Heavy.disableOpenWindowFromSeat = "SeatRearRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"].Heavy.install.area = "TireRearRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"].Heavy.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleLeft"].Light.protection = {"WindowMiddleLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleLeft"].Light.install.requireInstalled = {"WindowMiddleLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.install.area = "TireFrontLeft"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.uninstall.area = "TireFrontLeft"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleRight"].Light.protection = {"WindowMiddleRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleRight"].Light.install.requireInstalled = {"WindowMiddleRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.protection = {"WindowMiddleLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.install.requireInstalled = {"WindowMiddleLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.disableOpenWindowFromSeat = {"SeatMiddleLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.install.area = "TireFrontLeft"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleLeft"].Heavy.uninstall.area = "TireFrontLeft"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.protection = {"WindowMiddleRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.install.requireInstalled = {"WindowMiddleRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.disableOpenWindowFromSeat = {"SeatMiddleRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowMiddleRight"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshield"] = {
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

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshield"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"].Light.protection = {"WindshieldRear"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"].Light.install.requireInstalled = {"WindshieldRear"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"].Light.install.area = "TireRearRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"].Light.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"].Heavy.protection = {"WindshieldRear"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"].Heavy.install.requireInstalled = {"WindshieldRear"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"].Heavy.install.area = "TireRearRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"].Heavy.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2Bullbar"] = {
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

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionTrunk"] = {
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

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorsRear"] = {
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

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionHood"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionHood"].Light.protection = {"EngineDoor"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionHood"].Light.install.requireInstalled = {"EngineDoor"}

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionHood"].Heavy.protection = {"EngineDoor"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionHood"].Heavy.install.requireInstalled = {"EngineDoor"}

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontLeft"] = {
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

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"].Light.protection = {"DoorFrontRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"].Light.install.requireInstalled = {"DoorFrontRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"].Light.install.area = "TireFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"].Light.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"].Light.protection = {"DoorRearLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"].Light.install.requireInstalled = {"DoorRearLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"].Light.install.area = "TireRearLeft"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"].Light.uninstall.area = "TireRearLeft"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"].Light.protection = {"DoorRearRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"].Light.install.requireInstalled = {"DoorRearRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"].Light.install.area = "TireRearRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"].Light.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"].Heavy.protection = {"DoorFrontRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"].Heavy.install.requireInstalled = {"DoorFrontRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"].Heavy.protection = {"DoorRearLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"].Heavy.install.requireInstalled = {"DoorRearLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"].Heavy.install.area = "TireRearLeft"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"].Heavy.uninstall.area = "TireRearLeft"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"].Heavy.protection = {"DoorRearRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"].Heavy.install.requireInstalled = {"DoorRearRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"].Heavy.install.area = "TireRearRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"].Heavy.uninstall.area = "TireRearRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleLeft"].Light.protection = {"DoorMiddleLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleLeft"].Light.install.requireInstalled = {"DoorMiddleLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleLeft"].Light.install.area = "TireFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleLeft"].Light.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleRight"].Light.protection = {"DoorMiddleRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleRight"].Light.install.requireInstalled = {"DoorMiddleRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleRight"].Light.install.area = "TireFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleRight"].Light.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.protection = {"DoorMiddleLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.install.requireInstalled = {"DoorMiddleLeft"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleLeft"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.protection = {"DoorMiddleRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.install.requireInstalled = {"DoorMiddleRight"}
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.install.area = "TireFrontRight"
NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorMiddleRight"].Heavy.uninstall.area = "TireFrontRight"

NewCarTuningTable["TemplateLeGran"].parts["ATA2InteractiveTrunkRoofRack"] = {
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

NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWheels"] = {
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

-- LeGran
NewCarTuningTable["LeGran"].parts["ATA2ProtectionWindowFrontLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionWindowRearLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionWindowRearRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionWindshield"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshield"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionWindshieldRear"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"])
NewCarTuningTable["LeGran"].parts["ATA2Bullbar"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2Bullbar"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionTrunk"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionHood"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionDoorFrontLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionDoorFrontRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionDoorRearLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionDoorRearRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"])
NewCarTuningTable["LeGran"].parts["ATA2InteractiveTrunkRoofRack"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2InteractiveTrunkRoofRack"])
NewCarTuningTable["LeGran"].parts["ATA2ProtectionWheels"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWheels"])

-- LeGranWagon
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionWindowFrontLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionWindowRearLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionWindowRearRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionWindshield"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshield"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionWindshieldRear"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"])
NewCarTuningTable["LeGranWagon"].parts["ATA2Bullbar"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2Bullbar"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionTrunk"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionHood"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionDoorFrontLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionDoorFrontRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionDoorRearLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"])
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionDoorRearRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"])
NewCarTuningTable["LeGranWagon"].parts["ATA2InteractiveTrunkRoofRack"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2InteractiveTrunkRoofRack"])
NewCarTuningTable["LeGranWagon"].parts["ATA2InteractiveTrunkRoofRack"].Default.containerCapacity = 70
NewCarTuningTable["LeGranWagon"].parts["ATA2ProtectionWheels"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWheels"])

-- LeGranTaxi
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionWindowFrontLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionWindowRearLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionWindowRearRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionWindshield"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshield"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionWindshieldRear"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionTrunk"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionHood"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionDoorFrontLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionDoorFrontRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionDoorRearLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionDoorRearRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"])
NewCarTuningTable["LeGranTaxi"].parts["ATA2ProtectionWheels"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWheels"])

-- LeGranUndercover
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionWindowFrontLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontLeft"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionWindowFrontRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowFrontRight"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionWindowRearLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearLeft"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionWindowRearRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindowRearRight"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionWindshield"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshield"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionWindshieldRear"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWindshieldRear"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionTrunk"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionHood"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionTrunk"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionDoorFrontLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontLeft"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionDoorFrontRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorFrontRight"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionDoorRearLeft"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearLeft"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionDoorRearRight"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionDoorRearRight"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2InteractiveTrunkRoofRack"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2InteractiveTrunkRoofRack"])
NewCarTuningTable["LeGranUndercover"].parts["ATA2ProtectionWheels"] = copy(NewCarTuningTable["TemplateLeGran"].parts["ATA2ProtectionWheels"])

NewCarTuningTable["PreLeGranReg"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PreLeGranS"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PreLeGranSV6"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PreLeGranSE"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PreLeGranSEV6"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["LeGranLuxe"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PreLeGranSWagon"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["PreLeGranSV6Wagon"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["PreLeGranSEWagon"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["PreLeGranSEV6Wagon"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["LeGranLuxeWagon"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["PreLeGranSport"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PreLeGranSportV6"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PreLeGranTaxi"] = NewCarTuningTable["LeGranTaxi"]
NewCarTuningTable["PreLeGranTaxiWagon"] = NewCarTuningTable["LeGranTaxi"]
NewCarTuningTable["PostLeGranReg"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PostLeGranS"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PostLeGranSV6"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PostLeGranSE"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PostLeGranSEV6"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PostLeGranRegWagon"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["PostLeGranSWagon"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["PostLeGranSV6Wagon"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["PostLeGranSEWagon"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["PostLeGranSEV6Wagon"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["LeGranTowingPackage"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["LeGranCampagne"] = NewCarTuningTable["LeGranWagon"]
NewCarTuningTable["PostLeGranSport"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PostLeGranSportV6"] = NewCarTuningTable["LeGran"]
NewCarTuningTable["PostLeGranTaxi"] = NewCarTuningTable["LeGranTaxi"]
NewCarTuningTable["PostLeGranTaxiWagon"] = NewCarTuningTable["LeGranTaxi"]
NewCarTuningTable["LeGranPolice"] = NewCarTuningTable["LeGranTaxi"]
NewCarTuningTable["LeGranFire"] = NewCarTuningTable["LeGranTaxi"]
NewCarTuningTable["LeGranUndercover"] = NewCarTuningTable["LeGranUndercover"]
NewCarTuningTable["LeGranRally"] = NewCarTuningTable["LeGran"]

ATA2Tuning_AddNewCars(NewCarTuningTable)
