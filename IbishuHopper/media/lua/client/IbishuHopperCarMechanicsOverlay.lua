-- First, declare all our models that are gonna be used
ISCarMechanicsOverlay.CarList["Base.XT4Hopper"] = {imgPrefix = "hopper_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.XT6Hopper"] = {imgPrefix = "hopper_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.LXT4Hopper"] = {imgPrefix = "hopper_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.LXT6Hopper"] = {imgPrefix = "hopper_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.ZXT6Hopper"] = {imgPrefix = "hopper_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.DuneHopper"] = {imgPrefix = "hopper_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.SportHopper"] = {imgPrefix = "hopper_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.RangerHopper"] = {imgPrefix = "hopper_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.SheriffHopper"] = {imgPrefix = "hopper_", x=10,y=0};

-- Apparently you gotta declare all the parts below as a copy to the template parts in the vanilla game, so you got this dumb block of code below here:

ISCarMechanicsOverlay.PartList["Engine"].vehicles = ISCarMechanicsOverlay.PartList["Engine"].vehicles or {};
ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles = ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles or {};
ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["HeadlightLeft"] = {img="headlight_left", vehicles={}};
ISCarMechanicsOverlay.PartList["HeadlightRight"] = {img="headlight_right", vehicles={}};
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles = ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["WindowFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["WindowFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles = ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["Windshield"].vehicles = ISCarMechanicsOverlay.PartList["Windshield"].vehicles or {};
ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles = ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles or {};
ISCarMechanicsOverlay.PartList["TruckBed"].vehicles = ISCarMechanicsOverlay.PartList["TruckBed"].vehicles or {};

-- Here is the (apparently optional) taillight pieces, which may end up changing to 'Taillight' instead of 'HeadlightRear' in the near future. Keep this in mind!!!

ISCarMechanicsOverlay.PartList["HeadlightRearLeft"] = {img="headlight_rear_left", vehicles={}};
ISCarMechanicsOverlay.PartList["HeadlightRearRight"] = {img="headlight_rear_right", vehicles={}};

-- And all the unique spare tire models

ISCarMechanicsOverlay.PartList["HopperLXT4SpareTire"] = {img="sparetire", vehicles={}};
ISCarMechanicsOverlay.PartList["HopperLXT6SpareTire"] = {img="sparetire", vehicles={}};
ISCarMechanicsOverlay.PartList["HopperZXT6SpareTire"] = {img="sparetire", vehicles={}};
ISCarMechanicsOverlay.PartList["HopperDuneSpareTire"] = {img="sparetire", vehicles={}};
ISCarMechanicsOverlay.PartList["HopperSportSpareTire"] = {img="sparetire", vehicles={}};
ISCarMechanicsOverlay.PartList["HopperRangerSpareTire"] = {img="sparetire", vehicles={}};
ISCarMechanicsOverlay.PartList["HopperSheriffSpareTire"] = {img="sparetire", vehicles={}};


-- Finally, this is how you can then assign them to the actual part places so you can just hover your mouse over the parts n' crap

ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles["hopper_"] = {x=86,y=186,x2=200,y2=284};
ISCarMechanicsOverlay.PartList["Battery"].vehicles["hopper_"] = {x=74,y=64,x2=114,y2=99};
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles["hopper_"] = {x=84,y=163,x2=106,y2=169};
ISCarMechanicsOverlay.PartList["HeadlightRight"].vehicles["hopper_"] = {x=180,y=163,x2=202,y2=169};
ISCarMechanicsOverlay.PartList["HeadlightRearLeft"].vehicles["hopper_"] = {x=93,y=449,x2=105,y2=453};
ISCarMechanicsOverlay.PartList["HeadlightRearRight"].vehicles["hopper_"] = {x=181,y=449,x2=193,y2=453};
ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles["hopper_"] = {x=72,y=296,x2=81,y2=360}
ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles["hopper_"] = {x=206,y=296,x2=215, y2=360};
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["hopper_"] = {x=67,y=180,x2=73,y2=238};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["hopper_"] = {x=212,y=180,x2=219,y2=238};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles["hopper_"] = {x=66,y=364,x2=74,y2=422};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles["hopper_"] = {x=212,y=364,x2=219,y2=422};
ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles["hopper_"] = {x=81,y=296,x2=88,y2=360};
ISCarMechanicsOverlay.PartList["WindowFrontRight"].vehicles["hopper_"] = {x=199,y=296,x2=206, y2=360};
ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles["hopper_"] = {x=81,y=375,x2=88,y2=426};
ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles["hopper_"] = {x=199,y=375,x2=206, y2=426};
ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles["hopper_"] = {x=86,y=436,x2=200,y2=446};
ISCarMechanicsOverlay.PartList["Windshield"].vehicles["hopper_"] = {x=86,y=284,x2=200,y2=300};
ISCarMechanicsOverlay.PartList["TruckBed"].vehicles["hopper_"] = {x=109,y=446,x2=177,y2=454};
ISCarMechanicsOverlay.PartList["HopperLXT4SpareTire"].vehicles["hopper_"] = {x=114,y=455,x2=172,y2=472};
ISCarMechanicsOverlay.PartList["HopperLXT6SpareTire"].vehicles["hopper_"] = {x=114,y=455,x2=172,y2=472};
ISCarMechanicsOverlay.PartList["HopperZXT6SpareTire"].vehicles["hopper_"] = {x=114,y=455,x2=172,y2=472};
ISCarMechanicsOverlay.PartList["HopperDuneSpareTire"].vehicles["hopper_"] = {x=114,y=455,x2=172,y2=472}; 
ISCarMechanicsOverlay.PartList["HopperSportSpareTire"].vehicles["hopper_"] = {x=114,y=455,x2=172,y2=472}; 
ISCarMechanicsOverlay.PartList["HopperRangerSpareTire"].vehicles["hopper_"] = {x=114,y=455,x2=172,y2=472};
ISCarMechanicsOverlay.PartList["HopperSheriffSpareTire"].vehicles["hopper_"] = {x=114,y=455,x2=172,y2=472};





