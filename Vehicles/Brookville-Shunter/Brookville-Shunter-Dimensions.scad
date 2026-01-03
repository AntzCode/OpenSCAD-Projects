// scale factor for translating to a model size
function scale() = (modelSize == SCALE_7_INCH ? 4.5 : modelSize == SCALE_3D_PRINT ? 50 : modelSize == SCALE_25 ? 25 : 1);

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
noseFrontGrilleLouvreAngle = -70;
noseFrontGrilleWidth = noseFrontWindowWidth;
noseFrontGrilleHeight = noseFrontWindowHeight;
noseFrontGrilleThickness = 50 / scale();
noseFrontGrilleProtrusionFront = 3 / scale();
noseFrontGrilleColor = "Yellow";
noseFrontGrilleBorderWidth = 60 / scale();

noseDoorHeight = 730 / scale();
noseDoorWidth = 540 / scale();
noseDoorOffsetFront = 5 / scale();
noseDoorFrameWidth = 40 / scale();
noseDoorColor = "Gold";

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
doorColor = "Gold";

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
chassisWidth = 1600 / scale();
chassisHeight = 470 / scale();
chassisLength = cabLength + noseLength + (30 / scale());
chassisCornerRadius = 100 / scale();
chassisColor = "Black";

// hitch block
hitchBlockColor = "DarkSlateGray";
hitchBlockWidth = 290 / scale();
hitchBlockHeight = 260 / scale();
hitchBlockLength = 290 / scale();
hitchBlockCornerRadius = 5 / scale();
hitchMountPlateWidth = 720 / scale();
hitchMountPlateThickness = 20 / scale();
hitchMountPlateHeight = 460 / scale();
hitchMountPlateCornerRadius = 2 / scale();
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
hitchNotchCornerRadius = 30 / scale();

// wheel holes
wheelHoleWidth = 380 / scale();
wheelHoleHeight = 150 / scale();

// bearing housing
bearingHousingBlockThickness = 160 / scale();
bearingHousingBlockWidth = 380 / scale();
bearingHousingBlockHeight = 300 / scale();
bearingHousingBlockProtrusion = 30 / scale();
bearingHousingDiameter = 160 / scale();
bearingHousingProtrusion = 28 / scale();
bearingHousingPlateDiameter = 280 / scale();
bearingHousingPlateThickness = 18 / scale();
bearingHousingCornerRadius = 5 / scale();
bearingHousingBoltSize = 22 / scale();
bearingHousingBoltProtrusion = 14 / scale();
wheelBearingGap = 0.1;

wheelColor = "Red";
wheelFlangeColor = "DarkRed";

function showNosePipes() = scale() < 30;

function noseSteelThickness() = 
    modelSize == SCALE_7_INCH ? 3 / scale() :
    modelSize == SCALE_3D_PRINT ? 1 :
    modelSize == SCALE_25 ? 1 : 
    3;

function cabSteelThickness() = 
    modelSize == SCALE_7_INCH ? 3 / scale() :
    modelSize == SCALE_3D_PRINT ? 1 :
    modelSize == SCALE_25 ? 1 : 
    3;

function chassisSteelThickness() = 
    modelSize == SCALE_7_INCH ? 8 / scale() :
    modelSize == SCALE_3D_PRINT ?  2 :
    modelSize == SCALE_25 ? 2 : 
    8;

// axles
function axleDiameter() = 
    modelSize == SCALE_7_INCH ? 20 :
    modelSize == SCALE_3D_PRINT ? 2 :
    modelSize == SCALE_25 ? 2 : 
    85;

function axleLength() = 
    showHotBoxes
        ? chassisWidth - (bearingHousingBlockProtrusion*2 + bearingHousingBlockThickness)
        : wheelTrackWidth() - wheelFlangeWidth() * 2
        ;

function axleOffsetLeft() =
    showHotBoxes
        ? bearingHousingBlockProtrusion + bearingHousingBlockThickness/2
        : (chassisWidth - (wheelTrackWidth() - wheelFlangeWidth() * 2)) / 2
        ;

function rearAxleOffset() = 
    modelSize == SCALE_7_INCH ? (730 + 380/2) / scale() :
    modelSize == SCALE_3D_PRINT ? (730 + (380 / 2)) / scale() : 
    modelSize == SCALE_25 ? (730 + (380 / 2)) / scale() :  
    (730 + 380/2);

function frontAxleOffset() = 
    modelSize == SCALE_7_INCH ? chassisLength - ((650 + 380/2) / scale()) :
    modelSize == SCALE_3D_PRINT ? chassisLength - ((650 + 380 / 2) / scale()) :
    modelSize == SCALE_25 ? chassisLength - ((650 + 380 / 2) / scale()) :
    chassisLength - (650 + 380/2);

function wheelDiameter() = 
    modelSize == SCALE_7_INCH ? 450 /scale() :
    modelSize == SCALE_3D_PRINT ? 450 / scale() :
    modelSize == SCALE_25 ? 450 / scale() : 
    450;

function wheelWidth() = 
    modelSize == SCALE_7_INCH ? 18 :
    modelSize == SCALE_3D_PRINT ? 160 / scale() :
    modelSize == SCALE_25 ? 160 / scale() : 
    50;

function wheelFlangeWidth() = 
    modelSize == SCALE_7_INCH ? 3 :
    modelSize == SCALE_3D_PRINT ? 60 / scale() :
    modelSize == SCALE_25 ? 60 / scale() : 
    12;

function wheelFlangeHeight() = 
    modelSize == SCALE_7_INCH ? 5 :
    modelSize == SCALE_3D_PRINT ? 50 / scale() :
    modelSize == SCALE_25 ? 50 / scale() : 
    5;

function wheelTrackWidth() = 
    modelSize == SCALE_7_INCH ? 184 : 
    modelSize == SCALE_3D_PRINT ? chassisWidth - wheelWidth()*2 - bearingHousingBlockThickness - bearingHousingBlockProtrusion - axleDiameter() :
    modelSize == SCALE_25 ? 26 : 
    1067;
