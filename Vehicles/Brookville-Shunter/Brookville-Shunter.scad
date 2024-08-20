/**
 * 3D model of the Brookville Shunter
 * Author: AntzCode Ltd
 * Version: 1.0.1
 * URL: https://github.com/AntzCode/OpenSCAD-Projects/Vehicles/Brookville-Shunter
 * License: GPLv3
 */

include <BOSL/constants.scad>
use <BOSL/shapes.scad>

include <Round-Anything/polyround.scad>

// number of facets used to generate an arc
$fn = 32;

// asterisk hides it
// this is used to compare the model to a known size (eg: 300mm)
*translate([ 150, 0, 0 ])
{
	color("red") sphere(d = 300)
	{
	}
}

showReportSizes = true;
showCab = true;
showNose = true;
showChassis = true;
showWheels = true;
showCabFrame = false;
showNoseFrame = false;
showChassisFrame = false;
showFrontHitch = true;
showRearHitch = true;

// scale factor for translating to a model size
scale = 6;

// nose
noseWidth = 1200 / scale;
noseLength = 1090 / scale;
noseHeightCenter = 1070 / scale;
noseHeightSides = 960 / scale;
noseCornerRadius = 120 / scale;
noseApexRadius = 120 / scale;
noseSteelThickness = 3 / scale;
noseColor = "Yellow";

noseFrontWindowWidth = noseWidth - 20 / scale;
noseFrontWindowHeight = noseHeightCenter - 330 / scale;
noseFrontGrilleLouvreDistance = 30 / scale;
noseFrontGrilleLouvreThickness = 4 / scale;
noseFrontGrilleLouvreWidth = 50 / scale;
noseFrontGrilleLouvreAngle = -70;
noseFrontGrilleWidth = noseFrontWindowWidth;
noseFrontGrilleHeight = noseFrontWindowHeight;
noseFrontGrilleThickness = 50 / scale;
noseFrontGrilleProtrusionFront = 3 / scale;
noseFrontGrilleColor = "Black";
noseFrontGrilleBorderWidth = 60 / scale;

noseDoorHeight = 730 / scale;
noseDoorWidth = 540 / scale;
noseDoorOffsetFront = 5 / scale;
noseDoorFrameWidth = 40 / scale;
noseDoorColor = "Gold";

noseDoorWindowWidth = 300 / scale;
noseDoorWindowHeight = 300 / scale;
noseDoorWindowOffsetBottom = 200 / scale;

noseDoorWindowLouvreDistance = 15 / scale;
noseDoorWindowLouvreThickness = 2 / scale;
noseDoorWindowLouvreWidth = 20 / scale;
noseDoorWindowLouvreAngle = -50;
noseDoorWindowThickness = 10 / scale;
noseDoorWindowProtrusionFront = 3 / scale;
noseDoorWindowColor = "Black";
noseDoorWindowBorderWidth = 20 / scale;

noseExhaustDiameter = 65 / scale;
noseExhaustThickness = 3 / scale;
noseExhaustLength = 50 / scale;
noseExhaustOffsetBack = 90 / scale;
noseExhaustOffsetLeft = ((1200 / 2 - 310) + 65) / scale;
noseExhaustColor = "Black";

noseAirIntakeDiameter = 80 / scale;
noseAirIntakeThickness = 3 / scale;
noseAirIntakeLength = 100 / scale;
noseAirIntakeOffsetFront = 150 / scale;
noseAirIntakeOffsetRight = ((1200 / 2 - 80) - 80) / scale;

noseAirIntakeFilterHousingDiameter = 165 / scale;
noseAirIntakeFilterHousingThickness = 20 / scale;
noseAirIntakeFilterHousingOffsetBottom = 60 / scale;
noseAirIntakeColor = "Black";

noseFuelInputDiameter = 70 / scale;
noseFuelInputThickness = 3 / scale;
noseFuelInputLength = 0 / scale;
noseFuelInputOffsetFront = 160 / scale;
noseFuelInputOffsetRight = ((1200 / 2 - 70) - 340) / scale;
noseFuelInputColor = "Black";

// cab
cabLength = 1730 / scale;
cabWidth = 2220 / scale;
cabHeightCenter = 2280 / scale;
cabHeightSides = 2080 / scale;
cabCornerRadius = 200 / scale;
cabSteelThickness = 3 / scale;
cabRoofOverhangFront = 190 / scale;
cabRoofOverhangBack = 80 / scale;
cabColor = "Yellow";

// cab side windows
leftWindowWidth = 980 / scale;
leftWindowHeight = 720 / scale;
leftWindowOffsetBottom = (100 + 1070) / scale;
leftWindowOffsetFront = 100 / scale;
leftWindowCornerRadius = 70 / scale;

rightWindowWidth = 980 / scale;
rightWindowHeight = 720 / scale;
rightWindowOffsetBottom = (100 + 1070) / scale;
rightWindowOffsetFront = 100 / scale;
rightWindowCornerRadius = 70 / scale;

// cab front windows
frontSideWindowWidth = 500 / scale;
frontSideWindowHeightLong = 610 / scale;
frontSideWindowHeightShort = 540 / scale;
frontSideWindowOffsetBottom = (510 + 1070) / scale;
frontSideWindowCornerRadius = 70 / scale;
frontSideWindowOffsetSide = 120 / scale;

frontCenterWindowWidth = 430 / scale;
frontCenterWindowHeight = 430 / scale;
frontCenterWindowOffsetBottom = (430 + 1070) / scale;
frontCenterWindowCornerRadius = 70 / scale;

// cab doors
doorWidth = 460 / scale;
doorHeight = 1800 / scale;
doorOffsetBack = 100 / scale;
doorColor = "Gold";

doorWindowWidth = 320 / scale;
doorWindowHeight = 720 / scale;
doorWindowOffsetBottom = (100 + 1070) / scale;
doorWindowCornerRadius = 70 / scale;
doorHandleDiameter = 40 / scale;
doorHandleLength = 30 / scale;
doorHandleOffsetBack = 400 / scale;
doorHandleOffsetBottom = (50 + 1070) / scale;
doorHandleColor = "Black";

// chassis
chassisWidth = 1600 / scale;
chassisHeight = 470 / scale;
chassisLength = cabLength + noseLength + (30 / scale);
chassisCornerRadius = 100 / scale;
chassisSteelThickness = 8 / scale;
chassisColor = "Black";

// hitch block
hitchBlockColor = "DarkSlateGray";
hitchBlockWidth = 290 / scale;
hitchBlockHeight = 260 / scale;
hitchBlockLength = 290 / scale;
hitchBlockCornerRadius = 5 / scale;
hitchMountPlateWidth = 720 / scale;
hitchMountPlateThickness = 12 / scale;
hitchMountPlateHeight = 460 / scale;
hitchMountPlateCornerRadius = 2 / scale;
hitchPointDiameterBig = 280 / scale;
hitchPointDiameterSmall = 120 / scale;
hitchPointLength = 400 / scale;
hitchChainTagWidth = 50 / scale;
hitchChainTagLength = 90 / scale;
hitchNotchWidth = 80 / scale;
hitchNotchLength = 300 / scale;
hitchNotchDepth = 140 / scale;
hitchNotchCornerRadius = 30 / scale;

// wheel holes
wheelHoleWidth = 380 / scale;
wheelHoleHeight = 110 / scale;

// axles
axleDiameter = 20;     // mm in scale
rearAxleOffset = (730 + (380 / 2)) / scale;
frontAxleOffset = chassisLength - ((650 + 380 / 2) / scale);

wheelColor = "Red";
wheelFlangeColor = "DarkRed";
wheelDiameter = 450 / scale;
wheelWidth = 18;       // mm in scale
wheelFlangeWidth = 3;  // mm in scale
wheelFlangeHeight = 5; // mm in scale
wheelTrackWidth = 184; // mm in scale

// building materials

// frame timber = 2x2 dressed
frameTimberWidth = 45;
frameTimberHeight = 45;
frameTimberColor = "SaddleBrown";

reportSize("Scale Factor 1:x", scale);
reportSize("Overall Height", wheelDiameter/2+chassisHeight+cabHeightCenter);
reportSize("Overall Width", cabWidth);
reportSize("Overall Length", chassisLength);

reportSize("Chassis Width", chassisWidth);
reportSize("Chassis Length", chassisLength);
reportSize("Chassis Height", chassisHeight);

reportSize("Cab Width", cabWidth);
reportSize("Cab Length", cabLength);
reportSize("Cab Height Centre", cabHeightCenter);

reportSize("Nose Width", noseWidth);
reportSize("Nose Length", noseLength);
reportSize("Nose Height Center", noseHeightCenter);

reportSize("Nose Air Intake Offset Front", noseAirIntakeOffsetFront);
reportSize("Nose Air Intake Offset Right", noseAirIntakeOffsetRight);
reportSize("Nose Air Intake External Diameter", noseAirIntakeDiameter);
reportSize("Nose Air Intake Internal Diameter", noseAirIntakeDiameter-noseAirIntakeThickness*2);
reportSize("Nose Air Intake Thickness", noseAirIntakeThickness);
reportSize("Nose Air Intake Length", noseAirIntakeLength);
reportSize("Nose Air Intake Filter Housing Diameter", noseAirIntakeFilterHousingDiameter);
reportSize("Nose Air Intake Filter Housing Thickness", noseAirIntakeFilterHousingThickness);
reportSize("Nose Air Intake Filter Housing Offset Bottom", noseAirIntakeFilterHousingOffsetBottom);

reportSize("Nose Fuel Input Offset Front", noseFuelInputOffsetFront);
reportSize("Nose Fuel Input Offset Right", noseFuelInputOffsetRight);
reportSize("Nose Fuel Input External Diameter", noseFuelInputDiameter);
reportSize("Nose Fuel Input Internal Diameter", noseFuelInputDiameter- noseFuelInputThickness*2);
reportSize("Nose Fuel Input Thickness", noseFuelInputThickness);
reportSize("Nose Fuel Input Length", noseFuelInputLength);

reportSize("Nose Exhaust Offset Back", noseExhaustOffsetBack);
reportSize("Nose Exhaust Offset Left", noseExhaustOffsetLeft);
reportSize("Nose Exhaust External Diameter", noseExhaustDiameter);
reportSize("Nose Exhaust Internal Diameter", noseExhaustDiameter-noseExhaustThickness*2);
reportSize("Nose Exhaust Thickness", noseExhaustThickness);
reportSize("Nose Exhaust Length", noseExhaustLength);

reportSize("Wheel Diameter", wheelDiameter);
reportSize("Wheel Width", wheelWidth);
reportSize("Wheel Flange Height", wheelFlangeHeight);
reportSize("Wheel Flange Width", wheelFlangeWidth);
reportSize("Wheel Overall Width", wheelWidth + wheelFlangeWidth);
reportSize("Wheel Overall Diameter", wheelDiameter+wheelFlangeHeight*2);
reportSize("Rear Axle Offset (from chassis rear edge)", rearAxleOffset);
reportSize("Front Axle Offset (from chassis rear edge)", frontAxleOffset);

reportSize("Wheelbase (center to center)", frontAxleOffset - rearAxleOffset);

// print the computed size to the console
module reportSize(title, value){
    if(showReportSizes){
        echo(concat(title, value));
    }
}

module louvreGrill(width, height, louvreWidth, louvreThickness, louvreDistance, louvreAngle)
{
    numberOfLouvres = ceil(height / louvreDistance) - 1;
    for(i=[0:numberOfLouvres]){
        translate([louvreDistance*i, 0, 0]){
            rotate([0,0,louvreAngle]){
                cuboid([louvreThickness, louvreWidth, width]);
            }
        }
    }
}

// draw a flanged wheel
module flangedWheel(diameter, flangeHeight, flangeWidth)
{
	color(wheelFlangeColor) cylinder(flangeWidth, d = diameter + flangeHeight * 2, center = false)
	{
	}
	translate([ 0, 0, flangeWidth ])
	{
		color(wheelColor) cylinder(wheelWidth - flangeWidth, d = diameter, center = false)
		{
		}
	}
}

// draw the outline shape of the cab when looking front-on
module cabPolygon()
{
	archHeight = (cabHeightCenter - (cabHeightSides - cabCornerRadius));
	cabCenterRadius = (((cabWidth / 2) * (cabWidth / 2)) / archHeight) + archHeight;
	polygon(polyRound(
	    [
		    [ 0, 0, 0 ],                                              // left bottom
		    [ cabWidth, 0, 0 ],                                       // right bottom
		    [ cabWidth, cabHeightSides, cabCornerRadius ],            // right side top
		    [ (cabWidth / 4) * 3, cabHeightCenter, cabCenterRadius ], // roof center
		    [ (cabWidth / 4), cabHeightCenter, cabCenterRadius ],     // roof center
		    [ 0, cabHeightSides, cabCornerRadius ]                    // left side top
	    ],
	    10));
}

// draw the outline shape of the nose when looking front-on
module nosePolygon()
{
	archHeight = (noseHeightCenter - (noseHeightSides - noseCornerRadius));
	noseCenterRadius = (((noseWidth / 2) * (noseWidth / 2)) / archHeight) + archHeight;
	polygon(polyRound(
	    [
		    [ 0, 0, 0 ],                                           // left bottom
		    [ noseWidth, 0, 0 ],                                   // right bottom
		    [ noseWidth, noseHeightSides, noseCornerRadius ],      // right side top
		    [ (noseWidth / 2), noseHeightCenter, noseApexRadius ], // nose center
		    [ 0, noseHeightSides, noseCornerRadius ]               // left side top
	    ],
	    10));
}

// draw a door for the nose
module noseDoor(side)
{
    union(){
        difference()
        {
            // draw a door panel
            color(noseDoorColor) cuboid([ noseDoorWidth, noseDoorHeight, noseSteelThickness ], center = false)
            {
            }
            // cut a window
            translate([ (noseDoorWidth - noseDoorWindowWidth) / 2, noseDoorWindowOffsetBottom, -1 ])
            {
                cuboid([ noseDoorWindowWidth, noseDoorWindowHeight, noseSteelThickness + 2 ], center = false)
                {
                }
            }
        }

        // draw window border
        translate([
            noseDoorWidth/2-noseDoorWindowWidth/2,
            noseDoorWindowOffsetBottom,
            noseDoorWindowThickness-noseDoorWindowProtrusionFront
        ]){
            rotate([-90,0,0]){
                difference(){
                    color(noseDoorWindowColor) cuboid([noseDoorWindowWidth, noseDoorWindowThickness, noseDoorWindowHeight], center=false);
                    translate([noseDoorWindowBorderWidth, -1, noseDoorWindowBorderWidth]){
                        cuboid([noseDoorWindowWidth - noseDoorWindowBorderWidth*2, noseDoorWindowThickness + 2, noseDoorWindowHeight - noseDoorWindowBorderWidth*2], center=false);
                    }
                }
            }
        }

        // draw a window louvre
        translate([
            noseDoorWidth/2,
            noseDoorWindowOffsetBottom + noseDoorWindowBorderWidth + noseDoorWindowLouvreDistance,
            noseDoorWindowThickness/2
        ]){
            rotate([90,0,90]){
                color(noseDoorWindowColor) louvreGrill(noseDoorWindowWidth-noseDoorWindowBorderWidth*2, noseDoorWindowHeight - noseDoorWindowBorderWidth*2, noseDoorWindowLouvreWidth, noseDoorWindowLouvreThickness, noseDoorWindowLouvreDistance, noseDoorWindowLouvreAngle);
            }
        }

    }
}

module hitchBlock(){

    union(){

        // draw the mounting plate
        translate([hitchChainTagWidth, 0, 0]){
            cuboid([hitchMountPlateWidth, hitchMountPlateThickness, hitchMountPlateHeight], center=false, fillet=hitchMountPlateCornerRadius);
            
        }

        // right hitch
        translate([hitchMountPlateWidth + hitchChainTagWidth*2, hitchBlockLength + hitchMountPlateThickness, hitchMountPlateHeight]){
            rotate([0,180,90]){
                minkowski(){
                    sphere(hitchMountPlateCornerRadius*2);
                    linear_extrude(hitchMountPlateThickness - hitchMountPlateCornerRadius*2) polygon(polyRound([
                        [0, 0, 0],                                                                                                                                                                              // zero, corner
                        [0, hitchChainTagWidth*2 + hitchMountPlateWidth - hitchMountPlateCornerRadius*2, hitchMountPlateCornerRadius],                                                                          // front right corner
                        [hitchChainTagLength/2, hitchChainTagWidth*2 + hitchMountPlateWidth - hitchMountPlateCornerRadius*2, hitchMountPlateCornerRadius],                                                      // half the tag, begin diag
                        [hitchChainTagLength, hitchChainTagWidth + hitchMountPlateWidth - hitchMountPlateCornerRadius*2, hitchMountPlateCornerRadius],                                                          // end diag, begin straight right edge
                        [hitchBlockLength + hitchMountPlateThickness - hitchMountPlateCornerRadius*2, hitchChainTagWidth + hitchMountPlateWidth - hitchMountPlateCornerRadius*2, hitchMountPlateCornerRadius],  // rear-right corner
                        [hitchBlockLength + hitchMountPlateThickness - hitchMountPlateCornerRadius*2, hitchChainTagWidth - hitchMountPlateCornerRadius*2, hitchMountPlateCornerRadius],                         // rear-left corner
                        [hitchChainTagLength, hitchChainTagWidth + hitchMountPlateThickness - hitchMountPlateCornerRadius*2, hitchMountPlateCornerRadius],                                                      // left side begin diag
                        [hitchChainTagLength/2, 0, hitchMountPlateCornerRadius]                                                                                                                                 // left-most tag
                    ]));
                }
            }
        }

        // draw the block
        translate([((hitchMountPlateWidth + hitchChainTagWidth*2) - hitchBlockWidth) / 2, hitchMountPlateThickness, hitchMountPlateHeight - hitchBlockHeight/2]){
            cuboid([hitchBlockWidth, hitchBlockLength, hitchBlockHeight], center=false, fillet=hitchBlockCornerRadius);
        }

        // left angle support
        translate([hitchChainTagWidth + hitchMountPlateWidth/2 - hitchBlockWidth/2 + hitchMountPlateCornerRadius*2, hitchMountPlateThickness, 0]){
            rotate([90, 0, 90]){
                minkowski(){
                    sphere(hitchMountPlateCornerRadius*2);
                    linear_extrude(hitchMountPlateThickness - hitchMountPlateCornerRadius*2) polygon(polyRound([
                        [0, 0, 0], // zero, corner
                        [0, hitchMountPlateHeight - hitchBlockHeight/2 - hitchMountPlateCornerRadius*2, 0],
                        [hitchBlockLength - hitchMountPlateCornerRadius*2, hitchMountPlateHeight - hitchBlockHeight/2 - hitchMountPlateCornerRadius*2, 0]
                    ]));
                }
            }
        }

        // right angle support
        translate([hitchChainTagWidth + hitchMountPlateWidth/2 + hitchBlockWidth/2 - hitchMountPlateThickness, hitchMountPlateThickness, 0]){
            rotate([90, 0, 90]){
                minkowski(){
                    sphere(hitchMountPlateCornerRadius*2);
                    linear_extrude(hitchMountPlateThickness - hitchMountPlateCornerRadius*2) polygon(polyRound([
                        [0, 0, 0], // zero, corner
                        [0, hitchMountPlateHeight - hitchBlockHeight/2 - hitchMountPlateCornerRadius*2, 0],
                        [hitchBlockLength - hitchMountPlateCornerRadius*2, hitchMountPlateHeight - hitchBlockHeight/2 - hitchMountPlateCornerRadius*2, 0]
                    ]));
                }
            }
        }

        // draw the hitch

        // calculate the height of the arch for the spherical shape of the hitch point contact face
        // where chord diameter = spherical radius and the chord diameter is known as hitchPointDiameterBig
        c = hitchPointDiameterBig;
        a = hitchPointDiameterBig / 2;
        b = sqrt(c * c - a * a);
        archHeight = (hitchPointDiameterBig - b);

        translate([hitchMountPlateWidth/2 + hitchChainTagWidth, hitchBlockLength, hitchMountPlateHeight]){
            rotate([-90, 0, 0]){
                difference(){
                    // draw the solid hitch point
                    rotate_extrude(angle=360){
                        rotate([0, 0, 90]){
                            polygon(polyRound([
                                [0, 0, 0],
                                [0, hitchPointDiameterSmall/2, 0],
                                // create a curvature in the cylinder:
                                [hitchPointLength/4 * 3, hitchPointDiameterSmall/2 + hitchPointDiameterBig/2 / 4, 200],
                                [hitchPointLength, hitchPointDiameterBig/2, 5],
                                [hitchPointLength + archHeight, 0, hitchNotchCornerRadius],
                                [hitchPointLength + archHeight-1, 0, 0]
                            ]));
                        }
                    }
                    // cut the slot
                    translate([-hitchNotchWidth/2, -hitchNotchDepth-10, hitchPointLength-hitchNotchLength]){
                        cuboid([hitchNotchWidth, hitchNotchDepth+10, hitchNotchLength+20], center=false, fillet=hitchNotchCornerRadius);
                    }
                }
            }
        }
    }
}

// draw chassis frame
if (showChassisFrame) union()
{
	// left frame
    chassisLeftFrameLength = chassisLength - chassisSteelThickness * 2;
    reportSize("Chassis Left Frame Length", chassisLeftFrameLength);
	translate([ chassisSteelThickness, chassisSteelThickness, 0 ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, chassisLeftFrameLength, frameTimberWidth ])
		{
		}
	}

	// right frame
    chassisRightFrameLength = chassisWidth - frameTimberHeight - chassisSteelThickness;
    reportSize("Chassis Right Frame Length", chassisRightFrameLength);
	translate([chassisRightFrameLength, chassisSteelThickness, 0 ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, chassisLength - chassisSteelThickness * 2, frameTimberWidth ])
		{
		}
	}

	// rear frame
    chassisRearFrameLength = frameTimberHeight + chassisSteelThickness;
    reportSize("Chassis Rear Frame Length", chassisRearFrameLength);
	translate([ chassisRearFrameLength, chassisSteelThickness, 0 ])
	{
		color(frameTimberColor) cube(
		    [ chassisWidth - frameTimberHeight * 2 - chassisSteelThickness * 2, frameTimberHeight, frameTimberWidth ])
		{
		}
	}

	// front frame
    chassisFrontFrameLength = chassisWidth - frameTimberHeight * 2 - chassisSteelThickness * 2;
    reportSize("Chassis Front Frame Length", chassisFrontFrameLength);
	translate(
	    [ frameTimberHeight + chassisSteelThickness, chassisLength - frameTimberHeight - chassisSteelThickness, 0 ])
	{
		color(frameTimberColor) cube(
		    [chassisFrontFrameLength, frameTimberHeight, frameTimberWidth ])
		{
		}
	}
    
}

// draw chassis
if(showChassis) difference()
{
	color(chassisColor, alpha = 1) cuboid([ chassisWidth, chassisLength, chassisHeight ], center=false, fillet=chassisCornerRadius, edges=EDGES_Z_ALL)
	{
	}

	// draw wheel holes
	rearWheelHoleOffsetBack = rearAxleOffset - wheelHoleWidth / 2;
    reportSize("Rear Wheel Hole Offset Back", rearWheelHoleOffsetBack);
    translate([ -1, rearWheelHoleOffsetBack, -1 ])
	{
		cube([ chassisWidth + 2, wheelHoleWidth, wheelHoleHeight + 1 ])
		{
		}
	}

	// draw wheel holes
    frontWheelHoleOffsetBack = frontAxleOffset - wheelHoleWidth / 2;
    reportSize("Front Wheel Hole Offset Back", frontWheelHoleOffsetBack);
	translate([ -1, frontWheelHoleOffsetBack, -1 ])
	{
		cube([ chassisWidth + 2, wheelHoleWidth, wheelHoleHeight + 1 ])
		{
		}
	}
}

// draw front hitch
if(showFrontHitch) union(){
    translate([chassisWidth/2 - hitchMountPlateWidth/2 - hitchChainTagWidth, chassisLength, 0]){
        rotate([0, 0, 0]){
            color(hitchBlockColor) hitchBlock();
        }
    }
}

// draw rear hitch
if(showRearHitch) union(){
     translate([chassisWidth/2 + hitchMountPlateWidth/2 + hitchChainTagWidth, 0, 0]){
        rotate([0, 0, 180]){
            color(hitchBlockColor) hitchBlock();
        }
    }
}

// draw cab frame
if(showCabFrame) union()
{
	// right front frame
	translate([
		cabWidth - cabSteelThickness - (frameTimberHeight + (cabWidth - chassisWidth) / 2),
		cabLength - frameTimberWidth - cabSteelThickness,
		chassisHeight
	])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ])
		{
		}
	}

	// left front frame
	translate([
		-(cabWidth - chassisWidth) / 2 + cabSteelThickness, cabLength - frameTimberWidth - cabSteelThickness,
		chassisHeight
	])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ])
		{
		}
	}

	// right rear frame
	translate([
		cabWidth - (frameTimberHeight + (cabWidth - chassisWidth) / 2) + -cabSteelThickness, cabSteelThickness,
		chassisHeight
	])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ])
		{
		}
	}

	// left rear frame
	translate([ -(cabWidth - chassisWidth) / 2 + cabSteelThickness, cabSteelThickness, chassisHeight ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ])
		{
		}
	}
}

// draw cab
if(showCab) union(){

    reportSize("Cab Roof Length with Overhangs", cabLength + cabRoofOverhangBack + cabRoofOverhangFront);
    reportSize("Cab Roof Overhang Back", cabRoofOverhangBack);
    reportSize("Cab Roof Overhang Front", cabRoofOverhangFront);
    
    // draw the back of the cab roof overhang
    union(){
        difference(){
            difference(){
                // draw the cab with some extra length for the roof overhang
                translate([ -(cabWidth - chassisWidth) / 2, 0, chassisHeight ]){
                    rotate([ 90, 0, 0 ]){
                        color(cabColor) linear_extrude(height = cabRoofOverhangBack){
                            cabPolygon();
                        }
                    }
                }

                // carve-back the front part of the cab that does not have the roof
                translate([ -(cabWidth - chassisWidth) / 2 - 1, 1, chassisHeight - 1 ])
                {
                    rotate([ 90, 0, 0 ])
                    {
                        cuboid([ cabWidth + 2, cabHeightSides - cabCornerRadius / 2 + 1, cabRoofOverhangBack + 2 ], center = false);
                    }
                }

                // carve-back the front part of the roof
                translate([ -(cabWidth - chassisWidth) / 2 - 1, 1, chassisHeight ])
                {
                    rotate([ 90, 0, 0 ])
                    {
                        linear_extrude(height = cabRoofOverhangBack + 2)
                        {
                            offset(delta = -cabSteelThickness * 2) cabPolygon();
                        }
                    }
                }
            }
        }
    } // end union drawing back of cab roof overhang

    difference() {
        difference() {
            // draw the cab with some extra length for the front roof overhang
            translate([ -(cabWidth - chassisWidth) / 2, cabLength + cabRoofOverhangFront, chassisHeight ])
            {
                rotate([ 90, 0, 0 ])
                {
                    color(cabColor) linear_extrude(height = cabLength + cabRoofOverhangFront)
                    {
                        cabPolygon();
                    }
                }
            }

            // carve-back the front part of the cab that does not have the roof
            translate([ -(cabWidth - chassisWidth) / 2 - 1, cabLength + cabRoofOverhangFront + 1, chassisHeight -1 ])
            {
                rotate([ 90, 0, 0 ])
                {
                    cuboid([ cabWidth + 2, cabHeightSides - cabCornerRadius / 2 + 1, cabRoofOverhangFront + 1 ],
                        center = false);
                }
            }

            // carve-back the front part of the roof
            translate([ -(cabWidth - chassisWidth) / 2 - 1, cabLength + cabRoofOverhangFront + 1, chassisHeight ])
            {
                rotate([ 90, 0, 0 ])
                {
                    linear_extrude(height = cabRoofOverhangFront + 1)
                    {
                        offset(delta = -cabSteelThickness * 2) cabPolygon();
                    }
                }
            }
        } // end drawing the solid cab & roof overhang 

        // hollow-out the cab
        translate([ -(cabWidth - chassisWidth) / 2, cabLength - cabSteelThickness, chassisHeight ])
        {
            rotate([ 90, 0, 0 ])
            {
                linear_extrude(height = cabLength - cabSteelThickness * 2)
                {
                    offset(delta = -cabSteelThickness * 2) cabPolygon();
                }
            }
        }

        // draw left window
        translate([
            -((cabWidth - chassisWidth) / 2 + cabSteelThickness), cabLength - (leftWindowOffsetFront + leftWindowWidth),
            leftWindowOffsetBottom +
            chassisHeight
        ])
        {
            cuboid([ cabSteelThickness + 2, leftWindowWidth, leftWindowHeight + 1 ], center = false,
                fillet = leftWindowCornerRadius, edges = EDGES_X_ALL)
            {
            }
        }

        // cut left door hole
        translate([ -(cabWidth - chassisWidth) / 2 - 1, doorOffsetBack, chassisHeight ])
        {
            rotate([ 90, 0, 90 ])
            {
                cuboid([ doorWidth, doorHeight, cabSteelThickness + 2 ], center = false)
                {
                }
            }
        }

        // draw right window
        translate([
            cabWidth - ((cabWidth - chassisWidth) / 2 + cabSteelThickness + 1),
            cabLength - (rightWindowOffsetFront + rightWindowWidth), rightWindowOffsetBottom +
            chassisHeight
        ])
        {
            cuboid([ cabSteelThickness + 2, rightWindowWidth, rightWindowHeight + 1 ], center = false,
                fillet = rightWindowCornerRadius, edges = EDGES_X_ALL)
            {
            }
        }

        // cut right door hole
        translate([ cabWidth - (cabWidth - chassisWidth) / 2 - cabSteelThickness - 1, doorOffsetBack, chassisHeight ])
        {
            rotate([ 90, 0, 90 ])
            {
                cuboid([ doorWidth, doorHeight, cabSteelThickness + 2 ], center = false)
                {
                }
            }
        }

        // carve front windows

        // front centre window
        translate([
            cabWidth / 2 - (cabWidth - chassisWidth) / 2 - frontCenterWindowWidth / 2, cabLength + 1,
            frontCenterWindowOffsetBottom +
            chassisHeight
        ])
        {
            rotate([ 90, 0, 0 ])
            {
                cuboid([ frontCenterWindowWidth, frontCenterWindowHeight, cabSteelThickness + 2 ],
                                    center = false, fillet = frontCenterWindowCornerRadius, edges = EDGES_Z_ALL)
                {
                }
            }
        }

        // front left window
        translate([
            -((cabWidth - chassisWidth) / 2 - frontSideWindowOffsetSide), cabLength + 1,
            chassisHeight + (frontSideWindowOffsetBottom + chassisHeight) -
            frontSideWindowHeightLong
        ])
        {
            rotate([ 90, 0, 0 ])
            {
                radiiPoints = [
                    [ 0, 0, frontSideWindowCornerRadius ], [ frontSideWindowWidth, 0, frontSideWindowCornerRadius ],
                    [ frontSideWindowWidth, frontSideWindowHeightLong, frontSideWindowCornerRadius ],
                    [ 0, frontSideWindowHeightShort, frontSideWindowCornerRadius ]
                ];
                linear_extrude(cabSteelThickness + 2) polygon(polyRound(radiiPoints, 30));
            }
        }

        // front right window
        translate([
            cabWidth - frontSideWindowOffsetSide - (cabWidth - chassisWidth) / 2, cabLength + 1,
            (chassisHeight + frontSideWindowOffsetBottom + chassisHeight) -
            frontSideWindowHeightLong
        ])
        {

            mirror([ 1, 0, 0 ])
            {
                rotate([ 90, 0, 0 ])
                {
                    linear_extrude(cabSteelThickness + 2) polygon(polyRound(
                        [
                            [ 0, 0, frontSideWindowCornerRadius ], [ frontSideWindowWidth, 0, frontSideWindowCornerRadius ],
                            [ frontSideWindowWidth, frontSideWindowHeightLong, frontSideWindowCornerRadius ],
                            [ 0, frontSideWindowHeightShort, frontSideWindowCornerRadius ]
                        ],
                        30));
                }
            }
        }

        // carve rear windows

        // rear centre window
        translate([
            cabWidth / 2 - (cabWidth - chassisWidth) / 2 - frontCenterWindowWidth / 2, chassisSteelThickness + 1,
            frontCenterWindowOffsetBottom +
            chassisHeight
        ])
        {
            rotate([ 90, 0, 0 ])
            {
                cuboid([ frontCenterWindowWidth, frontCenterWindowHeight, cabSteelThickness + 2 ],
                                    center = false, fillet = frontCenterWindowCornerRadius, edges = EDGES_Z_ALL)
                {
                }
            }
        }

        // rear left window
        translate([
            -((cabWidth - chassisWidth) / 2 - frontSideWindowOffsetSide), chassisSteelThickness + 1,
            chassisHeight + (frontSideWindowOffsetBottom + chassisHeight) -
            frontSideWindowHeightLong
        ])
        {
            rotate([ 90, 0, 0 ])
            {
                radiiPoints = [
                    [ 0, 0, frontSideWindowCornerRadius ], [ frontSideWindowWidth, 0, frontSideWindowCornerRadius ],
                    [ frontSideWindowWidth, frontSideWindowHeightLong, frontSideWindowCornerRadius ],
                    [ 0, frontSideWindowHeightShort, frontSideWindowCornerRadius ]
                ];
                linear_extrude(cabSteelThickness + 2) polygon(polyRound(radiiPoints, 30));
            }
        }

        // rear right window
        translate([
            cabWidth - frontSideWindowOffsetSide - (cabWidth - chassisWidth) / 2, chassisSteelThickness + 1,
            (chassisHeight + frontSideWindowOffsetBottom + chassisHeight) -
            frontSideWindowHeightLong
        ])
        {

            mirror([ 1, 0, 0 ])
            {
                rotate([ 90, 0, 0 ])
                {
                    linear_extrude(cabSteelThickness + 2) polygon(polyRound(
                        [
                            [ 0, 0, frontSideWindowCornerRadius ], [ frontSideWindowWidth, 0, frontSideWindowCornerRadius ],
                            [ frontSideWindowWidth, frontSideWindowHeightLong, frontSideWindowCornerRadius ],
                            [ 0, frontSideWindowHeightShort, frontSideWindowCornerRadius ]
                        ],
                        30));
                }
            }
        }
    }

    // draw the left door
    union()
    {
        difference()
        {
            translate([ -(cabWidth - chassisWidth) / 2 + cabSteelThickness, doorOffsetBack, chassisHeight ])
            {
                rotate([ 90, 0, 90 ])
                {
                    color(doorColor) cuboid([ doorWidth, doorHeight, cabSteelThickness ], center = false)
                    {
                    }
                }
            }
            // cut the door window
            translate([
                -(cabWidth - chassisWidth) / 2 + cabSteelThickness * 2 - 1,
                (doorWidth - doorWindowWidth) / 2 + doorOffsetBack, chassisHeight +
                doorWindowOffsetBottom
            ])
            {
                rotate([ 90, 0, 90 ])
                {
                    cuboid([ doorWindowWidth, doorWindowHeight, cabSteelThickness + 2 ], center = false,
                        fillet = doorWindowCornerRadius, edges = EDGES_Z_ALL)
                    {
                    }
                }
            }
        }
        // draw the door handle
        translate([
            -(cabWidth - chassisWidth) / 2 - doorHandleLength, doorOffsetBack + doorHandleOffsetBack, chassisHeight +
            doorHandleOffsetBottom
        ])
        {
            rotate([ 90, 0, 90 ])
            {
                color(doorHandleColor) cylinder(doorHandleLength, d = doorHandleDiameter, center = false);
            }
        }

    } // end draw left door

    // draw the right door
    union()
    {
        difference()
        {
            translate([ cabWidth - (cabWidth - chassisWidth) / 2 - cabSteelThickness * 2, doorOffsetBack, chassisHeight ])
            {
                rotate([ 90, 0, 90 ])
                {
                    color(doorColor) cuboid([ doorWidth, doorHeight, cabSteelThickness ], center = false)
                    {
                    }
                }
            }
            // cut the door window
            translate([
                cabWidth - (cabWidth - chassisWidth) / 2 - cabSteelThickness * 2 - 1,
                (doorWidth - doorWindowWidth) / 2 + doorOffsetBack, chassisHeight +
                doorWindowOffsetBottom
            ])
            {
                rotate([ 90, 0, 90 ])
                {
                    cuboid([ doorWindowWidth, doorWindowHeight, cabSteelThickness + 2 ], center = false,
                        fillet = doorWindowCornerRadius, edges = EDGES_Z_ALL)
                    {
                    }
                }
            }
        }
        // draw the door handle
        translate([
            cabWidth - (cabWidth - chassisWidth) / 2 - cabSteelThickness * 2, doorOffsetBack + doorHandleOffsetBack,
            chassisHeight +
            doorHandleOffsetBottom
        ])
        {
            rotate([ 90, 0, 90 ])
            {
                color(doorHandleColor) cylinder(doorHandleLength, d = doorHandleDiameter, center = false);
            }
        }
    } // end draw right door

} // end of cab union

// draw nose
if(showNose) union() {

	difference() {
		// create nose & fittings

		union() {

			// create solid nose
			translate([ (chassisWidth - noseWidth) / 2, cabLength + noseLength, chassisHeight ])
			{
				rotate([ 90, 0, 0 ])
				{
					color(noseColor) linear_extrude(height = noseLength)
					{
						nosePolygon();
					}
				}
			}

			// create air intake
			translate([
				(chassisWidth - noseWidth) / 2 + noseWidth - noseAirIntakeDiameter - noseAirIntakeOffsetRight,
				noseLength + cabLength - noseAirIntakeOffsetFront, noseHeightCenter + chassisHeight - 100
			])
			{
				rotate([ 0, 0, 0 ])
				{
					difference()
					{
						color(noseAirIntakeColor) union()
						{
							cylinder(noseAirIntakeLength + 100, d = noseAirIntakeDiameter, center = false)
							{
							}
							// air intake housing (that the air intake filter sits onto)
							translate([ 0, 0, noseAirIntakeFilterHousingOffsetBottom + 100 ])
							{
								cylinder(noseAirIntakeFilterHousingThickness, d = noseAirIntakeFilterHousingDiameter,
								         center = false)
								{
								}
							}
						}
						translate([ 0, 0, -1 ])
						{
							cylinder(noseAirIntakeLength + 202, d = noseAirIntakeDiameter - noseAirIntakeThickness * 2,
							         center = false)
							{
							}
						}
					}
				}
			}

			// create gas input
			translate([
				(chassisWidth - noseWidth) / 2 + noseWidth - noseFuelInputDiameter - noseFuelInputOffsetRight,
				noseLength + cabLength - noseFuelInputOffsetFront, noseHeightCenter + chassisHeight - 100
			])
			{
				rotate([ 0, 0, 0 ])
				{
					difference()
					{
						union()
						{
							color(noseFuelInputColor) cylinder(noseFuelInputLength + 100, d = noseFuelInputDiameter, center = false)
							{
							}
						}
						translate([ 0, 0, -1 ])
						{
							cylinder(noseFuelInputLength + 102, d = noseFuelInputDiameter - noseFuelInputThickness * 2,
							         center = false)
							{
							}
						}
					}
				}
			}

			// create exhaust
			translate([
				(chassisWidth - noseWidth) / 2 + noseExhaustOffsetLeft, cabLength + noseExhaustOffsetBack,
				noseHeightCenter + chassisHeight - 100
			])
			{
				rotate([ 0, 0, 0 ])
				{
					difference()
					{
						color(noseExhaustColor) union()
						{
							cylinder(noseExhaustLength + 100, d = noseExhaustDiameter, center = false)
							{
							}
						}
						translate([ 0, 0, -1 ])
						{
							cylinder(noseExhaustLength + 102, d = noseExhaustDiameter - noseExhaustThickness * 2,
							         center = false)
							{
							}
						}
					}
				}
			}
		} // end create solid nose

		// hollow-out the nose
		translate([ (chassisWidth - noseWidth) / 2, cabLength + noseLength - noseSteelThickness, chassisHeight ])
		{
			rotate([ 90, 0, 0 ])
			{
				linear_extrude(height = noseLength - noseSteelThickness * 2)
				{
					offset(delta = -noseSteelThickness * 2) nosePolygon();
				}
			}
		}

		// draw front cage on nose
		translate([
			((chassisWidth - noseWidth) / 2) + (noseWidth - noseFrontWindowWidth) / 2, noseLength + cabLength - 3,
			chassisHeight
		])
		{
			cube([ noseFrontWindowWidth - 2, 6, noseFrontWindowHeight - 3 ])
			{
			}
		}

		// cut left engine bay hole
		translate([
			(chassisWidth - noseWidth) / 2 - noseSteelThickness,
			(cabLength + noseLength - noseDoorWidth * 2 - noseDoorOffsetFront * 2 + noseDoorFrameWidth), chassisHeight +
			noseDoorFrameWidth
		])
		{
			rotate([ 90, 0, 90 ])
			{
				color(noseDoorColor) cuboid(
				    [
					    noseLength - noseDoorFrameWidth * 2, noseDoorHeight - noseDoorFrameWidth * 2,
					    noseSteelThickness + 2
				    ],
				    center = false)
				{
				}
			}
		}

		// cut right engine bay hole
		translate([
			noseWidth + (chassisWidth - noseWidth) / 2 - noseSteelThickness - 1,
			(cabLength + noseLength - noseDoorWidth * 2 - noseDoorOffsetFront * 2 + noseDoorFrameWidth), chassisHeight +
			noseDoorFrameWidth
		])
		{
			rotate([ 90, 0, 90 ])
			{
				color(noseDoorColor) cuboid(
				    [
					    noseLength - noseDoorFrameWidth * 2, noseDoorHeight - noseDoorFrameWidth * 2,
					    noseSteelThickness + 2
				    ],
				    center = false)
				{
				}
			}
		}
	}

    // draw the front grille
    color(noseFrontGrilleColor) union(){
        // draw grille border
        translate([
            ( (chassisWidth-noseWidth) / 2 + (noseWidth-noseFrontGrilleWidth) / 2 ),
            cabLength+noseLength - noseFrontGrilleThickness + noseFrontGrilleProtrusionFront,
            chassisHeight
        ]){
            difference(){
                cuboid([noseFrontGrilleWidth, noseFrontGrilleThickness, noseFrontGrilleHeight], center=false);
                translate([noseFrontGrilleBorderWidth, -1, noseFrontGrilleBorderWidth]){
                    cuboid([noseFrontGrilleWidth - noseFrontGrilleBorderWidth*2, noseFrontGrilleThickness + 2, noseFrontGrilleHeight - noseFrontGrilleBorderWidth*2], center=false);
                }
            }
        }
        
        // draw louvre grille
        translate([
            (chassisWidth-noseWidth)/2 + noseFrontGrilleWidth/2 + (noseWidth-noseFrontGrilleWidth)/2, 
            cabLength+noseLength - noseFrontGrilleLouvreWidth/2, 
            chassisHeight + noseFrontGrilleLouvreWidth/2 + noseFrontGrilleBorderWidth
        ]){
            rotate([0, -90, 0]){
                louvreGrill(noseFrontWindowWidth - noseFrontGrilleBorderWidth*2, noseFrontGrilleHeight - noseFrontGrilleLouvreWidth - noseFrontGrilleBorderWidth*2, noseFrontGrilleLouvreThickness, noseFrontGrilleLouvreWidth, noseFrontGrilleLouvreDistance, noseFrontGrilleLouvreAngle);
            }
        }

    }

	// draw the left front door
	translate([
		(chassisWidth - noseWidth) / 2 - noseSteelThickness,
		(cabLength + noseLength - noseDoorWidth - noseDoorOffsetFront),
		chassisHeight
	])
	{
		rotate([ 90, 0, 90 ])
		{
			noseDoor();
		}
	}

	// draw the left rear door
	translate([
		(chassisWidth - noseWidth) / 2 - noseSteelThickness,
		(cabLength + noseLength - noseDoorWidth * 2 - noseDoorOffsetFront * 2),
		chassisHeight
	])
	{
		rotate([ 90, 0, 90 ])
		{
			noseDoor();
		}
	}

	// draw the right front door
	translate([
		noseWidth + (chassisWidth - noseWidth) / 2 + noseSteelThickness, (cabLength + noseLength - noseDoorOffsetFront),
		chassisHeight
	])
	{
		rotate([ 90, 0, -90 ])
		{
			noseDoor();
		}
	}

	// draw the right rear door
	translate([
		noseWidth + (chassisWidth - noseWidth) / 2 + noseSteelThickness,
		(cabLength + noseLength - noseDoorWidth - noseDoorOffsetFront * 2),
		chassisHeight
	])
	{
		rotate([ 90, 0, -90 ])
		{
			noseDoor();
		}
	}

} // end of draw nose union

// draw wheels
if(showWheels) union() {

	// rear axle
	translate([ (chassisWidth - (wheelTrackWidth - wheelFlangeWidth * 2)) / 2, rearAxleOffset, 0 ])
	{
		rotate([ 0, 90, 0 ])
		{
			cylinder(wheelTrackWidth - wheelFlangeWidth * 2, d = axleDiameter, center = false)
			{
			}
		}
	}

	// rear left wheel
	translate([ ((chassisWidth - wheelTrackWidth) / 2) + wheelFlangeWidth, rearAxleOffset, 0 ])
	{
		rotate([ 0, -90, 0 ])
		{
			flangedWheel(wheelDiameter, wheelFlangeHeight, wheelFlangeWidth)
			{
			}
		}
	}

	// rear right wheel
	translate([
		((chassisWidth - wheelTrackWidth) / 2 - wheelFlangeWidth * 2) + wheelTrackWidth + wheelFlangeWidth,
		rearAxleOffset, 0
	])
	{
		rotate([ 0, 90, 0 ])
		{
			flangedWheel(wheelDiameter, wheelFlangeHeight, wheelFlangeWidth)
			{
			}
		}
	}

	// front axle
	translate([ (chassisWidth - (wheelTrackWidth - wheelFlangeWidth * 2)) / 2, frontAxleOffset, 0 ])
	{
		rotate([ 0, 90, 0 ])
		{
			cylinder(wheelTrackWidth - wheelFlangeWidth * 2, d = axleDiameter, center = false)
			{
			}
		}
	}

	// front left wheel
	translate([ ((chassisWidth - wheelTrackWidth) / 2) + wheelFlangeWidth, frontAxleOffset, 0 ])
	{
		rotate([ 0, -90, 0 ])
		{
			flangedWheel(wheelDiameter, wheelFlangeHeight, wheelFlangeWidth)
			{
			}
		}
	}

	// front right wheel
	translate([
		((chassisWidth - wheelTrackWidth) / 2 - wheelFlangeWidth * 2) + wheelTrackWidth + wheelFlangeWidth,
		frontAxleOffset, 0
	])
	{
		rotate([ 0, 90, 0 ])
		{
			flangedWheel(wheelDiameter, wheelFlangeHeight, wheelFlangeWidth)
			{
			}
		}
	}
}
