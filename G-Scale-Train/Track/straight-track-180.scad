include<./libraries/BOSL/constants.scad>
use<./libraries/BOSL/shapes.scad>

include<./libraries/Round-Anything/polyround.scad>

$fn = 32;

// basic settings

isLevelCrossing = false;
drawSupports = false;

// couple style
//   - SR (Service Railway)
//   - EP (Easy Print)
coupleStyleNorth = "SR";
coupleStyleSouth = "EP";

// advanced settings

railWidth = 4;
railHeight = 8;
railLength = 180;
railHeelWidth = 9.5;
railHeelHeight = 3;
railSpacing = 45;
railCornerRadius = 1;
leftRailOffset = 5;
sleeperLength = 92;
sleeperWidth = 10;
sleeperHeight = 8;
sleeperCornerRadius = 1.5;
nailPlateHeight = 1.2;
nailPlateWidth = 6;
nailPlateLength = 5;
nailPlateRailOverlap = 2;
nailPlateCornerRadius = 0.4;
nailPlateNailRadius = 0.8;
nailPlateNailHeight = 0.5;
railOverhang = 15;
numberOfSleepers = 6;

coupleTolerance = 0.6;
coupleLength = 22;
coupleNotchDiameter = 3;
coupleNotchTightness = 1.2;
coupleNotchOffset = 4;
coupleThickness = 2.5;
coupleSide = "left";

roadWidth = 100;
roadSidesBevel = 25;
roadRampLength = 60;
roadRampEdgeRadius = 2;
roadHeightDifference = 2;

wheelFlangeHeight = 4;
wheelFlangeWidth = 3;

supportPlateThickness = 1;
supportPlateGap = 0.3;

include<./components.scad> use<./components.scad>

if (isLevelCrossing) {
    drawLevelCrossing();
}

// sleepers
translate([ sleeperOffsetSouth(), 0, 0 ]) {
    sleepers();
}

// left rail
translate([ railLength, sleeperLength, 0 ]) {
    rotate([ 0, 0, 180 ]) {
        translate([ -leftRailOffset / 2, sleeperRailOffset(), sleeperHeight ]) {
            makeRail(coupleStyleSouth, coupleStyleNorth){};
        }
    }
}

// right rail
translate([ 0, sleeperRailOffset(), sleeperHeight ]) {
    makeRail(coupleStyleNorth, coupleStyleSouth){};
}

// guide - to check that the track spacing is correct
*translate([ sleeperOffsetNorth(), sleeperLength / 2 - railSpacing / 2, sleeperHeight ]) {
    cube([ 5, railSpacing, 15]){};
}
