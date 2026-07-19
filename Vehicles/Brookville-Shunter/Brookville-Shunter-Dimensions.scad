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
function modelScale() = (modelSize == SCALE_7_INCH ? 4.5 : modelSize == SCALE_5_INCH ? 8.4 : modelSize == SCALE_3D_PRINT ? 50 : modelSize == SCALE_25 ? 25 : 1);

// PRINTING TOLERANCE
function tolerance() =
    printMode == PRINT_MODE_MILLING_MS_TOLERANCE ? 0.2 :
    printMode == PRINT_MODE_PRINTING_PLA_TOLERANCE ? 1 :
    printMode == PRINT_MODE_NO_TOLERANCE ? 0 :
    0;

// nose
noseWidth = 1200 / modelScale();
noseLength = 1090 / modelScale();
noseHeightCenter = 1070 / modelScale();
noseHeightSides = 960 / modelScale();
noseCornerRadius = 120 / modelScale();
noseApexRadius = 120 / modelScale();
noseColor = "Yellow";

noseFrontWindowWidth = noseWidth - 20 / modelScale();
noseFrontWindowHeight = noseHeightCenter - 330 / modelScale();
noseFrontGrilleLouvreDistance = 30 / modelScale();
noseFrontGrilleLouvreThickness = 4 / modelScale();
noseFrontGrilleLouvreWidth = 50 / modelScale();
noseFrontGrilleLouvreAngle = -55;
noseFrontGrilleWidth = noseFrontWindowWidth;
noseFrontGrilleHeight = noseFrontWindowHeight;
noseFrontGrilleThickness = 50 / modelScale();
noseFrontGrilleProtrusionFront = 5 / modelScale();
noseFrontGrilleColor = "#ffe032";
noseFrontGrilleBorderWidth = 60 / modelScale();

noseDoorHeight = 730 / modelScale();
noseDoorWidth = 540 / modelScale();
noseDoorOffsetFront = 5 / modelScale();
noseDoorFrameWidth = 40 / modelScale();
noseDoorColor = "#fff239";

noseDoorWindowWidth = 300 / modelScale();
noseDoorWindowHeight = 300 / modelScale();
noseDoorWindowOffsetBottom = 200 / modelScale();

noseDoorWindowLouvreDistance = 15 / modelScale();
noseDoorWindowLouvreThickness = 2 / modelScale();
noseDoorWindowLouvreWidth = 20 / modelScale();
noseDoorWindowLouvreAngle = -50;
noseDoorWindowThickness = 10 / modelScale();
noseDoorWindowProtrusionFront = 3 / modelScale();
noseDoorWindowColor = "Yellow";
noseDoorWindowBorderWidth = 20 / modelScale();

noseExhaustDiameter = 65 / modelScale();
noseExhaustThickness = 3 / modelScale();
noseExhaustLength = 50 / modelScale();
noseExhaustOffsetBack = 90 / modelScale();
noseExhaustOffsetLeft = ((1200 / 2 - 310) + 65) / modelScale();
noseExhaustColor = "Black";

noseAirIntakeDiameter = 80 / modelScale();
noseAirIntakeThickness = 3 / modelScale();
noseAirIntakeLength = 100 / modelScale();
noseAirIntakeOffsetFront = 150 / modelScale();
noseAirIntakeOffsetRight = ((1200 / 2 - 80) - 80) / modelScale();

noseAirIntakeFilterHousingDiameter = 165 / modelScale();
noseAirIntakeFilterHousingThickness = 20 / modelScale();
noseAirIntakeFilterHousingOffsetBottom = 60 / modelScale();
noseAirIntakeColor = "Black";

noseFuelInputDiameter = 70 / modelScale();
noseFuelInputThickness = 3 / modelScale();
noseFuelInputLength = 0 / modelScale();
noseFuelInputOffsetFront = 160 / modelScale();
noseFuelInputOffsetRight = ((1200 / 2 - 70) - 340) / modelScale();
noseFuelInputColor = "Black";

// cab
cabLength = 1730 / modelScale();
cabWidth = 2220 / modelScale();
cabHeightCenter = 2280 / modelScale();
cabHeightSides = 2080 / modelScale();
cabCornerRadius = 50 / modelScale();
cabRoofOverhangFront = 19 / modelScale();
cabRoofOverhangBack = 19 / modelScale();
cabRoofOverhangSide = 19 / modelScale();
cabColor = "Yellow";

// cab side windows
leftWindowWidth = 980 / modelScale();
leftWindowHeight = 720 / modelScale();
leftWindowOffsetBottom = 1220 / modelScale();
leftWindowOffsetFront = 60 / modelScale();
leftWindowCornerRadius = 70 / modelScale();

rightWindowWidth = 980 / modelScale();
rightWindowHeight = 720 / modelScale();
rightWindowOffsetBottom = 1220 / modelScale();
rightWindowOffsetFront = 100 / modelScale();
rightWindowCornerRadius = 70 / modelScale();

// cab front windows
frontSideWindowWidth = 500 / modelScale();
frontSideWindowHeightLong = 610 / modelScale();
frontSideWindowHeightShort = 540 / modelScale();
frontSideWindowOffsetBottom = (510 + 1070) / modelScale();
frontSideWindowCornerRadius = 70 / modelScale();
frontSideWindowOffsetSide = 120 / modelScale();

frontCenterWindowWidth = 430 / modelScale();
frontCenterWindowHeight = 430 / modelScale();
frontCenterWindowOffsetBottom = (430 + 1070) / modelScale();
frontCenterWindowCornerRadius = 70 / modelScale();

// cab doors
doorWidth = 460 / modelScale();
doorHeight = 1800 / modelScale();
doorOffsetBack = 120 / modelScale();
doorOffsetBottom = 230 / modelScale();
doorColor = "#fff239";

doorWindowWidth = 320 / modelScale();
doorWindowHeight = 720 / modelScale();
doorWindowOffsetBottom = 1220 / modelScale();
doorWindowCornerRadius = 70 / modelScale();
doorHandleDiameter = 40 / modelScale();
doorHandleLength = 30 / modelScale();
doorHandleOffsetBack = 400 / modelScale();
doorHandleOffsetBottom = (50 + 1070) / modelScale();
doorHandleColor = "Black";

// cab steps
stepsHeight = 40 / modelScale();
stepsWidth = 40 / modelScale();
stepsThickness = 20 / modelScale();
step1Thickness = 20 / modelScale();
step1OffsetBottom = 40 / modelScale();

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

chassisCornerJigThickness = 10;
chassisCornerJigLength = 50;
chassisCornerJigTolerance = 0.3;
chassisCornerJigInset = 20;
chassisCornerJigCenterHoleDiameter = 6;

chassisBoltSizeOrig = 36;
chassisBoltThicknessOrig = 20;

// hitch block
hitchBlockColor = "DarkSlateGray";
hitchBlockWidth = 290 / modelScale();
hitchBlockHeight = 260 / modelScale();
hitchBlockLength = 290 / modelScale();
hitchBlockCornerRadius = (modelSize == SCALE_FULL) ? 5 / modelScale() : 0;
hitchMountPlateWidth = 720 / modelScale();
hitchMountPlateThickness = 20 / modelScale();
hitchMountPlateHeight = 460 / modelScale();
hitchMountPlateCornerRadius = (modelSize == SCALE_FULL) ? 2 / modelScale() : 0;
hitchPointDiameterBig = 280 / modelScale();
hitchPointDiameterSmall = 120 / modelScale();
hitchPointLength = 300 / modelScale();
hitchChainTagWidth = 50 / modelScale();
hitchChainTagLength = 90 / modelScale();
hitchChainColor = "Black";
hitchChainLength = 160 / modelScale();
hitchChainWidth = 90 / modelScale();
hitchChainThickness = 35 / modelScale();
hitchChainNumberOfLinks = 3;
hitchChainHookLength = 295 / modelScale();
hitchChainHookWidth = 150 / modelScale();
hitchChainHookThickness = 45 / modelScale();

hitchNotchWidth = 80 / modelScale();
hitchNotchLength = 260 / modelScale();
hitchNotchDepth = 140 / modelScale();
hitchNotchCornerRadius = (modelSize == SCALE_FULL) ? 30 / modelScale() : 0;

// wheel holes
wheelHoleWidth = 380 / modelScale();
wheelHoleHeight = 150 / modelScale();

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
    modelSize == SCALE_25 ? chassisWidthOrig / modelScale() : 
    chassisWidthOrig;

// CHASSIS HEIGHT
function chassisHeight() =
    //modelSize == SCALE_7_INCH ? 105 :
    modelSize == SCALE_7_INCH ? 100 :
    modelSize == SCALE_5_INCH ? chassisHeightOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? 9.4 :
    modelSize == SCALE_25 ? chassisHeightOrig / modelScale() : 
    chassisHeightOrig;

// CHASSIS CORNER RADIUS
function chassisCornerRadius() =
    modelSize == SCALE_7_INCH ? chassisCornerRadiusOrig / modelScale() :
    modelSize == SCALE_5_INCH ? chassisCornerRadiusOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    chassisCornerRadiusOrig;

// CHASSIS CORNER LENGTH
function chassisCornerLength() =
    modelSize == SCALE_7_INCH ? chassisCornerLengthOrig / modelScale() :
    modelSize == SCALE_5_INCH ? chassisCornerLengthOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? chassisCornerLengthOrig / modelScale() : 
    chassisCornerLengthOrig;

// CHASSIS CORNER BOLT OFFSET
function chassisCornerBoltOffset() =
    modelSize == SCALE_7_INCH ? chassisCornerBoltOffsetOrig / modelScale() :
    modelSize == SCALE_5_INCH ? chassisCornerBoltOffsetOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? chassisCornerBoltOffsetOrig / modelScale() : 
    chassisCornerBoltOffsetOrig;

// CHASSIS BOLT SIZE
function chassisBoltSize() =
    modelSize == SCALE_7_INCH ? chassisBoltSizeOrig / modelScale() :
    modelSize == SCALE_5_INCH ? chassisBoltSizeOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? chassisBoltSizeOrig / modelScale() : 
    chassisBoltSizeOrig;

// CHASSIS BOLT THICKNESS
function chassisBoltThickness() =
    modelSize == SCALE_7_INCH ? chassisBoltThicknessOrig / modelScale() :
    modelSize == SCALE_5_INCH ? chassisBoltThicknessOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? chassisBoltThicknessOrig / modelScale() : 
    chassisBoltThicknessOrig;



// JOURNAL ASSEMBLY

// PEDESTAL
pedestalColor = "#444852";
pedestalWidthOrig = 650;
pedestalHeightOrig = 400;
pedestalThicknessOrig = 165;
pedestalWidthTopOrig = 850;
pedestalEdgeRadiusOrig = 5;
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
journalBlockProtrusion = 30 / modelScale();
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

function showNosePipes() = modelScale() < 30;

// PEDESTAL WIDTH
function pedestalWidth() =
    modelSize == SCALE_7_INCH ? 126 :
    modelSize == SCALE_5_INCH ? pedestalWidthOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? pedestalWidthOrig / modelScale() :
    modelSize == SCALE_25 ? pedestalWidthOrig / modelScale() : 
    pedestalWidthOrig;

// PEDESTAL WIDTH TOP
function pedestalWidthTop() =
    modelSize == SCALE_7_INCH ? 180 :
    modelSize == SCALE_5_INCH ? pedestalWidthTopOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? pedestalWidthTopOrig / modelScale() :
    modelSize == SCALE_25 ? pedestalWidthTopOrig / modelScale() : 
    pedestalWidthTopOrig;

// PEDESTAL HEIGHT
function pedestalHeight() =
    modelSize == SCALE_7_INCH ? 100 :
    modelSize == SCALE_5_INCH ? pedestalHeightOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? pedestalHeightOrig / modelScale() :
    modelSize == SCALE_25 ? pedestalHeightOrig / modelScale() : 
    pedestalHeightOrig;

// PEDESTAL THICKNESS
function pedestalThickness() =
    modelSize == SCALE_7_INCH ? 24 :
    modelSize == SCALE_5_INCH ? 15 :
    modelSize == SCALE_3D_PRINT ? 4 :
    modelSize == SCALE_25 ? 3 : 
    pedestalThicknessOrig;

// PEDESTAL EDGE RADIUS   
function pedestalEdgeRadius() =
    modelSize == SCALE_7_INCH ? 5 :
    modelSize == SCALE_5_INCH ? 4 :
    modelSize == SCALE_3D_PRINT ? 0 :
    modelSize == SCALE_25 ? 0 : 
    pedestalEdgeRadiusOrig;

// PEDESTAL CORNER RADIUS   
function pedestalCornerRadius() =
    modelSize == SCALE_7_INCH ? 20 :
    modelSize == SCALE_5_INCH ? 15 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    pedestalCornerRadiusOrig;

// PEDESTAL BOLT HOLE DIAMETER (will be tapped)
function pedestalBoltHoleDiameter() =
    modelSize == SCALE_7_INCH ? 8.5 :
    modelSize == SCALE_5_INCH ? 6.5 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    pedestalBoltHoleDiameterOrig;

// PEDESTAL INNER BOLT HOLE DEPTH 
function pedestalBoltHoleDepth() =
    modelSize == SCALE_7_INCH ? 75 :
    modelSize == SCALE_5_INCH ? 40 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    pedestalBoltHoleDepthOrig;

// PEDESTAL OUTER BOLT HOLE DEPTH
function pedestalOuterBoltHoleDepth() =
    modelSize == SCALE_7_INCH ? 40 :
    modelSize == SCALE_5_INCH ? 40 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    pedestalOuterBoltHoleDepthOrig;

// PEDESTAL BOLT HOLE SPACING INNER
function pedestalBoltHoleSpacing() = 100;

// PEDESTAL BOLT HOLE SPACING OUTER
function pedestalOuterBoltHoleSpacing() = 150;

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
    modelSize == SCALE_7_INCH ? 12 :
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
    modelSize == SCALE_7_INCH ? 84 :
    modelSize == SCALE_5_INCH ? journalBlockWidthOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? journalBlockWidthOrig / modelScale() :
    modelSize == SCALE_25 ? journalBlockWidthOrig / modelScale() : 
    journalBlockWidthOrig;

// JOURNAL BLOCK HEIGHT
function journalBlockHeight() =
    modelSize == SCALE_7_INCH ? 76 :
    modelSize == SCALE_5_INCH ? journalBlockHeightOrig / modelScale() :
    modelSize == SCALE_3D_PRINT ? journalBlockHeightOrig / modelScale() :
    modelSize == SCALE_25 ? journalBlockHeightOrig / modelScale() : 
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
    modelSize == SCALE_7_INCH ? 3 / modelScale() :
    modelSize == SCALE_5_INCH ? 3 / modelScale() :
    modelSize == SCALE_3D_PRINT ? 1 :
    modelSize == SCALE_25 ? 1 : 
    3;

// CAB STEEL THICKNESS
function cabSteelThickness() = 
    modelSize == SCALE_7_INCH ? 3 / modelScale() :
    modelSize == SCALE_5_INCH ? 3 / modelScale() :
    modelSize == SCALE_3D_PRINT ? 1 :
    modelSize == SCALE_25 ? 1 : 
    3;

// CHASSIS STEEL THICKNESS
function chassisSteelThickness() = 
    modelSize == SCALE_7_INCH ? 5 :
    modelSize == SCALE_5_INCH ? 8 / modelScale() :
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
    modelSize == SCALE_7_INCH ? (730 + 380/2) / modelScale() :
    modelSize == SCALE_5_INCH ? (730 + 380/2) / modelScale() :
    modelSize == SCALE_3D_PRINT ? (730 + (380 / 2)) / modelScale() : 
    modelSize == SCALE_25 ? (730 + (380 / 2)) / modelScale() :  
    (730 + 380/2);

function frontAxleOffset() = 
    modelSize == SCALE_7_INCH ? chassisLength() - ((650 + 380/2) / modelScale()) :
    modelSize == SCALE_5_INCH ? chassisLength() - ((650 + 380/2) / modelScale()) :
    modelSize == SCALE_3D_PRINT ? chassisLength() - ((650 + 380 / 2) / modelScale()) :
    modelSize == SCALE_25 ? chassisLength() - ((650 + 380 / 2) / modelScale()) :
    chassisLength() - (650 + 380/2);

function wheelDiameter() = 
    modelSize == SCALE_7_INCH ? 150 :
    modelSize == SCALE_5_INCH ? 80 :
    modelSize == SCALE_3D_PRINT ? 16 :
    modelSize == SCALE_25 ? 450 / modelScale() : 
    450;

function wheelWidth() = 
    modelSize == SCALE_7_INCH ? 18 :
    modelSize == SCALE_5_INCH ? 16 :
    modelSize == SCALE_3D_PRINT ? 3 :
    modelSize == SCALE_25 ? 160 / modelScale() : 
    50;

function wheelFlangeWidth() = 
    modelSize == SCALE_7_INCH ? 3 :
    modelSize == SCALE_5_INCH ? 3 :
    modelSize == SCALE_3D_PRINT ? 60 / modelScale() :
    modelSize == SCALE_25 ? 60 / modelScale() : 
    12;

function wheelFlangeHeight() = 
    modelSize == SCALE_7_INCH ? 5 :
    modelSize == SCALE_5_INCH ? 5 :
    modelSize == SCALE_3D_PRINT ? 50 / modelScale() :
    modelSize == SCALE_25 ? 50 / modelScale() : 
    5;

function wheelTrackWidth() = 
    modelSize == SCALE_7_INCH ? 184 : 
    modelSize == SCALE_5_INCH ? 127 : 
    modelSize == SCALE_3D_PRINT ? chassisWidth() - wheelWidth()*2 - journalBlockThickness() - journalBlockProtrusion - axleDiameter() :
    modelSize == SCALE_25 ? 26 : 
    1067;
