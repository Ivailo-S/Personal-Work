ISCarMechanicsOverlay.CarList["Base.IbishuCovetDx"] = {imgPrefix = "smallcar_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.IbishuDrivingSchool"] = {imgPrefix = "smallcar_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.IbishuCovetDxi"] = {imgPrefix = "smallcar_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.IbishuCovetLxi"] = {imgPrefix = "smallcar_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.IbishuCovetZxi"] = {imgPrefix = "smallcar_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.IbishuCovetZxiSpecial"] = {imgPrefix = "smallcar_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.IbishuCovetGtz"] = {imgPrefix = "smallcar_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.IbishuCovetTurbo"] = {imgPrefix = "rearenginecar_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.IbishuCovetRally"] = {imgPrefix = "rearenginecar_", x=10,y=0};


-- Just for that bastardized mid engined Covet, many sleepless nights have been caused by that thing
-- (In retrospect, this might be a complete waste of space just calling already existing crap, but who cares honestly)

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

-- And for the custom parts, just whatever

ISCarMechanicsOverlay.PartList["Battery"].vehicles["rearenginecar_"] = {x=14,y=283,x2=43,y2=301};
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["rearenginecar_"] = {x=22,y=216,x2=53,y2=244};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles["rearenginecar_"] = {x=232,y=216,x2=263,y2=244};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles["rearenginecar_"] = {x=22,y=405,x2=53,y2=433};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles["rearenginecar_"] = {x=232,y=405,x2=263,y2=433};
ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles["rearenginecar_"] = {x=86,y=260,x2=94,y2=342};
ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles["rearenginecar_"] = {x=199,y=260,x2=207,y2=342};
ISCarMechanicsOverlay.PartList["Engine"].vehicles["rearenginecar_"] = {x=138,y=48,x2=237,y2=106};
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["rearenginecar_"] = {x=52,y=499,x2=136,y2=552};
ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles["rearenginecar_"] = {x=94,y=175,x2=192,y2=235};
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["rearenginecar_"] = {x=180,y=489,x2=213,y2=557};
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["rearenginecar_"] = {x=21,y=181,x2=59,y2=212};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["rearenginecar_"] = {x=228,y=181,x2=264,y2=212};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles["rearenginecar_"] = {x=21,y=358,x2=59,y2=394};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles["rearenginecar_"] = {x=231,y=368,x2=264,y2=399};
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["rearenginecar_"] = {x=78,y=189,x2=87,y2=247};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["rearenginecar_"] = {x=204,y=189,x2=213,y2=247};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles["rearenginecar_"] = {x=78,y=352,x2=87,y2=416};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles["rearenginecar_"] = {x=204,y=352,x2=213,y2=416};
ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles["rearenginecar_"] = {x=94,y=277,x2=108,y2=342};
ISCarMechanicsOverlay.PartList["WindowFrontRight"].vehicles["rearenginecar_"] = {x=185,y=277,x2=199,y2=342};
ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles["rearenginecar_"] = {x=94,y=343,x2=108,y2=408};
ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles["rearenginecar_"] = {x=185,y=343,x2=199,y2=408};
ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles["rearenginecar_"] = {x=112,y=398,x2=187,y2=430};
ISCarMechanicsOverlay.PartList["Windshield"].vehicles["rearenginecar_"] = {x=98,y=238,x2=192,y2=284};

