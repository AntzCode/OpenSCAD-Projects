/**
 * 3D model of the Brookville Shunter
 * Author: AntzCode Ltd
 * Version: 1.0.1
 * URL: https://github.com/AntzCode/OpenSCAD-Projects/Vehicles/Brookville-Shunter
 * License: GPLv3
 */

include <./libraries/BOSL/constants.scad>
use <./libraries/BOSL/shapes.scad>

include <./libraries/Round-Anything/polyround.scad>

// number of facets used to generate an arc
$fn = 32;

// asterisk hides it
// this is used to compare the model to a known size (eg: 300mm)
*translate([ 150, 0, 0 ])
{
	color("red") sphere(d = 300);
}

// constants for configuration
SCALE_FULL = "";
SCALE_7_INCH = 0;
SCALE_3D_PRINT = 1;

// choose a scale size

// 1:4.5 (7.25 inch gauge mini rail)
// modelSize = SCALE_7_INCH;

// 1:50 (3D print small shelf model)
// modelSize = SCALE_3D_PRINT;

// 1:1 (real-life full size model)
modelSize = SCALE_FULL;

// prints calculated sizes to the console
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
showHitchChains = true;

// set the nose to be solid or hollow
hollowNose = true;
hollowCab = true;
solidNosePipes = false;

include <./Brookville-Shunter-Dimensions.scad>
use <./Brookville-Shunter-Dimensions.scad>

// building materials

// frame timber = 2x2 dressed
frameTimberWidth = 45;
frameTimberHeight = 45;
frameTimberColor = "SaddleBrown";

reportSize("Scale Factor 1:x", scale());
reportSize("Overall Height", wheelDiameter()/2 + wheelFlangeHeight()*2 + chassisHeight + cabHeightCenter);
reportSize("Overall Width", cabWidth + cabRoofOverhangSide * 2);
reportSize("Overall Length", chassisLength + hitchBlockLength * 2 + hitchPointLength * 2 + hitchMountPlateThickness * 2);

reportSize("Chassis Width", chassisWidth);
reportSize("Chassis Length", chassisLength);
reportSize("Chassis Height", chassisHeight);
reportSize("Chassis Clearance", wheelDiameter() / 2);
reportSize("Chassis Steel Thickness", chassisSteelThickness());

reportSize("Chassis Wheel Hole Height", wheelHoleHeight);
reportSize("Chassis Wheel Hole Width", wheelHoleWidth);

reportSize("Hitch Overall Length", hitchBlockLength + hitchPointLength + hitchMountPlateThickness);
reportSize("Hitch Block Length", hitchBlockLength);
reportSize("Hitch Block Width", hitchBlockWidth);
reportSize("Hitch Block Height", hitchBlockHeight);
reportSize("Hitch Point Length", hitchPointLength);
reportSize("Hitch Point Thin Diameter", hitchPointDiameterSmall);
reportSize("Hitch Point Wide Diameter", hitchPointDiameterBig);
reportSize("Hitch Block Mount Plate Thickness", hitchMountPlateThickness);
reportSize("Hitch Block Mount Plate Width", hitchMountPlateWidth);
reportSize("Hitch Block Mount Plate Height", hitchMountPlateHeight);

reportSize("Cab Width", cabWidth);
reportSize("Cab Length", cabLength);
reportSize("Cab Height Centre", cabHeightCenter);
reportSize("Cab Height Sides", cabHeightSides);
reportSize("Cab Steel Thickness", cabSteelThickness());

reportSize("Cab Door Width", doorWidth);
reportSize("Cab Door Height", doorHeight);
reportSize("Cab Door Offset Back", doorOffsetBack);
reportSize("Cab Door Offset Bottom", doorOffsetBottom);
reportSize("Cab Door Window Width", doorWindowWidth);
reportSize("Cab Door Window Height", doorWindowHeight);
reportSize("Cab Door Window Offset Bottom", doorWindowOffsetBottom);
reportSize("Cab Door Window Corner Radius", doorWindowCornerRadius);

reportSize("Cab Side Window Width", leftWindowWidth);
reportSize("Cab Side Window Height", leftWindowHeight);
reportSize("Cab Side Window Offset Bottom", leftWindowOffsetBottom);
reportSize("Cab Side Window Offset Front", leftWindowOffsetFront);
reportSize("Cab Side Window Corner Radius", leftWindowCornerRadius);

reportSize("Cab Front-Side Window Width", frontSideWindowWidth);
reportSize("Cab Front-Side Window Height Short Edge", frontSideWindowHeightShort);
reportSize("Cab Front-Side Window Height Long Edge", frontSideWindowHeightLong);
reportSize("Cab Front-Side Window Offset Side", frontSideWindowOffsetSide);
reportSize("Cab Front-Side Window Offset Bottom", frontSideWindowOffsetBottom);
reportSize("Cab Front-Side Window Corner Radius", frontSideWindowCornerRadius);
reportSize("Cab Front-Centre Window Width", frontCenterWindowWidth);
reportSize("Cab Front-Centre Window Height", frontCenterWindowHeight);
reportSize("Cab Front-Centre Window Offset Bottom", frontCenterWindowOffsetBottom);
reportSize("Cab Front-Centre Window Corner Radius", frontCenterWindowCornerRadius);

reportSize("Nose Width", noseWidth);
reportSize("Nose Length", noseLength);
reportSize("Nose Height Center", noseHeightCenter);
reportSize("Nose Height Sides", noseHeightSides);
reportSize("Nose Steel Thickness", noseSteelThickness());

reportSize("Nose Door Width", noseDoorWidth);
reportSize("Nose Door Height", noseDoorHeight);
reportSize("Nose Door Window Width", noseDoorWindowHeight);
reportSize("Nose Door Window Height", noseDoorWindowHeight);
reportSize("Nose Door Window Offset Bottom", noseDoorWindowOffsetBottom);

reportSize("Nose Air Intake Offset Front", noseAirIntakeOffsetFront);
reportSize("Nose Air Intake Offset Right", noseAirIntakeOffsetRight);
reportSize("Nose Air Intake External Diameter", noseAirIntakeDiameter);
reportSize("Nose Air Intake Internal Diameter", noseAirIntakeDiameter - noseAirIntakeThickness*2);
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
reportSize("Nose Exhaust Internal Diameter", noseExhaustDiameter - noseExhaustThickness*2);
reportSize("Nose Exhaust Thickness", noseExhaustThickness);
reportSize("Nose Exhaust Length", noseExhaustLength);

reportSize("Wheel Diameter", wheelDiameter());
reportSize("Wheel Width", wheelWidth());
reportSize("Wheel Flange Height", wheelFlangeHeight());
reportSize("Wheel Flange Width", wheelFlangeWidth());
reportSize("Wheel Overall Width", wheelWidth() + wheelFlangeWidth());
reportSize("Wheel Overall Diameter", wheelDiameter() + wheelFlangeHeight()*2);
reportSize("Rear Axle Offset (from chassis rear edge)", rearAxleOffset());
reportSize("Front Axle Offset (from chassis rear edge)", frontAxleOffset());

reportSize("Wheelbase (center to center)", frontAxleOffset() - rearAxleOffset());

// draw a donut (used for making hitch chains)
module donut(width, height) {
    rotate_extrude(convexity = 10) {
        translate([width/2 - height/2, 0, 0]) circle(r = height/2);
    }
}

// draw a half-donut (used for making hitch chains)
module half_donut(width, height) {
    difference() {
        union() {
            donut(width, height);
        }
        union() {
            translate([-width/2, 0, -height/2 -0.1]) {
                cube([width, width/2, height + 0.2]);
            }
        }
    }
}

// draw a chain link
module chain_link(length, width, height) {
    union() {
        translate([0, -length/2 + width/2, 0]) half_donut(width, height);
        translate([0, length/2 - width/2, 0]) rotate([180, 0, 0]) half_donut(width, height);
        translate([-width/2 + height/2, (length-width)/2 + 0.1, 0]) rotate([90, 0, 0]) cylinder( r = height/2, h = length -width +0.2);
        translate([width/2 - height/2, (length-width)/2 + 0.1, 0]) rotate([90, 0, 0]) cylinder( r = height/2, h = length -width +0.2);
    }
}

// draw the hook for the end of a chain
module chain_hook(length, width, height, degrees){
    translate([-width/2+height/2, -height, -height/8]){
        minkowski(){
            rotate([90, 0, 0]) cylinder(0.1,height/4);
            linear_extrude(height/4) polygon(polyRound([
                [width * 0, length * 0, width],
                [width * 0.15, length * 0.3, length/2],
                [width * -0.5, length * 0.9, length/2],
                [width * 0.5, length * 0.95, width/2],
                [width * 0.85, length * 0.8, length/2],
                [width * 0.8, length * 0.6, width/2],
                [width * 0.95, length * 0.3, 0],
                [width * 0.5, length * 0.75, height],
                [width * 0.2, length * 0.65, height],
                [width * 0.1, length * 0.6, height],
                [width * 0.6, length * 0.2, height],
                [width * 0.75, length * 0, width],
            ]));
        }
    }
}

// draw a chain
module chain(numberOfLinks, linkWidth, linkLength, linkThickness, hookWidth, hookLength, hookThickness){
    translate([0, linkLength/2, 0]){
        for(i = [0:numberOfLinks]){
            translate([0, (linkLength*i) - ((i > 0) ? linkThickness*2 * i : 0 ), 0]){
                rotate([0, (i%2 > 0) ? 0 : 90, 0]){
                    chain_link(linkLength, linkWidth, linkThickness);
                }
            }
        }
        translate([0, (linkLength * numberOfLinks) - ((numberOfLinks > 0) ? linkThickness*2 * numberOfLinks : 0 ) + linkThickness*2, 0]){
            rotate([0, ((numberOfLinks-1)%2 > 0) ? 0 : 90, 0]){
                chain_hook(hookLength, hookWidth, hookThickness);
            }
        }
    }
}

// print the computed size to the console
module reportSize(title, value){
    if(showReportSizes){
        echo(concat(title, value));
    }
}

// draw a louvre grille
module louvreGrill(width, height, louvreWidth, louvreThickness, louvreDistance, louvreAngle)
{
    numberOfLouvres = ceil(height / louvreDistance);
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
		color(wheelColor) cylinder(wheelWidth() - flangeWidth, d = diameter, center = false);
	}
}

// draw the 2D outline shape of the cab when looking front-on
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

// draw the 2D outline shape of the cab roof when looking front-on
module cabRoofPolygon()
{
	archHeight = (cabHeightCenter - (cabHeightSides - cabCornerRadius));
	cabCenterRadius = (((cabWidth / 2) * (cabWidth / 2)) / archHeight) + archHeight;
    translate([-cabRoofOverhangSide, -cabHeightSides, 0]) union(){
        difference(){
            // create the cab shape with overhang sides width added
            polygon(polyRound(
                [
                    [ 0, 0, 0 ],                                              // left bottom
                    [ cabWidth+cabRoofOverhangSide*2, 0, 0 ],                 // right bottom
                    [ cabWidth+cabRoofOverhangSide*2, cabHeightSides, cabCornerRadius*3 ], // right side top
                    [ (cabWidth / 4) * 3, cabHeightCenter, cabCenterRadius ], // roof center
                    [ (cabWidth / 4), cabHeightCenter, cabCenterRadius ],     // roof center
                    [ 0, cabHeightSides, cabCornerRadius*3 ]                  // left side top
                ],
                10));
            
            // carve out the shape to the cab steel thickness
            offset(delta = -cabSteelThickness() * 2) polygon(polyRound(
                [
                    [ 0, 0, 0 ],                                              // left bottom
                    [ cabWidth+cabRoofOverhangSide*2, 0, 0 ],                 // right bottom
                    [ cabWidth+cabRoofOverhangSide*2, cabHeightSides, cabCornerRadius*3 ], // right side top
                    [ (cabWidth / 4) * 3, cabHeightCenter, cabCenterRadius ], // roof center
                    [ (cabWidth / 4), cabHeightCenter, cabCenterRadius ],     // roof center
                    [ 0, cabHeightSides, cabCornerRadius*3 ]                  // left side top
                ],
                10));

            // cut out the non-roof cab shape
            translate([-cabRoofOverhangSide, 0, 0]){
                    polygon(polyRound([
                        [0, 0, 0],
                        [cabWidth + cabRoofOverhangSide * 4, 0, 0],
                        [cabWidth + cabRoofOverhangSide * 4, cabHeightSides - cabCornerRadius, 0],
                        [0, cabHeightSides - cabCornerRadius, 0]
                    ]));
                    square([cabWidth + cabRoofOverhangSide*2 + cabSteelThickness()*4, cabHeightSides - cabCornerRadius], false);
            }   
        }
    }
}

// draw the 2D outline shape of the nose when looking front-on
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
            color(noseDoorColor) cuboid([ noseDoorWidth, noseDoorHeight, noseSteelThickness() ], center = false)
            {
            }
            // cut a window
            translate([ (noseDoorWidth - noseDoorWindowWidth) / 2, noseDoorWindowOffsetBottom, 0 ])
            {
                cuboid([ noseDoorWindowWidth, noseDoorWindowHeight, noseSteelThickness() ], center = false);
            }
        }

        // draw window border
        translate([
            noseDoorWidth/2 - noseDoorWindowWidth/2,
            noseDoorWindowOffsetBottom,
            noseDoorWindowThickness-noseDoorWindowProtrusionFront
        ]){
            rotate([-90,0,0]){
                difference(){
                    color(noseDoorWindowColor) cuboid([noseDoorWindowWidth, noseDoorWindowThickness, noseDoorWindowHeight], center=false);
                    translate([noseDoorWindowBorderWidth, 0, noseDoorWindowBorderWidth]){
                        cuboid([noseDoorWindowWidth - noseDoorWindowBorderWidth*2, noseDoorWindowThickness, noseDoorWindowHeight - noseDoorWindowBorderWidth*2], center=false);
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
                color(noseDoorWindowColor) louvreGrill(noseDoorWindowWidth - noseDoorWindowBorderWidth*2, noseDoorWindowHeight - noseDoorWindowBorderWidth*2, noseDoorWindowLouvreWidth, noseDoorWindowLouvreThickness, noseDoorWindowLouvreDistance, noseDoorWindowLouvreAngle);
            }
        }

    }
}

module hitchBlock(){

    union(){

        // draw the mounting plate
        translate([hitchChainTagWidth, 0, 0]){
            color(hitchBlockColor) cuboid([hitchMountPlateWidth, hitchMountPlateThickness, hitchMountPlateHeight], center=false, fillet=hitchMountPlateCornerRadius);
        }

        // hitch-block brace plate
        translate([hitchMountPlateWidth + hitchChainTagWidth*2, hitchBlockLength + hitchMountPlateThickness, hitchMountPlateHeight]){
            rotate([0, 180, 90]){
                color(hitchBlockColor) minkowski(){
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
            color(hitchBlockColor) cuboid([hitchBlockWidth, hitchBlockLength, hitchBlockHeight], center=false, fillet=hitchBlockCornerRadius);
        }

        // left angle support
        translate([hitchChainTagWidth + hitchMountPlateWidth/2 - hitchBlockWidth/2 + hitchMountPlateCornerRadius*2, hitchMountPlateThickness, 0]){
            rotate([90, 0, 90]){
                color(hitchBlockColor) minkowski(){
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
                color(hitchBlockColor) minkowski(){
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
                                [hitchPointLength + archHeight - archHeight/10, 0, 0]
                            ]));
                        }
                    }
                    // cut the slot
                    translate([-hitchNotchWidth/2, -hitchNotchDepth, hitchPointLength-hitchNotchLength]){
                        cuboid([hitchNotchWidth, hitchNotchDepth, hitchNotchLength+archHeight], center=false, fillet=hitchNotchCornerRadius);
                    }
                }
            }
        }

        if(showHitchChains){
            // draw the left chain
            translate([0, hitchBlockLength - hitchChainTagLength / 4, hitchChainNumberOfLinks*hitchChainLength]){
                rotate([-90, 0, (hitchChainNumberOfLinks%2 > 0) ? 90 : 0 ]){
                    color(hitchChainColor) chain(hitchChainNumberOfLinks, hitchChainWidth, hitchChainLength, hitchChainThickness, hitchChainHookWidth, hitchChainHookLength, hitchChainHookThickness);
                }
            }

            // draw the right chain
            translate([hitchMountPlateWidth + hitchChainTagWidth * 2, hitchBlockLength - hitchChainTagLength / 4, hitchChainNumberOfLinks * hitchChainLength]){
                rotate([-90, 0, (hitchChainNumberOfLinks%2 > 0) ? -90 : 0 ]){
                    color(hitchChainColor) chain(hitchChainNumberOfLinks, hitchChainWidth, hitchChainLength, hitchChainThickness, hitchChainHookWidth, hitchChainHookLength, hitchChainHookThickness);
                }
            }
        }
    }
}

// draw chassis frame
if (showChassisFrame) union()
{
	// left frame
    chassisLeftFrameLength = chassisLength - chassisSteelThickness() * 2;
    reportSize("Chassis Left Frame Length", chassisLeftFrameLength);
	translate([ chassisSteelThickness(), chassisSteelThickness(), 0 ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, chassisLeftFrameLength, frameTimberWidth ]);
	}

	// right frame
    chassisRightFrameLength = chassisWidth - frameTimberHeight - chassisSteelThickness();
    reportSize("Chassis Right Frame Length", chassisRightFrameLength);
	translate([chassisRightFrameLength, chassisSteelThickness(), 0 ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, chassisLength - chassisSteelThickness() * 2, frameTimberWidth ]);
	}

	// rear frame
    chassisRearFrameLength = frameTimberHeight + chassisSteelThickness();
    reportSize("Chassis Rear Frame Length", chassisRearFrameLength);
	translate([ chassisRearFrameLength, chassisSteelThickness(), 0 ])
	{
		color(frameTimberColor) cube([ chassisWidth - frameTimberHeight * 2 - chassisSteelThickness() * 2, frameTimberHeight, frameTimberWidth ]);
	}

	// front frame
    chassisFrontFrameLength = chassisWidth - frameTimberHeight * 2 - chassisSteelThickness() * 2;
    reportSize("Chassis Front Frame Length", chassisFrontFrameLength);
	translate(
	    [ frameTimberHeight + chassisSteelThickness(), chassisLength - frameTimberHeight - chassisSteelThickness(), 0 ])
	{
		color(frameTimberColor) cube([chassisFrontFrameLength, frameTimberHeight, frameTimberWidth ]);
	}
    
}

// draw chassis
if(showChassis) difference()
{
	color(chassisColor, alpha = 1) cuboid([ chassisWidth, chassisLength, chassisHeight ], center=false, fillet=chassisCornerRadius, edges=EDGES_Z_ALL);

	// draw wheel holes
	rearWheelHoleOffsetBack = rearAxleOffset() - wheelHoleWidth / 2;
    reportSize("Rear Wheel Hole Offset Back", rearWheelHoleOffsetBack);
    translate([ 0, rearWheelHoleOffsetBack, 0 ])
	{
		cube([ chassisWidth, wheelHoleWidth, wheelHoleHeight ]);
	}

	// draw wheel holes
    frontWheelHoleOffsetBack = frontAxleOffset() - wheelHoleWidth / 2;
    reportSize("Front Wheel Hole Offset Back", frontWheelHoleOffsetBack);
	translate([ 0, frontWheelHoleOffsetBack, 0 ])
	{
		cube([ chassisWidth, wheelHoleWidth, wheelHoleHeight ]);
	}
}

// draw front hitch
if(showFrontHitch) union(){
    translate([chassisWidth/2 - hitchMountPlateWidth/2 - hitchChainTagWidth, chassisLength, 0]){
        rotate([0, 0, 0]){
            hitchBlock();
        }
    }
}

// draw rear hitch
if(showRearHitch) union(){
     translate([chassisWidth/2 + hitchMountPlateWidth/2 + hitchChainTagWidth, 0, 0]){
        rotate([0, 0, 180]){
            hitchBlock();
        }
    }
}

// draw cab frame
if(showCabFrame) union()
{
	// right front frame
	translate([
		cabWidth - cabSteelThickness() - (frameTimberHeight + (cabWidth - chassisWidth) / 2),
		cabLength - frameTimberWidth - cabSteelThickness(),
		chassisHeight
	])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ]);
	}

	// left front frame
	translate([
		-(cabWidth - chassisWidth) / 2 + cabSteelThickness(), cabLength - frameTimberWidth - cabSteelThickness(),
		chassisHeight
	])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ]);
	}

	// right rear frame
	translate([
		cabWidth - (frameTimberHeight + (cabWidth - chassisWidth) / 2) + -cabSteelThickness(), cabSteelThickness(),
		chassisHeight
	])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ]);
	}

	// left rear frame
	translate([ -(cabWidth - chassisWidth) / 2 + cabSteelThickness(), cabSteelThickness(), chassisHeight ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ]);
	}
}
         
// draw cab
if(showCab) union(){

    reportSize("Cab Roof Length with Overhangs", cabLength + cabRoofOverhangBack + cabRoofOverhangFront);
    reportSize("Cab Roof Overhang Back", cabRoofOverhangBack);
    reportSize("Cab Roof Overhang Front", cabRoofOverhangFront);

    // draw the cab roof overhang
    difference(){
        translate([ -(cabWidth - chassisWidth) / 2, cabLength + cabRoofOverhangFront, chassisHeight + cabHeightSides ]){
            rotate([ 90, 0, 0 ]){
                color(cabColor) linear_extrude(height = cabLength + cabRoofOverhangBack + cabRoofOverhangFront){
                    cabRoofPolygon();
                }
            }
        }

        translate([ -(cabWidth - chassisWidth) / 2, cabLength + cabRoofOverhangFront, chassisHeight ])
        {
            rotate([ 90, 0, 0 ])
            {
                color(cabColor) linear_extrude(height = cabRoofOverhangFront)
                {
                    offset(delta = -cabRoofOverhangFront ) cabPolygon();
                }
            }
        }
    
        translate([ -(cabWidth - chassisWidth) / 2, 0, chassisHeight ])
        {
            rotate([ 90, 0, 0 ])
            {
                color(cabColor) linear_extrude(height = cabRoofOverhangFront)
                {
                    offset(delta = -cabRoofOverhangBack ) cabPolygon();
                }
            }
        }
    
    }

    difference() {
        difference() {
            // draw the cab with some extra length for the front roof overhang
            translate([ -(cabWidth - chassisWidth) / 2, cabLength, chassisHeight ])
            {
                rotate([ 90, 0, 0 ])
                {
                    color(cabColor) linear_extrude(height = cabLength)
                    {
                        cabPolygon();
                    }
                }
            }
            
        } // end drawing the solid cab & roof overhang 

        // hollow-out the cab
        if(hollowCab){
            translate([ -(cabWidth - chassisWidth) / 2, cabLength - cabSteelThickness(), chassisHeight ])
            {
                rotate([ 90, 0, 0 ])
                {
                    linear_extrude(height = cabLength - cabSteelThickness() * 2)
                    {
                        offset(delta = -cabSteelThickness() ) cabPolygon();
                    }
                }
            }
        }

        // draw left window
        translate([
            -((cabWidth - chassisWidth) / 2 ), cabLength - (leftWindowOffsetFront + leftWindowWidth),
            leftWindowOffsetBottom +
            chassisHeight
        ])
        {
            cuboid([ cabSteelThickness(), leftWindowWidth, leftWindowHeight ], center = false,
                fillet = leftWindowCornerRadius, edges = EDGES_X_ALL);
        }

        // cut left door hole
        translate([ -(cabWidth - chassisWidth) / 2, doorOffsetBack, chassisHeight + doorOffsetBottom ])
        {
            rotate([ 90, 0, 90 ])
            {
                cuboid([ doorWidth, doorHeight, cabSteelThickness() ], center = false);
            }
        }

        // draw right window
        translate([
            -((cabWidth - chassisWidth) / 2 - (cabWidth - cabSteelThickness())),
            cabLength - (rightWindowOffsetFront + rightWindowWidth), rightWindowOffsetBottom +
            chassisHeight
        ])
        {
            cuboid([ cabSteelThickness() + 0.001, rightWindowWidth, rightWindowHeight ], 
                center = false, fillet = rightWindowCornerRadius, edges = EDGES_X_ALL);
        }

        // cut right door hole
        translate([ cabWidth - (cabWidth - chassisWidth) / 2 - cabSteelThickness(), doorOffsetBack, chassisHeight + doorOffsetBottom ])
        {
            rotate([ 90, 0, 90 ])
            {
                cuboid([ doorWidth, doorHeight, cabSteelThickness() ], center = false);
            }
        }

        // carve front windows

        // front centre window
        translate([
            cabWidth / 2 - (cabWidth - chassisWidth) / 2 - frontCenterWindowWidth / 2, cabLength,
            frontCenterWindowOffsetBottom +
            chassisHeight
        ])
        {
            rotate([ 90, 0, 0 ])
            {
                cuboid([ frontCenterWindowWidth, frontCenterWindowHeight, cabSteelThickness() + 0.001 ],
                            center = false, fillet = frontCenterWindowCornerRadius, edges = EDGES_Z_ALL);
            }
        }

        // front left window
        translate([
            -((cabWidth - chassisWidth) / 2 - frontSideWindowOffsetSide), cabLength,
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
                linear_extrude(cabSteelThickness()) polygon(polyRound(radiiPoints, 30));
            }
        }

        // front right window
        translate([
            cabWidth - frontSideWindowOffsetSide - (cabWidth - chassisWidth) / 2, cabLength,
            (chassisHeight + frontSideWindowOffsetBottom + chassisHeight) -
            frontSideWindowHeightLong
        ])
        {

            mirror([ 1, 0, 0 ])
            {
                rotate([ 90, 0, 0 ])
                {
                    linear_extrude(cabSteelThickness()) polygon(polyRound(
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
            cabWidth / 2 - (cabWidth - chassisWidth) / 2 - frontCenterWindowWidth / 2, cabSteelThickness() ,
            frontCenterWindowOffsetBottom +
            chassisHeight
        ])
        {
            rotate([ 90, 0, 0 ])
            {
                cuboid([ frontCenterWindowWidth, frontCenterWindowHeight, cabSteelThickness() ],
                        center = false, fillet = frontCenterWindowCornerRadius, edges = EDGES_Z_ALL);
            }
        }

        // rear left window
        translate([
            -((cabWidth - chassisWidth) / 2 - frontSideWindowOffsetSide), cabSteelThickness(),
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
                linear_extrude(cabSteelThickness()) polygon(polyRound(radiiPoints, 30));
            }
        }

        // rear right window
        translate([
            cabWidth - frontSideWindowOffsetSide - (cabWidth - chassisWidth) / 2, cabSteelThickness(),
            (chassisHeight + frontSideWindowOffsetBottom + chassisHeight) -
            frontSideWindowHeightLong
        ])
        {

            mirror([ 1, 0, 0 ])
            {
                rotate([ 90, 0, 0 ])
                {
                    linear_extrude(cabSteelThickness()) polygon(polyRound(
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
            translate([ -(cabWidth - chassisWidth) / 2 + cabSteelThickness(), doorOffsetBack, chassisHeight + doorOffsetBottom ])
            {
                rotate([ 90, 0, 90 ])
                {
                    color(doorColor) cuboid([ doorWidth, doorHeight, cabSteelThickness() ], center = false);
                }
            }
            // cut the door window
            translate([
                -(cabWidth - chassisWidth) / 2 + cabSteelThickness(),
                (doorWidth - doorWindowWidth) / 2 + doorOffsetBack, chassisHeight +
                doorWindowOffsetBottom
            ])
            {
                rotate([ 90, 0, 90 ])
                {
                    cuboid([ doorWindowWidth, doorWindowHeight, cabSteelThickness() * 2 ], center = false,
                        fillet = doorWindowCornerRadius, edges = EDGES_Z_ALL);
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
            translate([ cabWidth - (cabWidth - chassisWidth) / 2 - cabSteelThickness() * 2, doorOffsetBack, chassisHeight + doorOffsetBottom ])
            {
                rotate([ 90, 0, 90 ])
                {
                    color(doorColor) cuboid([ doorWidth, doorHeight, cabSteelThickness() ], center = false);
                }
            }
            // cut the door window
            translate([
                cabWidth - (cabWidth - chassisWidth) / 2 - cabSteelThickness() * 2,
                (doorWidth - doorWindowWidth) / 2 + doorOffsetBack, chassisHeight +
                doorWindowOffsetBottom
            ])
            {
                rotate([ 90, 0, 90 ])
                {
                    cuboid([ doorWindowWidth, doorWindowHeight, cabSteelThickness() ], 
                        center = false, fillet = doorWindowCornerRadius, edges = EDGES_Z_ALL);
                }
            }
        }
        // draw the door handle
        translate([
            cabWidth - (cabWidth - chassisWidth) / 2 - cabSteelThickness() * 2, doorOffsetBack + doorHandleOffsetBack,
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
				noseLength + cabLength - noseAirIntakeOffsetFront, noseHeightCenter + chassisHeight - 20
			])
			{
				rotate([ 0, 0, 0 ])
				{
					difference()
					{
						color(noseAirIntakeColor) union()
						{
							cylinder(noseAirIntakeLength + 20, d = noseAirIntakeDiameter, center = false);
							// air intake housing (that the air intake filter sits onto)
							translate([ 0, 0, noseAirIntakeFilterHousingOffsetBottom + 20 ])
							{
								cylinder(noseAirIntakeFilterHousingThickness, d = noseAirIntakeFilterHousingDiameter, center = false);
							}
						}
						translate([ 0, 0, -1 ])
						{
							if(!solidNosePipes){
							    cylinder(noseAirIntakeLength + 202, d = noseAirIntakeDiameter - noseAirIntakeThickness * 2, center = false);
							}
						}
					}
				}
			}

			// create gas input
			translate([
				(chassisWidth - noseWidth) / 2 + noseWidth - noseFuelInputDiameter - noseFuelInputOffsetRight,
				noseLength + cabLength - noseFuelInputOffsetFront, noseHeightCenter + chassisHeight - 20
			])
			{
				rotate([ 0, 0, 0 ])
				{
					difference()
					{
						union()
						{
							color(noseFuelInputColor) cylinder(noseFuelInputLength + 20, d = noseFuelInputDiameter, center = false);
						}
						translate([ 0, 0, -1 ])
						{
							if(!solidNosePipes){
							    cylinder(noseFuelInputLength + 102, d = noseFuelInputDiameter - noseFuelInputThickness * 2, center = false);
							}
						}
					}
				}
			}

			// create exhaust
			translate([
				(chassisWidth - noseWidth) / 2 + noseExhaustOffsetLeft, cabLength + noseExhaustOffsetBack,
				noseHeightCenter + chassisHeight - 20
			])
			{
				rotate([ 0, 0, 0 ])
				{
					difference()
					{
						color(noseExhaustColor) union()
						{
							cylinder(noseExhaustLength + 20, d = noseExhaustDiameter, center = false);
						}
						translate([ 0, 0, -1 ])
						{
							if(!solidNosePipes){
							    cylinder(noseExhaustLength + 102, d = noseExhaustDiameter - noseExhaustThickness * 2, center = false);
							}
						}
					}
				}
			}
		} // end create solid nose

		// hollow-out the nose
		if(hollowNose){
			translate([ (chassisWidth - noseWidth) / 2, cabLength + noseLength - noseSteelThickness(), chassisHeight ])
				{
				rotate([ 90, 0, 0 ])
				{
					linear_extrude(height = noseLength - noseSteelThickness() * 2)
					{
						offset(delta = -noseSteelThickness() * 2) nosePolygon();
					}
				}
			}
		}

		// cut front engine bay hole
		translate([
			((chassisWidth - noseWidth) / 2) + ((noseWidth - noseFrontWindowWidth) / 2), (noseLength + cabLength) - (noseSteelThickness()),
			chassisHeight
		])
		{
			cube([ noseFrontWindowWidth, noseSteelThickness(), noseFrontWindowHeight ]);
		}

		// cut left engine bay hole
		translate([
			(chassisWidth - noseWidth) / 2,
			(cabLength + noseLength - noseDoorWidth * 2 - noseDoorOffsetFront * 2 + noseDoorFrameWidth), chassisHeight +
			noseDoorFrameWidth
		])
		{
			rotate([ 90, 0, 90 ])
			{
				color(noseDoorColor) cuboid(
				    [
					    noseLength - noseDoorFrameWidth * 2, noseDoorHeight - noseDoorFrameWidth * 2,
					    noseSteelThickness()
				    ],
				    center = false);
			}
		}

		// cut right engine bay hole
		translate([
			((chassisWidth - noseWidth) / 2) + (noseWidth - noseSteelThickness()),
			(cabLength + noseLength - noseDoorWidth * 2 - noseDoorOffsetFront * 2 + noseDoorFrameWidth), chassisHeight +
			noseDoorFrameWidth
		])
		{
			rotate([ 90, 0, 90 ])
			{
				color(noseDoorColor) cuboid(
				    [
					    noseLength - noseDoorFrameWidth * 2, noseDoorHeight - noseDoorFrameWidth * 2,
					    noseSteelThickness() 
				    ],
				    center = false);
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
                translate([noseFrontGrilleBorderWidth, 0, noseFrontGrilleBorderWidth ]){
                    cuboid([noseFrontGrilleWidth - noseFrontGrilleBorderWidth*2, noseFrontGrilleThickness, noseFrontGrilleHeight - noseFrontGrilleBorderWidth*2], center=false);
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
                louvreGrill(noseFrontWindowWidth - noseFrontGrilleBorderWidth*2, noseFrontGrilleHeight - noseFrontGrilleLouvreWidth - noseFrontGrilleBorderWidth, noseFrontGrilleLouvreThickness, noseFrontGrilleLouvreWidth, noseFrontGrilleLouvreDistance, noseFrontGrilleLouvreAngle);
            }
        }

    }

	// draw the left front door
	translate([
		(chassisWidth - noseWidth) / 2 - noseSteelThickness(),
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
		(chassisWidth - noseWidth) / 2 - noseSteelThickness(),
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
		noseWidth + (chassisWidth - noseWidth) / 2 + noseSteelThickness(), (cabLength + noseLength - noseDoorOffsetFront),
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
		noseWidth + (chassisWidth - noseWidth) / 2 + noseSteelThickness(),
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
	translate([ (chassisWidth - (wheelTrackWidth() - wheelFlangeWidth() * 2)) / 2, rearAxleOffset(), 0 ])
	{
		rotate([ 0, 90, 0 ])
		{
			cylinder(wheelTrackWidth() - wheelFlangeWidth() * 2, d = axleDiameter(), center = false);
		}
	}

	// rear left wheel
	translate([ ((chassisWidth - wheelTrackWidth()) / 2) + wheelFlangeWidth(), rearAxleOffset(), 0 ])
	{
		rotate([ 0, -90, 0 ])
		{
			flangedWheel(wheelDiameter(), wheelFlangeHeight(), wheelFlangeWidth());
		}
	}

	// rear right wheel
	translate([
		((chassisWidth - wheelTrackWidth()) / 2 - wheelFlangeWidth() * 2) + wheelTrackWidth() + wheelFlangeWidth(),
		rearAxleOffset(), 0
	])
	{
		rotate([ 0, 90, 0 ])
		{
			flangedWheel(wheelDiameter(), wheelFlangeHeight(), wheelFlangeWidth());
		}
	}

	// front axle
	translate([ (chassisWidth - (wheelTrackWidth() - wheelFlangeWidth() * 2)) / 2, frontAxleOffset(), 0 ])
	{
		rotate([ 0, 90, 0 ])
		{
			cylinder(wheelTrackWidth() - wheelFlangeWidth() * 2, d = axleDiameter(), center = false);
		}
	}

	// front left wheel
	translate([ ((chassisWidth - wheelTrackWidth()) / 2) + wheelFlangeWidth(), frontAxleOffset(), 0 ])
	{
		rotate([ 0, -90, 0 ])
		{
			flangedWheel(wheelDiameter(), wheelFlangeHeight(), wheelFlangeWidth());
		}
	}

	// front right wheel
	translate([
		((chassisWidth - wheelTrackWidth()) / 2 - wheelFlangeWidth() * 2) + wheelTrackWidth() + wheelFlangeWidth(),
		frontAxleOffset(), 0
	])
	{
		rotate([ 0, 90, 0 ])
		{
			flangedWheel(wheelDiameter(), wheelFlangeHeight(), wheelFlangeWidth());
		}
	}
}

