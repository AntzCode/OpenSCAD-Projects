include<./libraries/BOSL/constants.scad>
use<./libraries/BOSL/shapes.scad>

include<./libraries/Round-Anything/polyround.scad>


$fn = 120;

leftTypes = ["straight_interlocking", "curved_interlocking", "straight_terminating", "curved_terminating", "none"];
rightTypes = ["straight_interlocking", "curved_interlocking", "straight_terminating", "curved_terminating", "none"];

ballastColor = "brown";
basePlateColor = "gray";

// the radius from the center of the track to the center of a road circle
roadCurveRadius = 90;

// the length of a straight section of track
roadSectionLength = 228;

// the distance between the inner rail sides
railSpacing = 16.5;

// the width of the track
railWidth = 1;

// the height of the track
railHeight = 3.5;

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
numberOfSectorsPerCurve = 12;

// how many pairs of pins are in a sector
numberOfPinPairsPerSector = 3;


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

// draw the left side section base
difference(){
    color(basePlateColor) 
    drawSectionBase();

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

