local distributionTable = VehicleDistributions[1]

-- First, for the military truck, we need to outright make its loot pool (pool taken from Filibuster's distribution for his Humvees, credits to him)

VehicleDistributions.MilitaryGearTrunk = {
    rolls = 8,
    items ={
        "Bag_ALICEpack_Army", 3,
        "Vest_BulletArmy", 3,
        "556Clip", 3,
        "556Clip", 3,
        "556Clip", 3,
        "556Box", 3,
        "556Box", 3,
        "556Box", 3,
        "556Box", 3,
        "556Box", 3,
        "Hat_Army", 3,
        "Hat_GasMask", 3,
        "Hat_GasMask", 3,
        "Hat_GasMask", 3,
        "AssaultRifle", 2,
        "AssaultRifle", 2,
        "Pistol", 3,
        "Pistol", 3,
        "Pistol", 3,
        "9mmClip", 3,
        "9mmClip", 3,
        "9mmClip", 3,
        "Bullets9mm", 3,
        "Bullets9mm", 3,
        "Bullets9mm", 3,
        "Bullets9mm", 3,
        "Bullets9mm", 3,
		"HolsterSimple", 3,
        "Trousers_CamoGreen", 1,
        "Shirt_CamoGreen", 1,
        "Jacket_ArmyCamoGreen", 1,
        "Hat_BonnieHat_CamoGreen", 1,
        "Hat_PeakedCapArmy", 0.5,
        "Hat_BeretArmy", 0.5,
        "Jacket_CoatArmy", 0.5,
        "Shoes_ArmyBoots", 1,
        "Shirt_CamoGreen", 1,
        "Radio.WalkieTalkie5", 3,
        "HuntingKnife", 3,
        "FirstAidKit", 3,
		"EmptyPetrolCan", 3,
		"PetrolCan", 2,
		"x2Scope", 0.7,
		"x4Scope", 0.5,
		"x8Scope", 0.3,
    }
}

VehicleDistributions.MilitarySeat = {
    rolls = 2,
    items ={
        "556Clip", 3,
        "Hat_Army", 3,
        "Hat_GasMask", 3,
        "Pistol", 3,
        "9mmClip", 3,
		"HolsterSimple", 3,
        "Jacket_ArmyCamoGreen", 3,
        "Hat_BonnieHat_CamoGreen", 3,
        "Hat_PeakedCapArmy", 1,
        "Hat_BeretArmy", 1,
        "Jacket_CoatArmy", 1,
        "Radio.WalkieTalkie5", 3,
        "HuntingKnife", 3,
		"Cigarettes", 7,
        "Bag_ALICEpack_Army", 3,
        "Vest_BulletArmy", 3,
	
    }
}

VehicleDistributions.MilitaryGloveBox = {
    rolls = 5,
    items ={
        "556Clip", 3,
        "Hat_Army", 3,
        "Hat_GasMask", 3,
        "Pistol", 3,
        "9mmClip", 3,
		"HolsterSimple", 3,
        "Hat_BonnieHat_CamoGreen", 3,
        "Hat_PeakedCapArmy", 1,
        "Hat_BeretArmy", 1,
        "Radio.WalkieTalkie5", 3,
        "HuntingKnife", 3,
		"Cigarettes", 7,	
    }
}

VehicleDistributions.Military = {
    TruckBed = VehicleDistributions.MilitaryGearTrunk;
    TruckbedOpen = VehicleDistributions.MilitaryGearTrunk;

    SeatFrontRight = VehicleDistributions.MilitarySeat;
    GloveBox = VehicleDistributions.MilitaryGloveBox;

}

-- Everything afterwards here is intended for all the unique company trucks, and how their loot is spread amongst them.
-- First is the GigaMart truck

VehicleDistributions.GigaMartTruckBed = {
	rolls = 10,
	items = {
        "GroceryBag1", 100,
        "GroceryBag1", 50,
        "GroceryBag2", 8,
        "GroceryBag3", 8,
        "GroceryBag4", 8,
        "GroceryBag5", 8,
        "DuctTape", 8,
        "EmptyPetrolCan", 10,
        "EmptySandbag", 4,
        "Garbagebag", 6,
        "Plasticbag", 10,
        "PopBottleEmpty", 4,
        "PopEmpty", 4,
        "RubberBand", 6,
        "Tarp", 10,
        "Tissue", 10,
        "ToiletPaper", 6,
        "Tote", 6,
        "Twine", 10,
        "WaterBottleEmpty", 4,
        "WhiskeyEmpty", 1,
	},
    junk = {
        rolls = 2,
        items = {
            "BaseballBat", 1,
            "FirstAidKit", 4,
            "Jack", 2,
            "LugWrench", 8,
            "Screwdriver", 10,
            "TirePump", 8,
            "Wrench", 8,
        }
    }
}

VehicleDistributions.GigaMart = {
	
	TruckBed = VehicleDistributions.GigaMartTruckBed;
	TruckBedOpen = VehicleDistributions.GigaMartTruckBed;
	GloveBox = VehicleDistributions.GloveBox;
}

-- Second is the Mass-GenFac truck, not to be confused with the regular van distro since it spawns more loot in the box trucks
-- Fun fact: The B41 Lectromax trucks just use the Mass-GenFac loot distros for some reason, isn't that fun?

VehicleDistributions.MassGenFacTruckGloveBox = {
	rolls = 4,
        items = {
        "AlcoholWipes", 8,
        "Bandage", 4,
        "Bandaid", 10,
        "Battery", 10,
        "BluePen", 8,
        "Cigarettes", 8,
        "Cologne", 4,
        "Comb", 4,
        "CreditCard", 4,
        "Disc_Retail", 2,
        "DuctTape", 2,
        "Earbuds", 2,
        "Eraser", 6,
        "Lighter", 4,
        "Lipstick", 6,
        "Magazine", 10,
        "MakeupEyeshadow", 6,
        "MakeupFoundation", 6,
        "Matches", 8,
        "Mirror", 4,
        "Notebook", 10,
        "Paperclip", 4,
        "Pen", 8,
        "Pencil", 10,
        "Perfume", 4,
        "Razor", 4,
        "RedPen", 8,
        "RubberBand", 6,
        "Scotchtape", 8,
        "Tissue", 10,
        "Twine", 10,
    },
    junk = {
        rolls = 1,
        items = {
            "Camera", 0.03,
            "CameraDisposable", 0.05,
            "CameraExpensive", 0.001,
            "Glasses_Aviators", 0.05,
            "Glasses_SafetyGoggles", 20,
            "Glasses_Sun", 0.1,
            "Gloves_LeatherGloves", 20,
            "Gloves_LeatherGlovesBlack", 0.05,
            "HandTorch", 4,
            "HuntingKnife", 0.1,
            "LouisvilleMap1", 4,
            "LouisvilleMap2", 4,
            "LouisvilleMap3", 4,
            "LouisvilleMap4", 4,
            "LouisvilleMap5", 4,
            "LouisvilleMap6", 4,
            "LouisvilleMap7", 4,
            "LouisvilleMap8", 4,
            "LouisvilleMap9", 4,
            "MarchRidgeMap", 4,
            "MuldraughMap", 4,
            "Pistol", 0.8,
            "Pistol2", 0.6,
            "Radio.CDplayer", 2,
            "Radio.WalkieTalkie2", 2,
            "Radio.WalkieTalkie3", 1,
            "Revolver_Short", 0.8,
            "RiversideMap", 4,
            "RosewoodMap", 4,
            "ToiletPaper", 4,
            "Wallet", 4,
            "Wallet2", 4,
            "Wallet3", 4,
            "Wallet4", 4,
            "WestpointMap", 4,
            "WhiskeyFull", 0.5,
        }
    }
}

VehicleDistributions.MassGenFacTruckTruckBed = {
	rolls = 10,
        items = {
        "BallPeenHammer", 10,
        "BlowTorch", 10,
        "DuctTape", 8,
        "EmptyPetrolCan", 10,
        "EmptySandbag", 4,
        "Garbagebag", 6,
        "Glasses_SafetyGoggles", 10,
        "Hat_DustMask", 10,
        "Hat_DustMask", 10,
        "Hat_HardHat", 10,
        "MetalBar", 20,
        "MetalBar", 10,
        "MetalPipe", 20,
        "MetalPipe", 10,
        "Plasticbag", 10,
        "PopBottleEmpty", 4,
        "PopEmpty", 4,
        "PropaneTank", 10,
        "RubberBand", 6,
        "ScrapMetal", 20,
        "ScrapMetal", 10,
        "Screwdriver", 10,
        "SheetMetal", 20,
        "SheetMetal", 10,
        "SmallSheetMetal", 20,
        "SmallSheetMetal", 10,
        "Tarp", 10,
        "Tissue", 10,
        "ToiletPaper", 6,
        "Tote", 6,
        "Twine", 10,
        "Vest_Foreman", 1,
        "Vest_HighViz", 4,
        "WaterBottleEmpty", 4,
        "WeldingMask", 10,
        "WeldingRods", 20,
        "WhiskeyEmpty", 1,
        "Wire", 20,
        "Wire", 10,
    },
    junk = {
        rolls = 1,
        items = {
            "BaseballBat", 1,
            "CarBattery2", 4,
            "FirstAidKit", 4,
            "Jack", 2,
            "LugWrench", 8,
            "NormalTire2", 10,
            "PropaneTank", 50,
            "Screwdriver", 10,
            "TirePump", 8,
            "Wrench", 8,
        }
    }
}

VehicleDistributions.MassGenFacTruck = {
	TruckBed = VehicleDistributions.MassGenFacTruckTruckBed;
	GloveBox = VehicleDistributions.MassGenFacTruckGloveBox;
}

-- The box truck variant to the McCoy spawn pool, again just letting more stuff spawn inside for general import/export

VehicleDistributions.McCoyTruckGloveBox = {
    rolls = 4,
    items = {
        "AlcoholWipes", 8,
        "Bandage", 4,
        "Bandaid", 10,
        "Battery", 10,
        "BluePen", 8,
        "Cigarettes", 8,
        "Cologne", 4,
        "Comb", 4,
        "CreditCard", 4,
        "Disc_Retail", 2,
        "DuctTape", 8,
        "DuctTape", 8,
        "Earbuds", 2,
        "Eraser", 6,
        "Lighter", 4,
        "Lipstick", 6,
        "Magazine", 10,
        "MakeupEyeshadow", 6,
        "MakeupFoundation", 6,
        "Matches", 8,
        "Mirror", 4,
        "NailsBox", 10,
        "Notebook", 10,
        "Paperclip", 4,
        "Pen", 8,
        "Pencil", 10,
        "Perfume", 4,
        "Razor", 4,
        "RedPen", 8,
        "RubberBand", 6,
        "Scotchtape", 8,
        "ScrewsBox", 8,
        "Tissue", 10,
        "Twine", 10,
        "Woodglue", 8,
    },
    junk = {
        rolls = 1,
        items = {
            "Camera", 0.03,
            "CameraDisposable", 0.05,
            "CameraExpensive", 0.001,
            "Glasses_Aviators", 0.05,
            "Glasses_SafetyGoggles", 20,
            "Glasses_Sun", 0.1,
            "Gloves_LeatherGloves", 20,
            "Gloves_LeatherGlovesBlack", 0.05,
            "Hammer", 6,
            "HandTorch", 4,
            "Hat_DustMask", 20,
            "HuntingKnife", 0.1,
            "LouisvilleMap1", 4,
            "LouisvilleMap2", 4,
            "LouisvilleMap3", 4,
            "LouisvilleMap4", 4,
            "LouisvilleMap5", 4,
            "LouisvilleMap6", 4,
            "LouisvilleMap7", 4,
            "LouisvilleMap8", 4,
            "LouisvilleMap9", 4,
            "MarchRidgeMap", 4,
            "MuldraughMap", 4,
            "Pistol", 0.8,
            "Pistol2", 0.6,
            "Radio.CDplayer", 2,
            "Radio.WalkieTalkie2", 2,
            "Radio.WalkieTalkie3", 1,
            "Revolver_Short", 0.8,
            "RiversideMap", 4,
            "RosewoodMap", 4,
            "Screwdriver", 8,
            "ToiletPaper", 4,
            "Wallet", 4,
            "Wallet2", 4,
            "Wallet3", 4,
            "Wallet4", 4,
            "WestpointMap", 4,
            "WhiskeyFull", 0.5,
        }
    }
}

VehicleDistributions.McCoyTruckTruckBed = {
	rolls = 10,
        items = {
        "Axe", 4,
        "DuctTape", 8,
        "EmptyPetrolCan", 10,
        "EmptySandbag", 4,
        "Garbagebag", 6,
        "Glasses_SafetyGoggles", 10,
        "Gloves_LeatherGloves", 10,
        "Hat_DustMask", 10,
        "Hat_HardHat", 10,
        "Log", 50,
        "Log", 20,
        "Log", 20,
        "Log", 10,
        "Plasticbag", 10,
        "Rope", 10,
        "RubberBand", 6,
        "Saw", 8,
        "Tarp", 10,
        "Tissue", 10,
        "ToiletPaper", 6,
        "Tote", 6,
        "Twine", 10,
        "Vest_Foreman", 1,
        "Vest_HighViz", 4,
        "WoodAxe", 2,
    },
    junk = {
        rolls = 1,
        items = {
            "Axe", 20,
            "CarBattery2", 4,
            "FirstAidKit", 4,
            "Jack", 2,
            "LugWrench", 8,
            "NormalTire2", 10,
            "Screwdriver", 10,
            "TirePump", 8,
            "Wrench", 8,
        }
    }
}

VehicleDistributions.McCoyTruck = {
	TruckBed = VehicleDistributions.McCoyTruckTruckBed;
	TruckBedOpen = VehicleDistributions.McCoyTruckTruckBed;
	TrailerTrunk =  VehicleDistributions.McCoyTruckTruckBed;
	GloveBox = VehicleDistributions.McCoyTruckGloveBox;
}

-- And Knox Distillery, for all that good Kentucky Whiskey. Yum.

VehicleDistributions.KnoxDistilleryTruckGloveBox = {
    rolls = 4,
    items = {
        "AlcoholWipes", 8,
        "Bandage", 4,
        "Bandaid", 10,
        "Battery", 10,
        "BluePen", 8,
        "Cigarettes", 8,
        "Cologne", 4,
        "Comb", 4,
        "CreditCard", 4,
        "Disc_Retail", 2,
        "DuctTape", 2,
        "Earbuds", 2,
        "Eraser", 6,
        "Lighter", 4,
        "Lipstick", 6,
        "Magazine", 10,
        "MakeupEyeshadow", 6,
        "MakeupFoundation", 6,
        "Matches", 8,
        "Mirror", 4,
        "Notebook", 10,
        "Paperclip", 4,
        "Pen", 8,
        "Pencil", 10,
        "Perfume", 4,
        "Razor", 4,
        "RedPen", 8,
        "RubberBand", 6,
        "Scotchtape", 8,
        "Tissue", 10,
        "Twine", 10,
    },
    junk = {
        rolls = 1,
        items = {
            "Camera", 0.03,
            "CameraDisposable", 0.05,
            "CameraExpensive", 0.001,
            "Glasses_Aviators", 0.05,
            "Glasses_SafetyGoggles", 20,
            "Glasses_Sun", 0.1,
            "Gloves_LeatherGloves", 20,
            "Gloves_LeatherGlovesBlack", 0.05,
            "HandTorch", 4,
            "HuntingKnife", 0.1,
            "LouisvilleMap1", 4,
            "LouisvilleMap2", 4,
            "LouisvilleMap3", 4,
            "LouisvilleMap4", 4,
            "LouisvilleMap5", 4,
            "LouisvilleMap6", 4,
            "LouisvilleMap7", 4,
            "LouisvilleMap8", 4,
            "LouisvilleMap9", 4,
            "MarchRidgeMap", 4,
            "MuldraughMap", 4,
            "Pistol", 0.8,
            "Pistol2", 0.6,
            "Radio.CDplayer", 2,
            "Radio.WalkieTalkie2", 2,
            "Radio.WalkieTalkie3", 1,
            "Revolver_Short", 0.8,
            "RiversideMap", 4,
            "RosewoodMap", 4,
            "ToiletPaper", 4,
            "Wallet", 4,
            "Wallet2", 4,
            "Wallet3", 4,
            "Wallet4", 4,
            "WestpointMap", 4,
            "WhiskeyFull", 0.5,
        }
    }
}

VehicleDistributions.KnoxDistilleryTruckTruckBed = {
	rolls = 10,
        items = {
        "DuctTape", 8,
        "EmptyPetrolCan", 10,
        "EmptySandbag", 4,
        "Garbagebag", 6,
        "Plasticbag", 10,
        "PopBottleEmpty", 4,
        "PopEmpty", 4,
        "RubberBand", 6,
        "Tarp", 10,
        "Tissue", 10,
        "ToiletPaper", 6,
        "Tote", 6,
        "Twine", 10,
        "WaterBottleEmpty", 4,
        "WhiskeyFull", 100,
        "WhiskeyFull", 50,
        "WhiskeyFull", 20,
        "WhiskeyFull", 20,
        "WhiskeyFull", 10,
        "WhiskeyFull", 10,
    },
    junk = {
        rolls = 1,
        items = {
            "BaseballBat", 1,
            "CarBattery2", 4,
            "FirstAidKit", 4,
            "Jack", 2,
            "LugWrench", 8,
            "NormalTire2", 10,
            "Screwdriver", 10,
            "TirePump", 8,
            "Wrench", 8,
        }
    }
}

VehicleDistributions.KnoxDistilleryTruck = {
	TruckBed = VehicleDistributions.KnoxDistilleryTruckTruckBed;
	GloveBox = VehicleDistributions.KnoxDistilleryTruckGloveBox;
}

-- Next, we create all the unique truck loot tables, assigned accordingly below

local newVehicleDistribution = {

	FarmTruck = {
		Normal = VehicleDistributions.Farmer,
		Specific = { VehicleDistributions.Rancher, VehicleDistributions.Bandit, VehicleDistributions.Gardener },
	},
    
	FleetTruck = {
		Normal = VehicleDistributions.NormalHeavy,
		Specific = { VehicleDistributions.Carpenter, VehicleDistributions.Farmer, VehicleDistributions.Electrician, VehicleDistributions.MetalWelder, VehicleDistributions.Survivalist, VehicleDistributions.ConstructionWorker, VehicleDistributions.Painter, VehicleDistributions.Rancher, VehicleDistributions.Bandit, VehicleDistributions.Mason },
	},

	GigaMartTruck = {
		Normal = VehicleDistributions.GigaMart,
		Specific = {},
	},

	GenFacTruck = {
		Normal = VehicleDistributions.MassGenFacTruck,
		Specific = {},
	},

	KnoxDistilleryTruck = {
		Normal = VehicleDistributions.KnoxDistilleryTruck,
		Specific = {},
	},

	LectromaxTruck = {
		Normal = VehicleDistributions.Lectromax,
		Specific = {},
	},

	McCoyTruck = {
		Normal = VehicleDistributions.McCoyTruck,
		Specific = {},
	},

	Charro = {
		Normal = VehicleDistributions.NormalHeavy,
		Specific = { VehicleDistributions.Hunter, VehicleDistributions.Fisherman, VehicleDistributions.Survivalist, VehicleDistributions.Adventurer, VehicleDistributions.Bandit },
	},

	LTRV = {
		Normal = VehicleDistributions.Military,
		Specific = {},
	},
    
}

-- When that's all then, we parse all D-Series trucks either with one of the unique loot pools, or the generic vehicle pools the game already has.

distributionTable["PreCharro"] = newVehicleDistribution["Charro"]
distributionTable["PostCharro"] = newVehicleDistribution["Charro"]
distributionTable["SportCharro"] = distributionTable["CarNormal"]
distributionTable["RangerCharro"] = distributionTable["PickUpTruckLights0"]
distributionTable["FarmhandD15"] = newVehicleDistribution["FarmTruck"]
distributionTable["PreKentarch"] = distributionTable["CarNormal"]
distributionTable["FleetD15_SCEB"] = newVehicleDistribution["FleetTruck"]
distributionTable["FleetD15_ECSB"] = newVehicleDistribution["FleetTruck"]
distributionTable["FossoilD15_SCEB"] = distributionTable["PickUpTruckLights1"]
distributionTable["FossoilD15_ECSB"] = distributionTable["PickUpTruckLights1"]
distributionTable["McCoyD15_SCEB"] = distributionTable["PickUpTruckMccoy"]
distributionTable["McCoyD15_ECSB"] = distributionTable["PickUpTruckMccoy"]
distributionTable["PreD15_SCSB"] = distributionTable["PickUpTruck"]
distributionTable["PostD15_SCSB"] = distributionTable["PickUpTruck"]
distributionTable["SportD15_SCSB"] = distributionTable["PickUpTruck"]
distributionTable["PreD15_4WDSCSB"] = distributionTable["PickUpTruck"]
distributionTable["PostD15_4WDSCSB"] = distributionTable["PickUpTruck"]
distributionTable["PreD15_SCEB"] = distributionTable["PickUpTruck"]
distributionTable["FireD15_SCEB"] = distributionTable["PickUpVanLightsFire"]
distributionTable["PostD15_SCEB"] = distributionTable["PickUpTruck"]
distributionTable["PreD15_ECSB"] = distributionTable["PickUpTruck"]
distributionTable["PostD15_ECSB"] = distributionTable["PickUpTruck"]
distributionTable["PostD15_4WDECSB"] = distributionTable["PickUpTruck"]
distributionTable["PreD15_ECEB"] = distributionTable["PickUpTruck"]
distributionTable["PostD15_ECEB"] = distributionTable["PickUpTruck"]
distributionTable["PreD15_CCEB"] = distributionTable["PickUpTruck"]
distributionTable["PostD15_CCEB"] = distributionTable["PickUpTruck"]
distributionTable["PostD15_4WDCCEB"] = distributionTable["PickUpTruck"]
distributionTable["FleetD25_SCEB"] = newVehicleDistribution["FleetTruck"]
distributionTable["McCoyD25_SCEB"] = distributionTable["PickUpTruckMccoy"]
distributionTable["PreD25_SCEB"] = distributionTable["PickUpTruck"]
distributionTable["PostD25_SCEB"] = distributionTable["PickUpTruck"]
distributionTable["PreD25_ECEB"] = distributionTable["PickUpTruck"]
distributionTable["PostD25_ECEB"] = distributionTable["PickUpTruck"]
distributionTable["PreD25_4WDECEB"] = distributionTable["PickUpTruck"]
distributionTable["PostD25_4WDECEB"] = distributionTable["PickUpTruck"]
distributionTable["PreD25_CCEB"] = distributionTable["PickUpTruck"]
distributionTable["PostD25_CCEB"] = distributionTable["PickUpTruck"]
distributionTable["PostDuallyD25_CCEB"] = distributionTable["PickUpTruck"]
distributionTable["PostKentarch"] = distributionTable["CarNormal"]
distributionTable["PreLTRV"] = newVehicleDistribution["LTRV"]
distributionTable["PostLTRV"] = newVehicleDistribution["LTRV"]
distributionTable["FleetDuallyD35_SCEB"] = newVehicleDistribution["FleetTruck"]
distributionTable["McCoyDuallyD35_SCEB"] = distributionTable["PickUpTruckMccoy"]
distributionTable["PostD35_SCEB"] = newVehicleDistribution["FleetTruck"]
distributionTable["PostD35_ECEB"] = newVehicleDistribution["FleetTruck"]
distributionTable["PreDuallyD35_ECEB"] = newVehicleDistribution["FleetTruck"]
distributionTable["PostDuallyD35_ECEB"] = newVehicleDistribution["FleetTruck"]
distributionTable["RancherDuallyD35_ECEB"] = newVehicleDistribution["FleetTruck"]
distributionTable["FleetBoxTruckD45"] = distributionTable["StepVan"]
distributionTable["GenFacBoxTruckD45"] = newVehicleDistribution["GenFacTruck"]
distributionTable["GigaMartBoxTruckD45"] = newVehicleDistribution["GigaMartTruck"]
distributionTable["KnoxDistilleryBoxTruckD45"] = newVehicleDistribution["KnoxDistilleryTruck"]
distributionTable["LectromaxBoxTruckD45"] = newVehicleDistribution["GenFacTruck"]
distributionTable["McCoyBoxTruckD45"] = newVehicleDistribution["McCoyTruck"]
