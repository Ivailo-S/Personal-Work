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
		"BookCooking1", 2,
		"BookCooking2", 1,
		"BookCooking3", 0.5,
		"BookCooking4", 0.1,
		"BookCooking5", 0.05,
		"CookingMag1", 0.5,
		"CookingMag2", 0.5,
		"CookingMag3", 0.5,
		"CookingMag4", 0.5,
		"CookingMag5", 0.5,
		"CookingMag6", 0.5,
		"Cooler_Beer", 8,
		"Cooler_Meat", 8,
		"Cooler_Soda", 8,
		"GroceryBag1", 100,
		"GroceryBag2", 50,
		"GroceryBag3", 25,
		"GroceryBag4", 10,
		"GroceryBag5", 5,
	},
	junk = ClutterTables.TrunkJunk,
}

VehicleDistributions.GigaMartSeatFront = {
	rolls = 1,
	items = {
		"BookCooking1", 2,
		"BookCooking2", 1,
		"BookCooking3", 0.5,
		"BookCooking4", 0.1,
		"BookCooking5", 0.05,
		"CookingMag1", 0.5,
		"CookingMag2", 0.5,
		"CookingMag3", 0.5,
		"CookingMag4", 0.5,
		"CookingMag5", 0.5,
		"CookingMag6", 0.5,
		"GroceryBag1", 50,
		"GroceryBag2", 25,
		"GroceryBag3", 10,
		"GroceryBag4", 5,
		"GroceryBag5", 5,
	},
	junk = ClutterTables.SeatFrontJunk,
}

VehicleDistributions.GigaMart = {
	
	TruckBed = VehicleDistributions.GigaMartTruckBed;
	TruckBedOpen = VehicleDistributions.GigaMartTruckBed;
	
	GloveBox = VehicleDistributions.GloveBox;
	
	SeatFrontLeft = VehicleDistributions.DriverSeat;
	SeatFrontRight = VehicleDistributions.GigaMartSeatFront;
}

-- Second is the Mass-GenFac truck, not to be confused with the regular van distro since it spawns more loot in the box trucks

VehicleDistributions.MassGenFacTruckGloveBox = {
	rolls = 1,
	items = {
		"BallPeenHammer", 6,
		"BlowTorch", 8,
		"BookFirstAid1", 0.5,
		"BookMaintenance1", 2,
		"BookMaintenance2", 1,
		"BookMaintenance3", 0.5,
		"BookMaintenance4", 0.1,
		"BookMaintenance5", 0.05,
		"BookMetalWelding1", 2,
		"BookMetalWelding2", 1,
		"BookMetalWelding3", 0.5,
		"BookMetalWelding4", 0.1,
		"BookMetalWelding5", 0.05,
		"Calipers", 8,
		"Clipboard", 10,
		"DrawPlate", 8,
		"ElbowPad_Left_Workman", 1,
		"File", 8,
		"FlashLight_AngleHead", 1,
		"Flask", 0.5,
		"Glasses_OldWeldingGoggles", 0.1,
		"Glasses_SafetyGoggles", 10,
		"Gloves_LeatherGloves", 10,
		"Hat_Bandana", 1,
		"Hat_BandanaTINT", 1,
		"Hat_BuildersRespirator", 2,
		"Hat_DustMask", 10,
		"Hat_EarMuff_Protectors", 10,
		"Hat_HardHat", 10,
		"HottieZ", 1,
		"Kneepad_Left_Workman", 4,
		"Lunchbag", 4,
		"Lunchbox", 2,
		"Lunchbox2", 0.01,
		"MarkerBlack", 4,
		"MeasuringTape", 10,
		"MetalworkingChisel", 8,
		"MetalworkingPliers", 1,
		"MetalworkingPunch", 8,
		"MetalworkMag1", 2,
		"MetalworkMag2", 2,
		"MetalworkMag3", 2,
		"MetalworkMag4", 2,
		"NutsBolts", 10,
		"Paperback", 4,
		"Paperwork", 10,
		"Pliers", 8,
		"RespiratorFilters", 2,
		"RippedSheets", 10,
		"RippedSheetsDirty", 10,
		"SmallFileSet", 8,
		"SmallPunchSet", 8,
		"SmallSaw", 8,
		"Tsquare", 1,
		"Twine", 10,
		"ViseGrips", 4,
		"Wire", 10,
	},
	junk = ClutterTables.GloveBoxWorkJunk,
}

VehicleDistributions.MassGenFacTruckTruckBed = {
	rolls = 10,
	items = {
		"BallPeenHammer", 10,
		"BlowTorch", 10,
		"BookMaintenance1", 2,
		"BookMaintenance2", 1,
		"BookMaintenance3", 0.5,
		"BookMaintenance4", 0.1,
		"BookMaintenance5", 0.05,
		"BookMetalWelding1", 2,
		"BookMetalWelding2", 1,
		"BookMetalWelding3", 0.5,
		"BookMetalWelding4", 0.1,
		"BookMetalWelding5", 0.05,
		"Calipers", 8,
		"CarBatteryCharger", 6,
		"CeramicCrucible", 10,
		"CrudeBenchVise", 1,
		"DrawPlate", 8,
		"File", 8,
		"FlashLight_AngleHead", 1,
		"Glasses_SafetyGoggles", 10,
		"Hat_BuildersRespirator", 2,
		"Hat_DustMask", 10,
		"Hat_EarMuff_Protectors", 10,
		"Hat_HardHat", 10,
		"IronBar", 4,
		"IronBarHalf", 6,
		"IronPiece", 10,
		"IronBarQuarter", 8,
		"MeasuringTape", 10,
		"MetalBar", 10,
		"MetalPipe", 10,
		"MetalworkingChisel", 8,
		"MetalworkingPliers", 1,
		"MetalworkingPunch", 8,
		"Mov_ElectricBlowerForge", 1,
		"Mov_LightConstruction", 4,
		"NutsBolts", 10,
		"Pliers", 8,
		"PowerBar", 10,
		"PropaneTank", 2,
		"RespiratorFilters", 2,
		"RippedSheets", 10,
		"RippedSheetsDirty", 10,
		"RubberHose", 10,
		"SheetMetal", 10,
		"Sledgehammer", 0.5,
		"SmallFileSet", 8,
		"SmallPunchSet", 8,
		"SmallSaw", 8,
		"SmallSheetMetal", 10,
		"SteelBar", 4,
		"SteelBarHalf", 6,
		"SteelPiece", 10,
		"SteelBarQuarter", 8,
		"Tongs", 10,
		"Twine", 10,
		"Vest_Foreman", 1,
		"Vest_HighViz", 4,
		"ViseGrips", 4,
		"WeldingMask", 10,
		"WeldingRods", 20,
		"WeldingRods", 10,
		"Wire", 20,
		"Wire", 10,
	},
	junk = ClutterTables.TrunkJunk,
}

VehicleDistributions.MassGenFacTruckSeatFront = {
	rolls = 1,
	items = {
		"BallPeenHammer", 10,
		"BlowTorch", 10,
		"BookMaintenance1", 2,
		"BookMaintenance2", 1,
		"BookMaintenance3", 0.5,
		"BookMaintenance4", 0.1,
		"BookMaintenance5", 0.05,
		"BookMetalWelding1", 2,
		"BookMetalWelding2", 1,
		"BookMetalWelding3", 0.5,
		"BookMetalWelding4", 0.1,
		"BookMetalWelding5", 0.05,
		"Calipers", 8,
		"DrawPlate", 8,
		"ElbowPad_Left_Workman", 1,
		"File", 8,
		"FlashLight_AngleHead", 1,
		"Glasses_OldWeldingGoggles", 0.1,
		"Glasses_SafetyGoggles", 10,
		"Hat_BaseballCap_MassGenfac", 20,
		"Hat_BuildersRespirator", 2,
		"Hat_DustMask", 10,
		"Hat_EarMuff_Protectors", 10,
		"Hat_HardHat", 10,
		"HottieZ", 1,
		"Kneepad_Left_Workman", 4,
		"MarkerBlack", 4,
		"MeasuringTape", 10,
		"MetalworkingChisel", 8,
		"MetalworkingPliers", 1,
		"MetalworkingPunch", 8,
		"NutsBolts", 10,
		"Pliers", 8,
		"RespiratorFilters", 2,
		"RippedSheets", 10,
		"RippedSheetsDirty", 10,
		"Sledgehammer", 0.5,
		"SmallFileSet", 8,
		"SmallPunchSet", 8,
		"SmallSaw", 8,
		"TVMagazine", 1,
		"Twine", 10,
		"Vest_Foreman", 1,
		"Vest_HighViz", 4,
		"ViseGrips", 4,
		"WeldingMask", 10,
		"WeldingRods", 10,
		"Wire", 10,
	},
	junk = ClutterTables.SeatFrontJunk,
}

VehicleDistributions.MassGenFacTruck = {
	TruckBed = VehicleDistributions.MassGenFacTruckTruckBed;
	
	GloveBox = VehicleDistributions.MassGenFacTruckGloveBox;
	
	SeatFrontLeft = VehicleDistributions.DriverSeat;
	SeatFrontRight = VehicleDistributions.MassGenFacTruckSeatFront;
}

-- Third is Lectromax Manufacturing, just the Electrician loot table pretty much

VehicleDistributions.LectromaxGloveBox = {
	rolls = 1,
	items = {
		"Bag_ProtectiveCaseSmall_Electronics", 1,
		"BookElectrician1", 2,
		"BookElectrician2", 1,
		"BookElectrician3", 0.5,
		"BookElectrician4", 0.1,
		"BookElectrician5", 0.05,
		"BookFirstAid1", 0.5,
		"Clipboard", 10,
		"ElbowPad_Left_Workman", 1,
		"ElectricWire", 10,
		"ElectronicsMag1", 2,
		"ElectronicsMag2", 2,
		"ElectronicsMag3", 2,
		"ElectronicsMag4", 1,
		"ElectronicsMag5", 2,
		"ElectronicsScrap", 10,
		"EngineerMagazine1", 2,
		"EngineerMagazine2", 2,
		"FirstAidKit", 1,
		"FlashLight_AngleHead", 1,
		"Flask", 0.5,
		"Glasses_SafetyGoggles", 10,
		"Gloves_LeatherGloves", 10,
		"GraphPaper", 1,
		"Hat_Bandana", 1,
		"Hat_BandanaTINT", 1,
		"Hat_BuildersRespirator", 2,
		"Hat_DustMask", 10,
		"Hat_EarMuff_Protectors", 10,
		"Hat_HardHat", 10,
		"Kneepad_Left_Workman", 4,
		"Lunchbag", 4,
		"Lunchbox", 2,
		"Lunchbox2", 0.01,
		"Magazine_Tech", 10,
		"MarkerBlack", 4,
		"MeasuringTape", 10,
		"Paperback", 4,
		"Paperwork", 20,
		"Paperwork", 10,
		"Pliers", 8,
		"RadioMag1", 3,
		"RadioMag2", 2,
		"RadioMag3", 1,
		"RespiratorFilters", 2,
		"RippedSheets", 10,
		"RippedSheetsDirty", 10,
		"Tsquare", 1,
		"Twine", 10,
		"ViseGrips", 4,
		"Vest_HighViz", 4,
	},
	junk = ClutterTables.GloveBoxWorkJunk,
}

VehicleDistributions.LectromaxTruckBed = {
	rolls = 10,
	items = {
		"Aluminum", 8,
		"Amplifier", 8,
		"Bag_ProtectiveCaseSmall_Electronics", 1,
		"BoltCutters", 1,
		"BookElectrician1", 2,
		"BookElectrician2", 1,
		"BookElectrician3", 0.5,
		"BookElectrician4", 0.1,
		"BookElectrician5", 0.05,
		"ElectricWire", 20,
		"ElectricWire", 10,
		"ElectronicsMag1", 2,
		"ElectronicsMag2", 2,
		"ElectronicsMag3", 2,
		"ElectronicsMag4", 4,
		"ElectronicsMag5", 2,
		"ElectronicsScrap", 20,
		"ElectronicsScrap", 10,
		"EngineerMagazine1", 2,
		"EngineerMagazine2", 2,
		"FlashLight_AngleHead", 1,
		"Generator", 0.1,
		"Hat_BuildersRespirator", 2,
		"Hat_DustMask", 10,
		"Hat_EarMuff_Protectors", 10,
		"Hat_HardHat", 10,
		"MeasuringTape", 10,
		"MetalPipe", 6,
		"MotionSensor", 8,
		"Mov_LightConstruction", 4,
		"Mov_AirConditioner", 1,
		"PetrolCan", 4,
		"Pliers", 8,
		"PowerBar", 20,
		"PowerBar", 10,
		"RadioMag1", 3,
		"RadioMag2", 2,
		"RadioMag3", 1,
		"RespiratorFilters", 2,
		"Rope", 10,
		"Sledgehammer", 0.5,
		"Twine", 10,
		"Vest_HighViz", 4,
		"ViseGrips", 4,
	},
	junk = ClutterTables.TrunkJunk,
}

VehicleDistributions.LectromaxSeat = {
	rolls = 1,
	items = {
		"Bag_ProtectiveCaseSmall_Electronics", 1,
		"BookElectrician1", 2,
		"BookElectrician2", 1,
		"BookElectrician3", 0.5,
		"BookElectrician4", 0.1,
		"BookElectrician5", 0.05,
		"ElbowPad_Left_Workman", 1,
		"ElectricWire", 10,
		"ElectronicsMag1", 2,
		"ElectronicsMag2", 2,
		"ElectronicsMag3", 2,
		"ElectronicsMag4", 1,
		"ElectronicsMag5", 2,
		"ElectronicsScrap", 10,
		"EngineerMagazine1", 2,
		"EngineerMagazine2", 2,
		"FlashLight_AngleHead", 1,
		"Glasses_SafetyGoggles", 10,
		"Gloves_LeatherGloves", 10,
		"Hat_BuildersRespirator", 2,
		"Hat_DustMask", 10,
		"Hat_EarMuff_Protectors", 10,
		"Hat_HardHat", 10,
		"Kneepad_Left_Workman", 4,
		"Magazine_Tech", 10,
		"MarkerBlack", 4,
		"MeasuringTape", 10,
		"Pliers", 8,
		"RadioMag1", 3,
		"RadioMag2", 2,
		"RadioMag3", 1,
		"RespiratorFilters", 2,
		"RippedSheets", 10,
		"RippedSheetsDirty", 10,
		"Twine", 10,
		"Vest_HighViz", 4,
		"ViseGrips", 4,
	},
	junk = ClutterTables.SeatFrontJunk,
}

VehicleDistributions.Lectromax = {
	
	TruckBed = VehicleDistributions.LectromaxTruckBed;
	
	TruckBedOpen = VehicleDistributions.LectromaxTruckBed;
	
	TrailerTrunk =  VehicleDistributions.LectromaxTruckBed;
	
	GloveBox = VehicleDistributions.LectromaxGloveBox;
	
	SeatFrontLeft = VehicleDistributions.DriverSeat;
	SeatFrontRight = VehicleDistributions.LectromaxSeat;
}

-- The box truck variant to the McCoy spawn pool, again just letting more stuff spawn inside for general import/export

VehicleDistributions.McCoyTruckGloveBox = {
	rolls = 1,
	items = {
		"BookCarpentry1", 2,
		"BookCarpentry2", 1,
		"BookCarpentry3", 0.5,
		"BookCarpentry4", 0.1,
		"BookCarpentry5", 0.05,
		"BookMaintenance1", 2,
		"BookMaintenance2", 1,
		"BookMaintenance3", 0.5,
		"BookMaintenance4", 0.1,
		"BookMaintenance5", 0.05,
		"BookFirstAid1", 0.5,
		"Bullhorn", 10,
		"CarpentryChisel", 4,
		"Clipboard", 10,
		"ElbowPad_Left_Workman", 1,
		"ElectronicsMag4", 0.1,
		"FirstAidKit", 1,
		"Flask", 0.5,
		"Glasses_SafetyGoggles", 10,
		"Gloves_LeatherGloves", 10,
		"HandAxe", 4,
		"Hammer", 8,
		"Hat_Bandana", 1,
		"Hat_BandanaTINT", 1,
		"Hat_BuildersRespirator", 2,
		"Hat_DustMask", 10,
		"Hat_EarMuff_Protectors", 10,
		"Hat_HardHat", 10,
		"Kneepad_Left_Workman", 4,
		"Lunchbag", 4,
		"Lunchbox", 2,
		"Lunchbox2", 0.01,
		"MarkerBlack", 4,
		"MeasuringTape", 10,
		"NailsBox", 10,
		"Paperback", 4,
		"Paperwork", 20,
		"Paperwork", 10,
		"Pliers", 4,
		"RespiratorFilters", 2,
		"RippedSheets", 10,
		"RippedSheetsDirty", 10,
		"Screwdriver", 10,
		"ScrewsBox", 8,
		"TobaccoChewing", 1,
		"Tsquare", 1,
		"Twine", 10,
		"Whetstone", 10,
		"Woodglue", 2,
	},
	junk = ClutterTables.GloveBoxWorkJunk,
}

VehicleDistributions.McCoyTruckTruckBed = {
	rolls = 10,
	items = {
		"Axe", 10,
		"BoltCutters", 1,
		"BookCarpentry1", 2,
		"BookCarpentry2", 1,
		"BookCarpentry3", 0.5,
		"BookCarpentry4", 0.1,
		"BookCarpentry5", 0.05,
		"BookMaintenance1", 2,
		"BookMaintenance2", 1,
		"BookMaintenance3", 0.5,
		"BookMaintenance4", 0.1,
		"BookMaintenance5", 0.05,
		"Bullhorn", 10,
		"CarBattery2", 4,
		"CarpentryChisel", 4,
		"ElectronicsMag4", 4,
		"Generator", 0.1,
		"Glasses_SafetyGoggles", 10,
		"Gloves_LeatherGloves", 10,
		"HandAxe", 4,
		"Hat_BuildersRespirator", 2,
		"Hat_DustMask", 10,
		"Hat_EarMuff_Protectors", 10,
		"Hat_HardHat", 10,
		"Log", 75,
		"Log", 30,
		"Log", 30,
		"Log", 15,
		"Log", 15,
		"MeasuringTape", 10,
		"Mov_LightConstruction", 4,
		"NormalTire2", 1,
		"PetrolCan", 20,
		"PetrolCan", 4,
		"Pliers", 4,
		"PowerBar", 10,
		"RespiratorFilters", 2,
		"Rope", 20,
		"Rope", 10,
		"RubberHose", 10,
		"Saw", 8,
		"Sledgehammer", 0.5,
		"Twine", 10,
		"Vest_Foreman", 1,
		"Vest_HighViz", 4,
		"Whetstone", 10,
		"WoodAxe", 2,
	},
	junk = ClutterTables.TrunkJunk,
}

VehicleDistributions.McCoyTruckSeatFront = {
	rolls = 1,
	items = {
		"BookCarpentry1", 2,
		"BookCarpentry2", 1,
		"BookCarpentry3", 0.5,
		"BookCarpentry4", 0.1,
		"BookCarpentry5", 0.05,
		"BookMaintenance1", 2,
		"BookMaintenance2", 1,
		"BookMaintenance3", 0.5,
		"BookMaintenance4", 0.1,
		"BookMaintenance5", 0.05,
		"CarpentryChisel", 4,
		"ElbowPad_Left_Workman", 1,
		"HandAxe", 4,
		"Hat_BuildersRespirator", 2,
		"Hat_DustMask", 10,
		"Hat_EarMuff_Protectors", 10,
		"Hat_HardHat", 10,
		"Kneepad_Left_Workman", 4,
		"MarkerBlack", 4,
		"MeasuringTape", 10,
		"Pliers", 4,
		"RespiratorFilters", 2,
		"TVMagazine", 1,
		"Twine", 10,
		"Whetstone", 10,
	},
	junk = ClutterTables.SeatFrontJunk,
}

VehicleDistributions.McCoyTruck = {
	TruckBed = VehicleDistributions.McCoyTruckTruckBed;
	
	TruckBedOpen = VehicleDistributions.McCoyTruckTruckBed;
	
	TrailerTrunk =  VehicleDistributions.McCoyTruckTruckBed;
	
	GloveBox = VehicleDistributions.McCoyTruckGloveBox;
	
	SeatFrontLeft = VehicleDistributions.DriverSeat;
	SeatFrontRight = VehicleDistributions.McCoyTruckSeatFront;
}

-- And Knox Distillery, for all that good Kentucky Whiskey. Yum.

VehicleDistributions.KnoxDistilleryTruckGloveBox = {
	rolls = 1,
	items = {
		"BookFirstAid1", 0.5,
		"Clipboard", 10,
		"ElbowPad_Left_Workman", 1,
		"Flask", 4,
		"Glasses_SafetyGoggles", 10,
		"Gloves_LeatherGloves", 10,
		"Kneepad_Left_Workman", 4,
		"Lunchbag", 4,
		"Lunchbox", 2,
		"Lunchbox2", 0.01,
		"MarkerBlack", 4,
		"Paperback", 4,
		"Paperwork", 10,
		"Twine", 1,
	},
	junk = ClutterTables.GloveBoxWorkJunk,
}

VehicleDistributions.KnoxDistilleryTruckTruckBed = {
	rolls = 10,
	items = {
		"Whiskey", 100,
		"Whiskey", 50,
		"Whiskey", 20,
		"Whiskey", 20,
		"Whiskey", 10,
		"Whiskey", 10,
	},
	junk = ClutterTables.TrunkJunk,
}

VehicleDistributions.KnoxDistilleryTruckSeat = {
	rolls = 1,
	items = {
		"ElbowPad_Left_Workman", 1,
		"Hat_BaseballCap_KnoxDistillery", 20,
		"Kneepad_Left_Workman", 4,
		"MarkerBlack", 4,
		"MeasuringTape", 10,
		"RippedSheets", 10,
		"RippedSheetsDirty", 10,
		"Twine", 1,
		"Whiskey", 10,
	},
	junk = ClutterTables.SeatFrontJunk,
}

VehicleDistributions.KnoxDistilleryTruck = {
	TruckBed = VehicleDistributions.KnoxDistilleryTruckTruckBed;
	
	GloveBox = VehicleDistributions.KnoxDistilleryTruckGloveBox;
	
	SeatFrontLeft = VehicleDistributions.DriverSeat;
	SeatFrontRight = VehicleDistributions.KnoxDistilleryTruckSeat;
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
distributionTable["RangerCharro"] = distributionTable["PickUpTruckLightsRanger"]
distributionTable["FarmhandD15"] = newVehicleDistribution["FarmTruck"]
distributionTable["PreKentarch"] = distributionTable["CarNormal"]
distributionTable["FleetD15_SCEB"] = newVehicleDistribution["FleetTruck"]
distributionTable["FleetD15_ECSB"] = newVehicleDistribution["FleetTruck"]
distributionTable["FossoilD15_SCEB"] = distributionTable["PickUpTruckLightsFossoil"]
distributionTable["FossoilD15_ECSB"] = distributionTable["PickUpTruckLightsFossoil"]
distributionTable["McCoyD15_SCEB"] = distributionTable["PickUpTruckMccoy"]
distributionTable["McCoyD15_ECSB"] = distributionTable["PickUpTruckMccoy"]
distributionTable["PreD15_SCSB"] = distributionTable["PickUpTruck"]
distributionTable["PostD15_SCSB"] = distributionTable["PickUpTruck"]
distributionTable["SportD15_SCSB"] = distributionTable["PickUpTruck"]
distributionTable["PreD15_4WDSCSB"] = distributionTable["PickUpTruck"]
distributionTable["PostD15_4WDSCSB"] = distributionTable["PickUpTruck"]
distributionTable["PreD15_SCEB"] = distributionTable["PickUpTruck"]
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
distributionTable["LectromaxBoxTruckD45"] = newVehicleDistribution["LectromaxTruck"]
distributionTable["McCoyBoxTruckD45"] = newVehicleDistribution["McCoyTruck"]
