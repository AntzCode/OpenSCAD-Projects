include<./libraries/BOSL/constants.scad>
use<./libraries/BOSL/shapes.scad>

include<./libraries/Round-Anything/polyround.scad>

$fn = 32;

// basic settings

drawSupports = false;

leftTypes = ["straight", "curved", "none"];
rightTypes = ["straight", "curved", "none"];

ballastColor = "brown";
basePlateColor = "gray";

// the radius from the center of the track to the center of a road circle
roadCurveRadius = 1000;

// the length of a straight section of track
roadSectionLength = 228;

// the distance between the inner rail sides
railSpacing = 45;

// the width of the track
railWidth = 4;

// the height of the track
railHeight = 9;

railHeelWidth = 9.5;
railHeelHeight = 3;

railCornerRadius = 0; 

// the width of the ballast
ballastWidth = 50;

// the height of the ballast
ballastHeight = 10.5;

// the thickness of the ballast shell
ballastShellThickness = 1;

// the width of the ballast bevel
ballastBevelWidth = 10;

// the offset of the ballast bevel from the ground to the start of the bevel
ballastBevelOffsetY = 3;

// the radius of the ballast corners at the top of the ballast slope
ballastBevelTopRadius = 5;

// the radius of the ballast corners at the bottom of the ballast slope
ballastBevelBottomRadius = 2;

// the radius of the corners of the base plate sections
basePlateCornerRadius = 3;

// the diameter of the pins of the join sections
basePlatePinDiameter = 5.8;

// the length of the pins of the join sections
basePlatePinLength = 6;

// the min-width of the area surrounding the pins of the base plate sections
basePlatePinBorder = 12;

basePlatePinPairCenterSpacingCrosswise = 26;

// the thickness of the base plate of the base plate sections
basePlateThickness = 1.5;

// the length of the cutout/extension that interlocks adjacent base plates
basePlateInterlockingLength = basePlatePinLength + basePlatePinBorder*2;

// the clearance between the adjacent base plates of the base plate sections
basePlateInterlockingClearance = 2;

// the number of railway sectors that form a full circle track 
numberOfSectorsPerCurve = 30;

// how many pairs of pins are in a sector
numberOfPinPairsPerSector = 3;

sleeperWidth = 9;
sleeperHeight = 8.5;
sleeperLength = 92;
sleeperCornerRadius = 2;
numberOfSleepersPerSection = 7;

nailPlateHeight = 1.2;
nailPlateWidth = 6;
nailPlateLength = 5;
nailPlateRailOverlap = 2;
nailPlateCornerRadius = 0.4;
nailPlateNailRadius = 0.8;
nailPlateNailHeight = 0.5;

coupleTolerance = 0.8;
coupleLength = 22;
coupleNotchDiameter = 3;
coupleNotchTightness = 1.2;
coupleNotchOffset = 4;
coupleThickness = 2.5;
coupleSide = "left";

wheelFlangeHeight = 4;
wheelFlangeWidth = 3;

supportPlateThickness = 1;
supportPlateGap = 0.3;

function railSpacingCenters() = railSpacing + railWidth;

function roadCurveInnerBallastRadius() = roadCurveRadius - ballastWidth / 2;

function roadCurveOuterBallastRadius() = roadCurveRadius + ballastWidth / 2;

function roadCurveInnerRailCenterRadius() = roadCurveRadius - railSpacingCenters() / 2;

function roadCurveOuterRailCenterRadius() = roadCurveRadius + railSpacingCenters() / 2;

function roadCurveCircumference() = 2 * pi * roadCurveRadius;

function roadCurveInnerRailCenterCircumference() = 2 * pi * roadCurveInnerRailCenterRadius();

function roadCurveOuterRailCenterCircumference() = 2 * pi * roadCurveOuterRailCenterRadius();

function roadCurveSectionLength() = roadCurveCircumference() / numberOfSectorsPerCurve;
function roadStraightSectionLength() = roadSectionLength;

function roadCurveInnerRailSectionLength() = roadCurveInnerRailCenterCircumference() / numberOfSectorsPerCurve;

function roadCurveOuterRailSectionLength() = roadCurveOuterRailCenterCircumference() / numberOfSectorsPerCurve;

function roadCurveInnerBallastSectionLength() = roadCurveInnerBallastRadius() * 2 * pi / numberOfSectorsPerCurve;

function roadCurveOuterBallastSectionLength() = roadCurveOuterBallastRadius() * 2 * pi / numberOfSectorsPerCurve;

function railCenterBallastOffset() = (ballastWidth - railSpacingCenters()) / 2;

function ballastPinTubeOuterDiameter() = (basePlatePinDiameter + ballastShellThickness*2);

function ballastPinTubeInnerDiameter() = (basePlatePinDiameter);

function basePlatePinSpacingCenterLengthwise() = roadSectionLength / numberOfPinPairsPerSector;
function basePlatePinSpacingCenterCrosswise() = basePlatePinPairCenterSpacingCrosswise;

function sleeperRailOffset() = (sleeperLength - railSpacing - railWidth * 2 - railHeelWidth);

// distance from the end of the sleeper to the outer edge of the rail heel
function railHeelOffset() = (railHeelWidth - railWidth) / 2;

module railShape(){
    color("green") polygon(polyRound([
        [0, 0, 0],
        [railHeelWidth, 0, railCornerRadius],
        [railHeelWidth, railHeelHeight, railCornerRadius],
        [railHeelWidth - (railHeelWidth-railWidth) /2, railHeelHeight, railCornerRadius],
        [railHeelWidth - (railHeelWidth-railWidth) /2, railHeelHeight + railHeight, railCornerRadius],
        [(railHeelWidth-railWidth) /2, railHeelHeight + railHeight, railCornerRadius],
        [(railHeelWidth-railWidth) /2, railHeelHeight, railCornerRadius],
        [0, railHeelHeight, railCornerRadius],
        [0, 0, railCornerRadius]
    ], 30));
}

module basePlateSectionRoundCorner() {
    cylinder(r=basePlateCornerRadius, h=basePlateThickness);
}

module basePlateSectionSquareCorner() {
    translate([0, 0, basePlateThickness/2])
    cuboid([basePlateCornerRadius*2, basePlateCornerRadius*2, basePlateThickness]);
}

module drawLeftSectionLeftRail() { 
    color("gray")
    translate([0, railCenterBallastOffset() - railWidth/2, ballastHeight])
    rotate([0, 270, 0])
    linear_extrude(height=roadStraightSectionLength()/2)
    polygon(polyRound([
        [0, 0, 0],
        [0, railWidth, 0],
        [railHeight, railWidth, 0],
        [railHeight, 0, 0],
        [0, 0, 0]
    ], 32));
}

module drawLeftSectionRightRail() { 
    color("gray")
    translate([0, (ballastWidth - railCenterBallastOffset() - railWidth/2), ballastHeight])
    rotate([0, 270, 0])
    linear_extrude(height=roadStraightSectionLength()/2)
    polygon(polyRound([
        [0, 0, 0],
        [0, railWidth, 0],
        [railHeight, railWidth, 0],
        [railHeight, 0, 0],
        [0, 0, 0]
    ], 32));
}

module drawLeftStraightBallastShell(){
    color(ballastColor) 
    translate([0, 0, 0])
    rotate([0, 270, 0])
    linear_extrude(height=roadStraightSectionLength() / 2)
    polygon(polyRound([
        [0, 0, 0],
        [0, ballastWidth, 0],
        [ballastBevelOffsetY, ballastWidth, ballastBevelBottomRadius],
        [ballastHeight, ballastWidth-ballastBevelWidth, ballastBevelTopRadius],
        [ballastHeight, ballastBevelWidth, ballastBevelTopRadius],
        [ballastBevelOffsetY, 0, ballastBevelBottomRadius],
        [0, 0, 0],
        [0, ballastShellThickness, 0],
        [ballastBevelOffsetY-ballastShellThickness, ballastShellThickness, ballastBevelTopRadius],
        [ballastHeight-ballastShellThickness, ballastBevelWidth+ballastShellThickness, ballastBevelTopRadius],
        [ballastHeight-ballastShellThickness, ballastWidth-ballastBevelWidth-ballastShellThickness, ballastBevelTopRadius],
        [ballastBevelOffsetY-ballastShellThickness, ballastWidth-ballastShellThickness, ballastBevelTopRadius],
        [0, ballastWidth-ballastShellThickness, 0],
        [0, 0, 0],
    ], 32));
}

module drawLeftStraightBallastMould(mouldDepth=ballastShellThickness*5) {
    color(ballastColor) 
    translate([0, 0, 0])
    rotate([0, 270, 0])
    linear_extrude(height=roadStraightSectionLength() / 2)
    polygon(polyRound([
        [0, 0, 0],
        [0, ballastWidth, 0],
        [ballastBevelOffsetY, ballastWidth, ballastBevelBottomRadius],
        [ballastHeight, ballastWidth-ballastBevelWidth, ballastBevelTopRadius],
        [ballastHeight, ballastBevelWidth, ballastBevelTopRadius],
        [ballastBevelOffsetY, 0, ballastBevelBottomRadius],
        [0, 0, 0],
        [0, -mouldDepth, 0],
        [ballastHeight+mouldDepth, -mouldDepth, 0],
        [ballastHeight+mouldDepth, ballastWidth+mouldDepth, 0],
        [0, ballastWidth+mouldDepth, 0],
        [0, 0, 0],
    ], 32));

    translate([5, (ballastWidth- basePlatePinPairCenterSpacingCrosswise) / 2, 15])
    cuboid([basePlatePinDiameter, basePlatePinSpacingCenterCrosswise(), basePlatePinLength], center=false);

}

module drawLeftStraightBallastPinTubes() {
    difference(){
        union(){
            // pin 1
            translate([0, (ballastWidth - basePlatePinSpacingCenterCrosswise())/2, 0])
            drawBallastPinTube();
            
            // pin 2
            translate([0, ((ballastWidth - basePlatePinSpacingCenterCrosswise())/2) + basePlatePinSpacingCenterCrosswise(), 0])
            drawBallastPinTube();

            // pin 3
            translate([-basePlatePinSpacingCenterLengthwise(), (ballastWidth - basePlatePinSpacingCenterCrosswise())/2, 0])
            drawBallastPinTube();
            
            // pin 4
            translate([-basePlatePinSpacingCenterLengthwise(), ((ballastWidth - basePlatePinSpacingCenterCrosswise())/2) + basePlatePinSpacingCenterCrosswise(), 0])
            drawBallastPinTube();
        }
        cube([ballastPinTubeOuterDiameter() / 2, ballastWidth, ballastHeight]);
    }
}

module drawLeftStraightBasePlatePins() {
    translate([0, 0, basePlateThickness])
    difference(){
        union(){
            // pin 1
            translate([-basePlatePinSpacingCenterLengthwise() / 2, (ballastWidth - basePlatePinSpacingCenterCrosswise())/2, 0])
            drawBasePlatePin();
            
            // pin 2
            translate([-basePlatePinSpacingCenterLengthwise() / 2, ((ballastWidth - basePlatePinSpacingCenterCrosswise())/2) + basePlatePinSpacingCenterCrosswise(), 0])
            drawBasePlatePin();

            // pin 3
            // translate([-basePlatePinSpacingCenterLengthwise() / 2 - basePlatePinSpacingCenterLengthwise(), (ballastWidth - basePlatePinSpacingCenterCrosswise())/2, 0])
            // drawBasePlatePin();
            
            // pin 4
            translate([-basePlatePinSpacingCenterLengthwise() / 2 - basePlatePinSpacingCenterLengthwise(), ((ballastWidth - basePlatePinSpacingCenterCrosswise())/2) + basePlatePinSpacingCenterCrosswise(), 0])
            drawBasePlatePin();
        }
        cube([ballastPinTubeOuterDiameter() / 2, ballastWidth, ballastHeight]);
    }
}

module drawLeftStraightBallast() {
    difference(){
        drawLeftStraightBallastPinTubes();
        drawLeftStraightBallastMould();
    }
    drawLeftStraightBallastShell();
}

module drawBallastPinTube() {
    // translate([0, 0, 0])
    // tube(h=ballastHeight, ir=ballastPinTubeInnerDiameter(), or=ballastPinTubeOuterDiameter());
    color(ballastColor) difference(){
        cylinder(d=ballastPinTubeOuterDiameter(), h=ballastHeight);
        cylinder(d=ballastPinTubeInnerDiameter(), h=ballastHeight);
    }
}

module drawBasePlatePin() {
    // translate([0, 0, 0])
    // tube(h=ballastHeight, ir=ballastPinTubeInnerDiameter(), or=ballastPinTubeOuterDiameter());
    color(basePlateColor) 
    // cylinder(d=basePlatePinDiameter, h=basePlatePinLength+basePlateThickness);
    cyl(d=basePlatePinDiameter, l=basePlatePinLength, center=false, chamfer1=0.5, chamfang1=10, chamfer2=1);
    
    
}

module drawInterlockingTabBasePlate() {
    color(basePlateColor)
    translate([0, 0, 0])
    cuboid([basePlateInterlockingLength, ballastWidth/2, basePlateThickness], center=false, fillet=basePlateCornerRadius, edges=EDGE_BK_RT);

}

module drawStraightLeftInterlockingSection() {

    drawLeftStraightBasePlatePins();

    difference(){
        union(){
            translate([-roadStraightSectionLength() / 2 - basePlateInterlockingLength / 2 + basePlateCornerRadius, 0, 0])
            cube([roadStraightSectionLength() / 2 - basePlateCornerRadius + basePlateInterlockingLength / 2, ballastWidth, basePlateThickness]);
            
            hull(){
                translate([-roadStraightSectionLength()/2 - basePlateInterlockingLength / 2 + basePlateCornerRadius, ballastWidth-basePlatePinDiameter/2, 0])
                basePlateSectionSquareCorner();
                
                translate([-roadStraightSectionLength()/2 - basePlateInterlockingLength / 2 + basePlateCornerRadius, ballastWidth/2+basePlatePinDiameter/2, 0])
                basePlateSectionRoundCorner();
            }
        }

        // subtract half of the interlocking tab from the base plate
        translate([-roadStraightSectionLength() / 2 - basePlateInterlockingLength / 2, 0, 0])
        drawInterlockingTabBasePlate();
    }

}

module drawStraightRightInterlockingSection() {
    translate([0, ballastWidth, 0])
    mirror([0, 1, 0])
    mirror([1, 0, 0])
    drawStraightLeftInterlockingSection();
}

module drawSectionBase(leftType="straight", rightType="straight") {
    
    // draw the left side
    if(leftType == "straight") {
        drawStraightLeftInterlockingSection();
    } else if(leftType == "curved_interlocking") {
        drawCurvedLeftInterlockingSection();
    } else if(leftType == "straight_terminating") {
        drawStraightLeftTerminatingSection();
    } else if(leftType == "curved_terminating") {
        drawCurvedLeftTerminatingSection();
    } else if(leftType == "none") {
        // do nothing
    }


    // draw the right side
    if(rightType == "straight") {
        drawStraightRightInterlockingSection();
    } else if(rightType == "curved_interlocking") {
        drawCurvedRightInterlockingSection();
    } else if(rightType == "straight_terminating") {
        drawStraightRightTerminatingSection(true);
    } else if(rightType == "curved_terminating") {
        drawCurvedRighTerminatingSection(true);
    } else if(rightType == "none") {
        // do nothing
    }


};

module drawStraightRail(length){
    rotate([90, 0, 0])
    rotate([0, 90, 0])
    linear_extrude(height=length)
    railShape();
}

module drawCurvedRail(angle, arcRadius, coupleLeft="none", coupleRight="none"){
    // rotate([90, 0, 0])
    // rotate([0, 90, 0])

    difference(){
        union(){
            rotate_extrude(angle=angle, $fn=150)
            rotate([0, 0, 0])
            rotate([0, 0, 0])
            translate([arcRadius, 0, 0])
            railShape();
            if(coupleRight == "SRF") {
                translate([arcRadius + railHeelWidth, -coupleLength/2, 0])
                rotate([0, 0, 0])
                rotate([0, 0, 90])
                coupleFemale_SR();
            }

            if(coupleLeft == "SRF") {
                rotate(angle, [0, 0, 0.01])
                translate([arcRadius, +coupleLength/2, 0])
                rotate([0, 0, 270])
                coupleFemale_SR();
            }
        }
        if(coupleRight == "SRM") {
            translate([arcRadius, 0, 0])
            rotate([0, 0, 0])
            rotate([0, 0, 270])
            coupleMale_SR();
        }

        if(coupleLeft == "SRM") {
            rotate(angle, [0, 0, 0.01])
            translate([arcRadius + railHeelWidth, 0, 0])
            rotate([0, 0, 90])
            coupleMale_SR();
        }

    }



}

module drawSleeper(){
    translate([roadCurveRadius + railWidth/2, 0, 0]){
        rotate([0, 0, 0])
        rotate([0, 0, 0])
        rotate([0, 0, 90])
        cuboid([sleeperWidth, sleeperLength, sleeperHeight], fillet=sleeperCornerRadius);
        
        translate([(sleeperLength-railSpacing)/2 + railHeelWidth/2 + railWidth/2, -sleeperWidth/2 + nailPlateLength/2, sleeperHeight/2])
        rotate([0, 0, 90])
        nailPlate();

        translate([(sleeperLength-railSpacing)/2 - railHeelWidth/2 - railWidth/2 + nailPlateLength/2,  -sleeperWidth/2 + nailPlateLength/2, sleeperHeight/2])
        rotate([0, 0, 90])
        nailPlate();

        translate([-((sleeperLength-railSpacing)/2 + railHeelWidth/2 + railWidth/2),  -sleeperWidth/2 + nailPlateLength/2, sleeperHeight/2])
        rotate([0, 0, 90])
        nailPlate();

        translate([-((sleeperLength-railSpacing)/2 - railHeelWidth/2 - railWidth/2 + nailPlateWidth/2),  -sleeperWidth/2 + nailPlateLength/2, sleeperHeight/2])
        rotate([0, 0, 90])
        nailPlate();

    }
}

module nailPlate() {
    translate([ sleeperWidth / 2 - nailPlateWidth / 2, 0, 0 ]) {
        // draw the nail plate
        cuboid([ nailPlateWidth, nailPlateLength, nailPlateHeight ], 
            fillet = nailPlateCornerRadius
        ){};

        // draw the first nail
        translate([nailPlateWidth/4, 0, nailPlateHeight]) {
            sphere(r = nailPlateNailRadius){};
        }

        // draw the second nail
        translate([-nailPlateWidth + (nailPlateWidth/4*3), 0, nailPlateHeight]) {
            sphere(r = nailPlateNailRadius){};
        }
    }
}


// draw a male couple in the style of the Service Railway model set
module coupleMale_SR() {

    // shave the thickness of the rail heel according to tolerance settings
    translate([  - coupleLength, 0, 0 ]) {
        cube([ coupleLength, railHeelWidth, coupleTolerance ], center = false){};
    }

    // shave the edges off the inner rail heel according to tolerance settings
    translate([  - coupleLength/2, -0.5, 0 ]) {
        cube([ coupleLength/2, coupleTolerance+0.5, railHeelHeight ], center = false){};
    }

    // shave the edges off the outer rail heel according to tolerance settings
    translate([  - coupleLength, railHeelWidth , 0 ]) {
        cube([ coupleLength, coupleTolerance, railHeelHeight ], center = false){};
    }

    // carve out the notch for the pin to lock into
    translate([
         - coupleNotchDiameter - coupleNotchOffset,
        railHeelWidth - railHeelOffset(), 
        0
    ]) {
        cube([ coupleNotchDiameter, railHeelOffset(), railHeight ]);
    }

    // carve out a wedge shape on the leading edge of the outer rail heel to help slide into the notch
    translate([  - coupleNotchOffset, railHeelWidth, railHeelHeight ]) {
        rotate([ 180, 0, 0 ]) {
        linear_extrude(height = railHeelHeight) {
            polygon(polyRound([
            [ 0, 0, 0 ], [ 0, coupleNotchTightness, 0 ],
            [ coupleNotchOffset + 0.1, coupleNotchTightness * 2, 0 ],
            [ coupleNotchOffset + 0.1, 0, 0 ]
            ])){};
        }
        }
    }
}



// draw a female couple in the style of the Service Railway model set
module coupleFemale_SR() {

    difference() {

        // draw the coupling block as a solid rectagular cube
        translate([ 0, -coupleThickness, -coupleThickness ]) {
            cuboid([
                coupleLength, 
                railHeelWidth + coupleThickness * 2,
                railHeelHeight + coupleThickness * 2
            ], center = false, fillet = railCornerRadius){};
        }

        // carve-out the rail heel from the coupling block
        translate(
            [ -coupleTolerance, -coupleTolerance / 2, -coupleTolerance / 2 ]) {
            cuboid([
                coupleLength + coupleTolerance, railHeelWidth + coupleTolerance,
                railHeelHeight +
                coupleTolerance
            ], center = false){};
        }

        // carve-out the rail from the coupling block
        translate([ -coupleTolerance, railHeelOffset() - coupleTolerance / 2, 0 ]) {
            cuboid([
                coupleLength - sleeperWidth + coupleTolerance,
                railWidth + coupleTolerance,
                railHeight
            ], center = false){};
        }

        // carve-out the wheel track in case the coupling block protrudes and collides with the wheel flange
        translate([
            0, 
            railHeelOffset() - wheelFlangeWidth,
            (railHeight - wheelFlangeHeight)
        ]) {
            cuboid([
                coupleLength, 
                wheelFlangeWidth + railCornerRadius,
                wheelFlangeHeight
            ], center = false, fillet = railCornerRadius, edges = EDGES_X_ALL){};
        }
    } // end difference

    // add the notch to lock the male couple in place
    translate([
        coupleNotchDiameter / 2 + coupleNotchOffset,
        railHeelWidth + coupleNotchDiameter / 2 - coupleNotchTightness, 0
    ]) {
        cylinder(railHeelHeight + coupleTolerance * 2, coupleNotchDiameter / 2,
            coupleNotchDiameter / 2) {}
    }

    if(drawSupports) {
        // draw the support plate under the left lip of the couple top
        difference(){
            translate([ 0, supportPlateGap, railHeelHeight - supportPlateGap ]) {
                rotate([ 0, 90, 0 ]){
                    cuboid([
                        supportPlateThickness, railHeelWidth - supportPlateGap * 2, (coupleLength - (railLength - sleeperOffsetNorth() - leftRailOffset / 2) - supportPlateGap)
                    ], center = false){};
                }
            }

            // add the notch to lock the male couple in place
            translate([
                coupleNotchDiameter / 2 + coupleNotchOffset,
                railHeelWidth + coupleNotchDiameter / 2 - coupleNotchTightness, 0
            ]) {
                cylinder(railHeelHeight + coupleTolerance * 2, coupleNotchDiameter / 2 + supportPlateGap,
                    coupleNotchDiameter / 2 + supportPlateGap ) {}
            }


        }
    }


}



*translate([roadCurveInnerRailCenterRadius() + railSpacing/2 + railHeelWidth /2, 0, 5])
color("red") cuboid([railSpacing, 5, 5]);

// drawStraightRail(roadSectionLength){};

// inner rail
translate([0, 0, sleeperHeight])
rotate([0, 0, ((1/coupleLength)*(360/numberOfSectorsPerCurve))/2])
drawCurvedRail(360 / numberOfSectorsPerCurve, roadCurveInnerRailCenterRadius() - railWidth/2, "SRM", "SRF"){};

// outer rail
translate([0, 0, sleeperHeight])
rotate([0, 0, -((1/coupleLength)*(360/numberOfSectorsPerCurve))/2])
drawCurvedRail(360 / numberOfSectorsPerCurve, roadCurveOuterRailCenterRadius() - railWidth/2, "SRF", "SRM"){};


// draw the sleepers
translate([0, 0, sleeperHeight/2])
rotate([0, 0, (360 / numberOfSectorsPerCurve / numberOfSleepersPerSection) / 2])
for(i = [0 : numberOfSleepersPerSection - 1]){
    rotate([0, 0, i * (360 / numberOfSectorsPerCurve / numberOfSleepersPerSection)])
    drawSleeper(){};
}


// drawSleeperCurve(){};

// draw the left side section base
difference(){
    // color(basePlateColor) 
    // drawSectionBase();

    // chop the end of
    // translate([roadSectionLength/2-basePlateInterlockingLength, 0, 0])
    // cube([ballastWidth, ballastWidth, basePlateThickness]);

    // chop the other end off
    // translate([-(roadSectionLength/2), 0, 0])
    // cube([ballastWidth*2, ballastWidth, basePlateThickness + basePlatePinLength]);

}
// draw the ballast and rail for guidance
translate([0, 0, basePlateThickness + 7]){
    // drawLeftStraightBallast();
    // drawLeftSectionLeftRail();
    // drawLeftSectionRightRail();

    // translate([0, ballastWidth, 0])
    // mirror([0, 1, 0])
    // mirror([1, 0, 0]){
    //     drawLeftStraightBallast();
    //     drawLeftSectionLeftRail();
    //     drawLeftSectionRightRail();
    // }

}

// measure the distance between the two rails
// color("yellow")
// translate([-railWidth, (ballastWidth-railSpacing) / 2, ballastHeight])
    // cube([railWidth, railSpacing, railHeight + basePlateThickness + 3]);


echo(basePlatePinSpacingCenterLengthwise());


// draw a cube the size of the whole ballast section
// translate([0, -ballastWidth/2, 0])
// cuboid([roadSectionLength, ballastWidth, ballastHeight + basePlateThickness + 3]);

