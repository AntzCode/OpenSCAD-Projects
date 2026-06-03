// Bearing specifications
// 7.25" wheel bearing: 6203-2RS
//    Outside Diameter: 40mm
//    Inside Diameter: 17mm
//    Width: 12mm

// Bolt specifications - eg: https://accu-components.com/us/flanged-hexagon-bolts/162286-SEF-M5-25-A2-BL
// 7.25" flanged bolt
//    Thread size 5mm
//    Thread pitch 0.8mm
//    Thread length 25mm
//    Socket size 8mm
//    Head length 5.4mm
//    Flange diameter 11.8mm

// scale factor for translating to a model size
function scale() = (modelSize == SCALE_7_INCH ? 4.5 : modelSize == SCALE_5_INCH ? 8.4 : modelSize == SCALE_3D_PRINT ? 50 : modelSize == SCALE_25 ? 25 : 1);

// PRINTING TOLERANCE
function tolerance() =
    printMode == PRINT_MODE_MILLING_MS_TOLERANCE ? 0.2 :
    printMode == PRINT_MODE_PRINTING_PLA_TOLERANCE ? 1 :
    printMode == PRINT_MODE_NO_TOLERANCE ? 0 :
    0;

// nose
noseWidth = 1200 / scale();
noseLength = 1090 / scale();
noseHeightCenter = 1070 / scale();
noseHeightSides = 960 / scale();
noseCornerRadius = 120 / scale();
noseApexRadius = 120 / scale();
noseColor = "Yellow";

noseFrontWindowWidth = noseWidth - 20 / scale();
noseFrontWindowHeight = noseHeightCenter - 330 / scale();
noseFrontGrilleLouvreDistance = 30 / scale();
noseFrontGrilleLouvreThickness = 4 / scale();
noseFrontGrilleLouvreWidth = 50 / scale();
noseFrontGrilleLouvreAngle = -55;
noseFrontGrilleWidth = noseFrontWindowWidth;
noseFrontGrilleHeight = noseFrontWindowHeight;
noseFrontGrilleThickness = 50 / scale();
noseFrontGrilleProtrusionFront = 5 / scale();
noseFrontGrilleColor = "#ffe032";
noseFrontGrilleBorderWidth = 60 / scale();

noseDoorHeight = 730 / scale();
noseDoorWidth = 540 / scale();
noseDoorOffsetFront = 5 / scale();
noseDoorFrameWidth = 40 / scale();
noseDoorColor = "#fff239";

noseDoorWindowWidth = 300 / scale();
noseDoorWindowHeight = 300 / scale();
noseDoorWindowOffsetBottom = 200 / scale();

noseDoorWindowLouvreDistance = 15 / scale();
noseDoorWindowLouvreThickness = 2 / scale();
noseDoorWindowLouvreWidth = 20 / scale();
noseDoorWindowLouvreAngle = -50;
noseDoorWindowThickness = 10 / scale();
noseDoorWindowProtrusionFront = 3 / scale();
noseDoorWindowColor = "Yellow";
noseDoorWindowBorderWidth = 20 / scale();

noseExhaustDiameter = 65 / scale();
noseExhaustThickness = 3 / scale();
noseExhaustLength = 50 / scale();
noseExhaustOffsetBack = 90 / scale();
noseExhaustOffsetLeft = ((1200 / 2 - 310) + 65) / scale();
noseExhaustColor = "Black";

noseAirIntakeDiameter = 80 / scale();
noseAirIntakeThickness = 3 / scale();
noseAirIntakeLength = 100 / scale();
noseAirIntakeOffsetFront = 150 / scale();
noseAirIntakeOffsetRight = ((1200 / 2 - 80) - 80) / scale();

noseAirIntakeFilterHousingDiameter = 165 / scale();
noseAirIntakeFilterHousingThickness = 20 / scale();
noseAirIntakeFilterHousingOffsetBottom = 60 / scale();
noseAirIntakeColor = "Black";

noseFuelInputDiameter = 70 / scale();
noseFuelInputThickness = 3 / scale();
noseFuelInputLength = 0 / scale();
noseFuelInputOffsetFront = 160 / scale();
noseFuelInputOffsetRight = ((1200 / 2 - 70) - 340) / scale();
noseFuelInputColor = "Black";

// cab
cabLength = 1730 / scale();
cabWidth = 2220 / scale();
cabHeightCenter = 2280 / scale();
cabHeightSides = 2080 / scale();
cabCornerRadius = 50 / scale();
cabRoofOverhangFront = 19 / scale();
cabRoofOverhangBack = 19 / scale();
cabRoofOverhangSide = 19 / scale();
cabColor = "Yellow";

// cab side windows
leftWindowWidth = 980 / scale();
leftWindowHeight = 720 / scale();
leftWindowOffsetBottom = 1220 / scale();
leftWindowOffsetFront = 60 / scale();
leftWindowCornerRadius = 70 / scale();

rightWindowWidth = 980 / scale();
rightWindowHeight = 720 / scale();
rightWindowOffsetBottom = 1220 / scale();
rightWindowOffsetFront = 100 / scale();
rightWindowCornerRadius = 70 / scale();

// cab front windows
frontSideWindowWidth = 500 / scale();
frontSideWindowHeightLong = 610 / scale();
frontSideWindowHeightShort = 540 / scale();
frontSideWindowOffsetBottom = (510 + 1070) / scale();
frontSideWindowCornerRadius = 70 / scale();
frontSideWindowOffsetSide = 120 / scale();

frontCenterWindowWidth = 430 / scale();
frontCenterWindowHeight = 430 / scale();
frontCenterWindowOffsetBottom = (430 + 1070) / scale();
frontCenterWindowCornerRadius = 70 / scale();

// cab doors
doorWidth = 460 / scale();
doorHeight = 1800 / scale();
doorOffsetBack = 120 / scale();
doorOffsetBottom = 230 / scale();
doorColor = "#fff239";

doorWindowWidth = 320 / scale();
doorWindowHeight = 720 / scale();
doorWindowOffsetBottom = 1220 / scale();
doorWindowCornerRadius = 70 / scale();
doorHandleDiameter = 40 / scale();
doorHandleLength = 30 / scale();
doorHandleOffsetBack = 400 / scale();
doorHandleOffsetBottom = (50 + 1070) / scale();
doorHandleColor = "Black";

// cab steps
stepsHeight = 40 / scale();
stepsWidth = 40 / scale();
stepsThickness = 20 / scale();
step1Thickness = 20 / scale();
step1OffsetBottom = 40 / scale();

// chassis
chassisColor = "#292930";
chassisCornerColor = "#363632";
chassisBoltColor = "#545558";
chassisWidthOrig = 1600;
chassisHeightOrig = 470;
chassisLengthOrig = cabLength + noseLength + 30;
chassisCornerRadiusOrig = 140;
chassisCornerLengthOrig = 255;
chassisCornerBoltOffsetOrig = 20;

chassisBoltSizeOrig = 36;
chassisBoltThicknessOrig = 20;

// hitch block
hitchBlockColor = "DarkSlateGray";
hitchBlockWidth = 290 / scale();
hitchBlockHeight = 260 / scale();
hitchBlockLength = 290 / scale();
hitchBlockCornerRadius = (modelSize == SCALE_FULL) ? 5 / scale() : 0;
hitchMountPlateWidth = 720 / scale();
hitchMountPlateThickness = 20 / scale();
hitchMountPlateHeight = 460 / scale();
hitchMountPlateCornerRadius = (modelSize == SCALE_FULL) ? 2 / scale() : 0;
hitchPointDiameterBig = 280 / scale();
hitchPointDiameterSmall = 120 / scale();
hitchPointLength = 300 / scale();
hitchChainTagWidth = 50 / scale();
hitchChainTagLength = 90 / scale();
hitchChainColor = "Black";
hitchChainLength = 160 / scale();
hitchChainWidth = 90 / scale();
hitchChainThickness = 35 / scale();
hitchChainNumberOfLinks = 3;
hitchChainHookLength = 295 / scale();
hitchChainHookWidth = 150 / scale();
hitchChainHookThickness = 45 / scale();

hitchNotchWidth = 80 / scale();
hitchNotchLength = 260 / scale();
hitchNotchDepth = 140 / scale();
hitchNotchCornerRadius = (modelSize == SCALE_FULL) ? 30 / scale() : 0;

// wheel holes
wheelHoleWidth = 380 / scale();
wheelHoleHeight = 150 / scale();

// CHASSIS LENGTH
function chassisLength() =
    modelSize == SCALE_7_INCH ? 633 :
    modelSize == SCALE_5_INCH ? 339 :
    modelSize == SCALE_3D_PRINT ? 57 :
    modelSize == SCALE_25 ? 113 : 
    chassisLengthOrig;

// CHASSIS WIDTH
function chassisWidth() =
    modelSize == SCALE_7_INCH ? 355 :
    modelSize == SCALE_5_INCH ? 190 :
    modelSize == SCALE_3D_PRINT ? 32 :
    modelSize == SCALE_25 ? chassisWidthOrig / scale() : 
    chassisWidthOrig;

// CHASSIS HEIGHT
function chassisHeight() =
    //modelSize == SCALE_7_INCH ? 105 :
    modelSize == SCALE_7_INCH ? 100 :
    modelSize == SCALE_5_INCH ? chassisHeightOrig / scale() :
    modelSize == SCALE_3D_PRINT ? 9.4 :
    modelSize == SCALE_25 ? chassisHeightOrig / scale() : 
    chassisHeightOrig;

// CHASSIS CORNER RADIUS
function chassisCornerRadius() =
    modelSize == SCALE_7_INCH ? chassisCornerRadiusOrig / scale() :
    modelSize == SCALE_5_INCH ? chassisCornerRadiusOrig / scale() :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    chassisCornerRadiusOrig;

// CHASSIS CORNER LENGTH
function chassisCornerLength() =
    modelSize == SCALE_7_INCH ? chassisCornerLengthOrig / scale() :
    modelSize == SCALE_5_INCH ? chassisCornerLengthOrig / scale() :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? chassisCornerLengthOrig / scale() : 
    chassisCornerLengthOrig;

// CHASSIS CORNER BOLT OFFSET
function chassisCornerBoltOffset() =
    modelSize == SCALE_7_INCH ? chassisCornerBoltOffsetOrig / scale() :
    modelSize == SCALE_5_INCH ? chassisCornerBoltOffsetOrig / scale() :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? chassisCornerBoltOffsetOrig / scale() : 
    chassisCornerBoltOffsetOrig;

// CHASSIS BOLT SIZE
function chassisBoltSize() =
    modelSize == SCALE_7_INCH ? chassisBoltSizeOrig / scale() :
    modelSize == SCALE_5_INCH ? chassisBoltSizeOrig / scale() :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? chassisBoltSizeOrig / scale() : 
    chassisBoltSizeOrig;

// CHASSIS BOLT THICKNESS
function chassisBoltThickness() =
    modelSize == SCALE_7_INCH ? chassisBoltThicknessOrig / scale() :
    modelSize == SCALE_5_INCH ? chassisBoltThicknessOrig / scale() :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? chassisBoltThicknessOrig / scale() : 
    chassisBoltThicknessOrig;



// JOURNAL ASSEMBLY

// PEDESTAL
pedestalColor = "#444852";
pedestalWidthOrig = 650;
pedestalHeightOrig = 400;
pedestalThicknessOrig = 165;
pedestalWidthTopOrig = 850;
pedestalCornerRadiusOrig = 5;
pedestalBoltHoleDiameterOrig = 21;
pedestalBoltHoleDepthOrig = 180;
pedestalOuterBoltHoleDepthOrig = 180;

// PEDESTAL MOUNT BRACKET (INSIDE CHASSIS)
pedestalMountBracketColor = "#2e4046";
pedestalMountBracketWidthOrig = 180;
pedestalMountBracketHeightOrig = 100;
pedestalMountBracketThicknessOrig = 16;
pedestalMountBracketLengthOrig = chassisLength() - chassisCornerRadius() * 2;
pedestalMountBracketBoltHoleDiameterOrig = 24;
pedestalMountBracketBoltHoleSlotLengthOrig = 48;

pedestalLegTopLength=56;
pedestalLegTopOuterWidth=24;
pedestalLegTopInnerWidth=18;
pedestalLegTopInnerLength=4;
pedestalLegTopInnerOffsetY=16;
pedestalLegTopPointWidthMin=18;
pedestalLegTopPointWidthMax=18;
pedestalLegTopScoopAngle=25;


pedestalLegBottomLength=30;
pedestalLegBottomOuterWidth=24;
pedestalLegBottomInnerWidth=18;
pedestalLegBottomInnerLength=4;
pedestalLegBottomInnerOffsetY=3;
pedestalLegBottomPointWidthMin=18;
pedestalLegBottomPointWidthMax=18;
pedestalLegBottomScoopAngle=25;


pedestalHeelLength=16;
pedestalHeelOuterWidth=24;
pedestalHeelInnerWidth=18;
pedestalHeelInnerLength=4;
pedestalHeelInnerOffsetY=3;
pedestalHeelPointWidthMin=18;
pedestalHeelPointWidthMax=18;
pedestalHeelScoopAngle=25;

pedestalLegTopScoopRoundness =      1;
pedestalLegBottomScoopRoundness =   1;
pedestalHeelScoopRoundness =        1;


// JOURNAL BLOCK
journalBlockColor = "#404546";
journalBlockThicknessOrig = 165;
journalBlockWidthOrig = 360;
journalBlockHeightOrig = 300;
journalBlockProtrusion = 30 / scale();
journalBlockChannelWidthOrig = 12;
journalBlockChannelHeightOrig = 8;
journalBlockBearingCapBoltHoleDiameterOrig = 19;
journalBlockBearingCapBoltHoleDepthOrig = 165;

// SUSPENSION SPRING
journalBlockSuspensionSpringColor = "#8c9497";
journalBlockSuspensionTravelDistanceOrig = 40;
journalBlockSuspensionSpringHoleDiameterOrig = 80;
journalBlockSuspensionSpringHoleDepthOrig = 160;
journalBlockSuspensionSpringWireDiameterOrig = 18;

// BEARING
journalBlockBearingRingColor = "#b5c3c7";
journalBlockBearingSealColor = "#c75555";
journalBlockBearingHeightOrig = 120;
journalBlockBearingInnerDiameterOrig = 80;
journalBlockBearingOuterDiameterOrig = 220;
journalBlockBearingInnerThicknessOrig = 20;
journalBlockBearingOuterThicknessOrig = 20;

// BEARING CAP
bearingCapColor = "#475458";
bearingCapCenterColor = "#597175";
bearingCapBoltColor = "#6e797e";
bearingCapBoltDiameterOrig = 22;
bearingCapBoltLengthOrig = 140;
bearingCapBoltOffsetOuterEdgeOrig = 32;
bearingCapProtrusionOrig = 28;
bearingCapDiameterOrig = 160;
bearingCapPlateDiameterOrig = 280;
bearingCapPlateThicknessOrig = 18;
bearingCapCornerRadiusOrig = 5;
bearingCapBoltSizeOrig = 36;
bearingCapBoltThicknessOrig = 18;
bearingCapBoltWasherDiameterOrig = 42;
bearingCapBoltWasherThicknessOrig = 2.2;

// WHEELS
wheelColor = "#e4f5ef";
wheelFlangeColor = "#a2bbbe";

function showNosePipes() = scale() < 30;

// PEDESTAL WIDTH
function pedestalWidth() =
    modelSize == SCALE_7_INCH ? pedestalWidthOrig / scale() :
    modelSize == SCALE_5_INCH ? pedestalWidthOrig / scale() :
    modelSize == SCALE_3D_PRINT ? pedestalWidthOrig / scale() :
    modelSize == SCALE_25 ? pedestalWidthOrig / scale() : 
    pedestalWidthOrig;

// PEDESTAL WIDTH TOP
function pedestalWidthTop() =
    modelSize == SCALE_7_INCH ? pedestalWidthTopOrig / scale() :
    modelSize == SCALE_5_INCH ? pedestalWidthTopOrig / scale() :
    modelSize == SCALE_3D_PRINT ? pedestalWidthTopOrig / scale() :
    modelSize == SCALE_25 ? pedestalWidthTopOrig / scale() : 
    pedestalWidthTopOrig;

// PEDESTAL HEIGHT
function pedestalHeight() =
    modelSize == SCALE_7_INCH ? pedestalHeightOrig / scale() :
    modelSize == SCALE_5_INCH ? pedestalHeightOrig / scale() :
    modelSize == SCALE_3D_PRINT ? pedestalHeightOrig / scale() :
    modelSize == SCALE_25 ? pedestalHeightOrig / scale() : 
    pedestalHeightOrig;

// PEDESTAL THICKNESS
function pedestalThickness() =
    modelSize == SCALE_7_INCH ? 24 :
    modelSize == SCALE_5_INCH ? 15 :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? 3 : 
    pedestalThicknessOrig;

// PEDESTAL CORNER RADIUS   
function pedestalCornerRadius() =
    modelSize == SCALE_7_INCH ? 20 :
    modelSize == SCALE_5_INCH ? 15 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    pedestalCornerRadiusOrig;

// PEDESTAL BOLT HOLE DIAMETER (will be tapped)
function pedestalBoltHoleDiameter() =
    modelSize == SCALE_7_INCH ? 6.5 :
    modelSize == SCALE_5_INCH ? 6.5 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    pedestalBoltHoleDiameterOrig;

// PEDESTAL BOLT HOLE DEPTH (inner)
function pedestalBoltHoleDepth() =
    modelSize == SCALE_7_INCH ? 90 :
    modelSize == SCALE_5_INCH ? 40 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    pedestalBoltHoleDepthOrig;

// PEDESTAL OUTER BOLT HOLE DEPTH
function pedestalOuterBoltHoleDepth() =
    modelSize == SCALE_7_INCH ? 65 :
    modelSize == SCALE_5_INCH ? 40 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    pedestalOuterBoltHoleDepthOrig;

// PEDESTAL BOLT HOLE OFFSET 1
function pedestalBoltHoleOffset() =
    (journalBlockWidth() / 2) + (pedestalWidth() - journalBlockWidth())/2/2 - pedestalBoltHoleDiameter();

// PEDESTAL BOLT HOLE OFFSET 2
function pedestalOuterBoltHoleOffset() =
    (journalBlockWidth() / 2) + (pedestalWidth() - journalBlockWidth())/2/2 + (pedestalWidthTop() - pedestalWidth())/2 - pedestalBoltHoleDiameter();

// PEDESTAL MOUNT BRACKET WIDTH
function pedestalMountBracketWidth() =
    modelSize == SCALE_7_INCH ? 25 :
    modelSize == SCALE_5_INCH ? 15 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 3 : 
    pedestalMountBracketWidthOrig;

// PEDESTAL MOUNT BRACKET HEIGHT
function pedestalMountBracketHeight() =
    modelSize == SCALE_7_INCH ? 25 :
    modelSize == SCALE_5_INCH ? 15 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 3 : 
    pedestalMountBracketHeightOrig;

// PEDESTAL MOUNT BRACKET THICKNESS
function pedestalMountBracketThickness() =
    modelSize == SCALE_7_INCH ? 3 :
    modelSize == SCALE_5_INCH ? 3 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 3 : 
    pedestalMountBracketThicknessOrig;

// PEDESTAL MOUNT BRACKET LENGTH
function chassisWallLength() = chassisLength() - chassisCornerRadius()*2;

// PEDESTAL MOUNT BRACKET HOLE DIAMETER (for bolt to go through)
function pedestalMountBracketBoltHoleDiameter() =
    modelSize == SCALE_7_INCH ? 8 :
    modelSize == SCALE_5_INCH ? 8 :
    modelSize == SCALE_3D_PRINT ? 3 :
    modelSize == SCALE_25 ? 3 : 
    pedestalMountBracketBoltHoleDiameterOrig;

// PEDESTAL MOUNT BRACKET HOLE SLOT LENGTH
function pedestalMountBracketBoltHoleSlotLength() =
    modelSize == SCALE_7_INCH ? 10 :
    modelSize == SCALE_5_INCH ? 16 :
    modelSize == SCALE_3D_PRINT ? 3 :
    modelSize == SCALE_25 ? 3 : 
    pedestalMountBracketBoltHoleSlotLengthOrig;

// SUSPENSION TRAVEL DISTANCE
function journalBlockSuspensionTravelDistance() =
    modelSize == SCALE_7_INCH ? 8 :
    modelSize == SCALE_5_INCH ? 8 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    journalBlockSuspensionTravelDistanceOrig;

// SUSPENSION SPRING HOLE DIAMETER
function journalBlockSuspensionSpringHoleDiameter() =
    modelSize == SCALE_7_INCH ? 14 :
    modelSize == SCALE_5_INCH ? 10 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    journalBlockSuspensionSpringHoleDiameterOrig;

// SUSPENSION SPRING HOLE DEPTH
function journalBlockSuspensionSpringHoleDepth() =
    modelSize == SCALE_7_INCH ? 24 :
    modelSize == SCALE_5_INCH ? 12 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    journalBlockSuspensionSpringHoleDepthOrig;

// SUSPENSION SPRING HOLE OFFSET
function journalBlockSuspensionSpringHoleOffset() = 
    modelSize == SCALE_7_INCH ? 3 :
    modelSize == SCALE_5_INCH ? 3 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    journalBlockSuspensionSpringHoleOffsetOrig;

// SUSPENSION SPRING WIRE DIAMETER
function journalBlockSuspensionSpringWireDiameter() =
    modelSize == SCALE_7_INCH ? 2 :
    modelSize == SCALE_5_INCH ? 2 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    journalBlockSuspensionSpringWireDiameterOrig;

// SUSPENSION SPRING WINDING DENSITY (less is more)
function journalBlockSuspensionSpringWindingsRate() =
    modelSize == SCALE_7_INCH ? 4 :
    modelSize == SCALE_5_INCH ? 4 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    journalBlockSuspensionSpringWindingsRateOrig;

// SUSPENSION GUIDE RAIL WIDTH
function journalBlockChannelWidth() =
    modelSize == SCALE_7_INCH ? 4 :
    modelSize == SCALE_5_INCH ? 4 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    journalBlockChannelWidthOrig;
    
// SUSPENSION GUIDE RAIL HEIGHT
function journalBlockChannelHeight() =
    modelSize == SCALE_7_INCH ? 4 :
    modelSize == SCALE_5_INCH ? 4 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    journalBlockChannelHeightOrig;

function journalBoxOffsetY() = 
    (pedestalHeight() - (pedestalHeight() - (journalBlockHeight() + journalBlockSuspensionTravelDistance()))) - journalBlockHeight();

// JOURNAL BLOCK WIDTH
function journalBlockWidth() =
    modelSize == SCALE_7_INCH ? journalBlockWidthOrig / scale() :
    modelSize == SCALE_5_INCH ? journalBlockWidthOrig / scale() :
    modelSize == SCALE_3D_PRINT ? journalBlockWidthOrig / scale() :
    modelSize == SCALE_25 ? journalBlockWidthOrig / scale() : 
    journalBlockWidthOrig;

// JOURNAL BLOCK HEIGHT
function journalBlockHeight() =
    modelSize == SCALE_7_INCH ? 76 :
    modelSize == SCALE_5_INCH ? journalBlockHeightOrig / scale() :
    modelSize == SCALE_3D_PRINT ? journalBlockHeightOrig / scale() :
    modelSize == SCALE_25 ? journalBlockHeightOrig / scale() : 
    journalBlockHeightOrig;

// JOURNAL BLOCK THICKNESS
function journalBlockThickness() =
    modelSize == SCALE_7_INCH ? 24 :
    modelSize == SCALE_5_INCH ? 15 :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? 3 : 
    journalBlockThicknessOrig;

// JOURNAL BLOCK BEARING CAP BOLT HOLE DIAMETER
function journalBlockBearingCapBoltHoleDiameter() =
    modelSize == SCALE_7_INCH ? 4.2 :
    modelSize == SCALE_5_INCH ? 4.2 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    journalBlockBearingCapBoltHoleDiameterOrig;

// JOURNAL BLOCK BEARING CAP BOLT HOLE DEPTH
function journalBlockBearingCapBoltHoleDepth() =
    modelSize == SCALE_7_INCH ? 24 :
    modelSize == SCALE_5_INCH ? 24 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    journalBlockBearingCapBoltHoleDepthOrig;

// BEARING OUTER DIAMETER
function journalBlockBearingOuterDiameter() =
    modelSize == SCALE_7_INCH ? 40 :
    modelSize == SCALE_5_INCH ? 24 :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? 3 : 
    journalBlockBearingOuterDiameterOrig;

// BEARING INNER DIAMETER
function journalBlockBearingInnerDiameter() =
    modelSize == SCALE_7_INCH ? 17 :
    modelSize == SCALE_5_INCH ? 16 :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? 3 : 
    journalBlockBearingInnerDiameterOrig;

// BEARING HEIGHT
function journalBlockBearingHeight() =
    modelSize == SCALE_7_INCH ? 12 :
    modelSize == SCALE_5_INCH ? 12 :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? 3 : 
    journalBlockBearingHeightOrig;

// BEARING OUTER THICKNESS
function journalBlockBearingOuterThickness() =
    modelSize == SCALE_7_INCH ? 2.2 :
    modelSize == SCALE_5_INCH ? 6 :
    modelSize == SCALE_3D_PRINT ? 1 :
    modelSize == SCALE_25 ? 3 : 
    journalBlockBearingOuterThicknessOrig;

// BEARING INNER THICKNESS 
function journalBlockBearingInnerThickness() =
    modelSize == SCALE_7_INCH ? 2.4 :
    modelSize == SCALE_5_INCH ? 6 :
    modelSize == SCALE_3D_PRINT ? 1 :
    modelSize == SCALE_25 ? 3 : 
    journalBlockBearingInnerThicknessOrig;

// BEARING CAP PLATE DIAMETER (outer plate)
function bearingCapPlateDiameter() =
    modelSize == SCALE_7_INCH ? 70 :
    modelSize == SCALE_5_INCH ? 5 :
    modelSize == SCALE_3D_PRINT ? 7 :
    modelSize == SCALE_25 ? 0 : 
    bearingCapPlateDiameterOrig;

// BEARING CAP PLATE THICKNESS (outer plate)
function bearingCapPlateThickness() =
    modelSize == SCALE_7_INCH ? 5 :
    modelSize == SCALE_5_INCH ? 5 :
    modelSize == SCALE_3D_PRINT ? 1 :
    modelSize == SCALE_25 ? 1 : 
    bearingCapPlateThicknessOrig;

// BEARING CAP DIAMETER (center cap)
function bearingCapDiameter() =
    modelSize == SCALE_7_INCH ? 30 :
    modelSize == SCALE_5_INCH ? 30 :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? 4 : 
    bearingCapDiameterOrig;

// BEARING CAP PROTRUSION (center cap)
function bearingCapProtrusion() =
    modelSize == SCALE_7_INCH ? 8 :
    modelSize == SCALE_5_INCH ? 5 :
    modelSize == SCALE_3D_PRINT ? 1 :
    modelSize == SCALE_25 ? 1 : 
    bearingCapProtrusionOrig;

// BEARING CAP ROUNDNESS (center cap)
function bearingCapCornerRadius() =
    modelSize == SCALE_7_INCH ? 5 :
    modelSize == SCALE_5_INCH ? 5 :
    modelSize == SCALE_3D_PRINT ? 0.5 :
    modelSize == SCALE_25 ? 0 : 
    bearingCapCornerRadiusOrig;

// BEARING CAP BOLT DIAMETER (size of hole for bolt to go through)
function bearingCapBoltDiameter() =
    modelSize == SCALE_7_INCH ? 5 :
    modelSize == SCALE_5_INCH ? 5 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    bearingCapBoltDiameterOrig;

// BEARING CAP BOLT HEAD SIZE (size of spanner)
function bearingCapBoltSize() =
    modelSize == SCALE_7_INCH ? 8 :
    modelSize == SCALE_5_INCH ? 8 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    bearingCapBoltSizeOrig;

// BEARING CAP BOLT HEAD HEIGHT (how far the bolt head protrudes from the surface)
//    (washer is additional to this - subtract washer thickness if using flanged bolt)
function bearingCapBoltThickness() =
    modelSize == SCALE_7_INCH ? 4.2 :
    modelSize == SCALE_5_INCH ? 4 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    bearingCapBoltThicknessOrig;

// BEARING CAP BOLT THREAD LENGTH (excluding head thickness)
function bearingCapBoltLength() =
    modelSize == SCALE_7_INCH ? 25 :
    modelSize == SCALE_5_INCH ? 25 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    bearingCapBoltLengthOrig;

// BEARING CAP BOLT WASHER DIAMETER
function bearingCapBoltWasherDiameter() =
    modelSize == SCALE_7_INCH ? 11.8 :
    modelSize == SCALE_5_INCH ? 4 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    bearingCapBoltWasherDiameterOrig;

// BEARING CAP BOLT WASHER THICKNESS
function bearingCapBoltWasherThickness() =
    modelSize == SCALE_7_INCH ? 1.4 :
    modelSize == SCALE_5_INCH ? 4 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    bearingCapBoltWasherThicknessOrig;

// BEARING CAP BOLT OFFSET OUTER EDGE
function bearingCapBoltOffsetOuterEdge() =
    modelSize == SCALE_7_INCH ? 2 :
    modelSize == SCALE_5_INCH ? 4 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    bearingCapBoltOffsetOuterEdgeOrig;

// NOSE STEEL THICKNESS
function noseSteelThickness() = 
    modelSize == SCALE_7_INCH ? 3 / scale() :
    modelSize == SCALE_5_INCH ? 3 / scale() :
    modelSize == SCALE_3D_PRINT ? 1 :
    modelSize == SCALE_25 ? 1 : 
    3;

// CAB STEEL THICKNESS
function cabSteelThickness() = 
    modelSize == SCALE_7_INCH ? 3 / scale() :
    modelSize == SCALE_5_INCH ? 3 / scale() :
    modelSize == SCALE_3D_PRINT ? 1 :
    modelSize == SCALE_25 ? 1 : 
    3;

// CHASSIS STEEL THICKNESS
function chassisSteelThickness() = 
    modelSize == SCALE_7_INCH ? 8 / scale() :
    modelSize == SCALE_5_INCH ? 8 / scale() :
    modelSize == SCALE_3D_PRINT ?  2 :
    modelSize == SCALE_25 ? 2 : 
    8;

// AXLE DIAMETER
function axleDiameter() = 
    modelSize == SCALE_7_INCH ? 20 :
    modelSize == SCALE_5_INCH ? 16 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    85;

// AXLE LENGTH
function axleLength() = 
    showJournalAssemblies
        ? chassisWidth() - (journalBlockProtrusion*2 + journalBlockThickness())
        : wheelTrackWidth() - wheelFlangeWidth() * 2
        ;

function axleOffsetLeft() =
    showJournalAssemblies
        ? journalBlockProtrusion + journalBlockThickness()/2
        : (chassisWidth() - (wheelTrackWidth() - wheelFlangeWidth() * 2)) / 2
        ;

function rearAxleOffset() = 
    modelSize == SCALE_7_INCH ? (730 + 380/2) / scale() :
    modelSize == SCALE_5_INCH ? (730 + 380/2) / scale() :
    modelSize == SCALE_3D_PRINT ? (730 + (380 / 2)) / scale() : 
    modelSize == SCALE_25 ? (730 + (380 / 2)) / scale() :  
    (730 + 380/2);

function frontAxleOffset() = 
    modelSize == SCALE_7_INCH ? chassisLength() - ((650 + 380/2) / scale()) :
    modelSize == SCALE_5_INCH ? chassisLength() - ((650 + 380/2) / scale()) :
    modelSize == SCALE_3D_PRINT ? chassisLength() - ((650 + 380 / 2) / scale()) :
    modelSize == SCALE_25 ? chassisLength() - ((650 + 380 / 2) / scale()) :
    chassisLength() - (650 + 380/2);

function wheelDiameter() = 
    modelSize == SCALE_7_INCH ? 150 :
    modelSize == SCALE_5_INCH ? 80 :
    modelSize == SCALE_3D_PRINT ? 16 :
    modelSize == SCALE_25 ? 450 / scale() : 
    450;

function wheelWidth() = 
    modelSize == SCALE_7_INCH ? 18 :
    modelSize == SCALE_5_INCH ? 16 :
    modelSize == SCALE_3D_PRINT ? 3 :
    modelSize == SCALE_25 ? 160 / scale() : 
    50;

function wheelFlangeWidth() = 
    modelSize == SCALE_7_INCH ? 3 :
    modelSize == SCALE_5_INCH ? 3 :
    modelSize == SCALE_3D_PRINT ? 60 / scale() :
    modelSize == SCALE_25 ? 60 / scale() : 
    12;

function wheelFlangeHeight() = 
    modelSize == SCALE_7_INCH ? 5 :
    modelSize == SCALE_5_INCH ? 5 :
    modelSize == SCALE_3D_PRINT ? 50 / scale() :
    modelSize == SCALE_25 ? 50 / scale() : 
    5;

function wheelTrackWidth() = 
    modelSize == SCALE_7_INCH ? 184 : 
    modelSize == SCALE_5_INCH ? 127 : 
    modelSize == SCALE_3D_PRINT ? chassisWidth() - wheelWidth()*2 - journalBlockThickness() - journalBlockProtrusion - axleDiameter() :
    modelSize == SCALE_25 ? 26 : 
    1067;
