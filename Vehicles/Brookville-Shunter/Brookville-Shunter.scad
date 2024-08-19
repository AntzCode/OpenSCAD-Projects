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

noseFrontWindowWidth = noseWidth - 20 / scale;
noseFrontWindowHeight = noseHeightCenter - 330 / scale;

noseDoorHeight = 730 / scale;
noseDoorWidth = 540 / scale;
noseDoorOffsetFront = 5 / scale;
noseDoorFrameWidth = 40 / scale;
noseDoorColor = "DarkOrange";

noseDoorWindowWidth = 300 / scale;
noseDoorWindowHeight = 300 / scale;
noseDoorWindowOffsetBottom = 200 / scale;

noseExhaustDiameter = 65 / scale;
noseExhaustThickness = 3 / scale;
noseExhaustLength = 50 / scale;
noseExhaustOffsetBack = 90 / scale;
noseExhaustOffsetLeft = ((1200 / 2 - 310) + 65) / scale;

noseAirIntakeDiameter = 80 / scale;
noseAirIntakeThickness = 3 / scale;
noseAirIntakeLength = 100 / scale;
noseAirIntakeOffsetFront = 150 / scale;
noseAirIntakeOffsetRight = ((1200 / 2 - 80) - 80) / scale;

noseAirIntakeFilterHousingDiameter = 165 / scale;
noseAirIntakeFilterHousingThickness = 20 / scale;
noseAirIntakeFilterHousingOffsetBottom = 60 / scale;

noseFuelInputDiameter = 70 / scale;
noseFuelInputThickness = 3 / scale;
noseFuelInputLength = 0 / scale;
noseFuelInputOffsetFront = 160 / scale;
noseFuelInputOffsetRight = ((1200 / 2 - 70) - 340) / scale;

// cab
cabLength = 1730 / scale;
cabWidth = 2220 / scale;
cabHeightCenter = 2280 / scale;
cabHeightSides = 2080 / scale;
cabCornerRadius = 200 / scale;
cabSteelThickness = 3 / scale;
cabRoofOverhangFront = 190 / scale;
cabRoofOverhangBack = 80 / scale;

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
doorColor = "DarkOrange";

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
chassisSteelThickness = 8 / scale;

// Wheel holes
wheelHoleWidth = 380 / scale;
wheelHoleHeight = 110 / scale;

// axles
rearAxleOffset = (730 + (380 / 2)) / scale;
frontAxleOffset = chassisLength - ((650 + 380 / 2) / scale);

wheelColor = "red";
wheelFlangeColor = "darkRed";
wheelDiameter = 450 / scale;
wheelWidth = 18;       // mm in scale
wheelFlangeWidth = 3;  // mm in scale
wheelFlangeHeight = 5; // mm in scale
wheelTrackWidth = 184; // mm in scale
axleDiameter = 20;     // mm in scale

// building materials

// frame timber = 2x2 dressed
frameTimberWidth = 45;
frameTimberHeight = 45;
frameTimberColor = "SaddleBrown";

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

// draw chassis frame
*union()
{
	// left frame
	translate([ chassisSteelThickness, chassisSteelThickness, 0 ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, chassisLength - chassisSteelThickness * 2, frameTimberWidth ])
		{
		}
	}

	// right frame
	translate([ chassisWidth - frameTimberHeight - chassisSteelThickness, chassisSteelThickness, 0 ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, chassisLength - chassisSteelThickness * 2, frameTimberWidth ])
		{
		}
	}

	// rear frame
	translate([ frameTimberHeight + chassisSteelThickness, chassisSteelThickness, 0 ])
	{
		color(frameTimberColor) cube(
		    [ chassisWidth - frameTimberHeight * 2 - chassisSteelThickness * 2, frameTimberHeight, frameTimberWidth ])
		{
		}
	}

	// front frame
	translate(
	    [ frameTimberHeight + chassisSteelThickness, chassisLength - frameTimberHeight - chassisSteelThickness, 0 ])
	{
		color(frameTimberColor) cube(
		    [ chassisWidth - frameTimberHeight * 2 - chassisSteelThickness * 2, frameTimberHeight, frameTimberWidth ])
		{
		}
	}
}

// draw chassis
difference()
{
	color("black", alpha = 1) cube([ chassisWidth, chassisLength, chassisHeight ])
	{
	}

	// draw wheel holes
	translate([ -1, rearAxleOffset - wheelHoleWidth / 2, -1 ])
	{
		color("black") cube([ chassisWidth + 2, wheelHoleWidth, wheelHoleHeight + 1 ])
		{
		}
	}

	// draw wheel holes
	translate([ -1, frontAxleOffset - wheelHoleWidth / 2, -1 ])
	{
		color("black") cube([ chassisWidth + 2, wheelHoleWidth, wheelHoleHeight + 1 ])
		{
		}
	}
}

// draw cab frame
*union()
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
union(){

    // draw the back of the cab roof overhang
    union(){
        difference(){difference(){// draw the cab with some extra length for the roof overhang
                                  translate([ -(cabWidth - chassisWidth) / 2, 0, chassisHeight ]){
                                      rotate([ 90, 0, 0 ]){linear_extrude(height = cabRoofOverhangBack){cabPolygon();
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
}

difference()
{
	difference()
	{ // draw the cab with some extra length for the front roof overhang
		translate([ -(cabWidth - chassisWidth) / 2, cabLength + cabRoofOverhangFront, chassisHeight ])
		{
			rotate([ 90, 0, 0 ])
			{
				linear_extrude(height = cabLength + cabRoofOverhangFront)
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
	}
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
	// draw front windows

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

	// draw rear windows

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
}

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
}

} // end of cab union

// asterisk hides it
// this is used to check the curvature of the cab roof
*translate([ -((cabWidth - chassisWidth) / 2), 0, chassisHeight + cabHeightCenter ])
{
	color("red") cube([ cabWidth, cabLength, 10 ]);
}

// draw nose
union()
{
	difference()
	{
		// create nose & fittings
		union()
		{
			// nose
			translate([ (chassisWidth - noseWidth) / 2, cabLength + noseLength, chassisHeight ])
			{
				rotate([ 90, 0, 0 ])
				{
					linear_extrude(height = noseLength)
					{
						nosePolygon();
					}
				}
			}

			// create air intake
			translate([
				(chassisWidth - noseWidth) / 2 + noseWidth - noseAirIntakeDiameter - noseAirIntakeOffsetRight,
				noseLength + cabLength - noseAirIntakeOffsetFront, noseHeightCenter + chassisHeight - 200
			])
			{
				rotate([ 0, 0, 0 ])
				{
					difference()
					{
						union()
						{
							cylinder(noseAirIntakeLength + 200, d = noseAirIntakeDiameter, center = false)
							{
							}
							// air intake housing (that the air intake filter sits onto)
							translate([ 0, 0, noseAirIntakeFilterHousingOffsetBottom + 200 ])
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
				noseLength + cabLength - noseFuelInputOffsetFront, noseHeightCenter + chassisHeight - 200
			])
			{
				rotate([ 0, 0, 0 ])
				{
					difference()
					{
						union()
						{
							cylinder(noseFuelInputLength + 200, d = noseFuelInputDiameter, center = false)
							{
							}
						}
						translate([ 0, 0, -1 ])
						{
							cylinder(noseFuelInputLength + 202, d = noseFuelInputDiameter - noseFuelInputThickness * 2,
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
				noseHeightCenter + chassisHeight - 200
			])
			{
				rotate([ 0, 0, 0 ])
				{
					difference()
					{
						union()
						{
							cylinder(noseExhaustLength + 200, d = noseExhaustDiameter, center = false)
							{
							}
						}
						translate([ 0, 0, -1 ])
						{
							cylinder(noseExhaustLength + 202, d = noseExhaustDiameter - noseExhaustThickness * 2,
							         center = false)
							{
							}
						}
					}
				}
			}
		}

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

	// draw the left front door
	translate([
		(chassisWidth - noseWidth) / 2 - noseSteelThickness,
		(cabLength + noseLength - noseDoorWidth - noseDoorOffsetFront),
		chassisHeight
	])
	{
		rotate([ 90, 0, 90 ])
		{
			difference()
			{
				color(noseDoorColor) cuboid([ noseDoorWidth, noseDoorHeight, noseSteelThickness ], center = false)
				{
				}

				translate([ (noseDoorWidth - noseDoorWindowWidth) / 2, noseDoorWindowOffsetBottom, -1 ])
				{
					cuboid([ noseDoorWindowWidth, noseDoorWindowHeight, noseSteelThickness + 2 ], center = false)
					{
					}
				}
			}
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
			difference()
			{
				color(noseDoorColor) cuboid([ noseDoorWidth, noseDoorHeight, noseSteelThickness ], center = false)
				{
				}

				translate([ (noseDoorWidth - noseDoorWindowWidth) / 2, noseDoorWindowOffsetBottom, -1 ])
				{
					cuboid([ noseDoorWindowWidth, noseDoorWindowHeight, noseSteelThickness + 2 ], center = false)
					{
					}
				}
			}
		}
	}

	// draw the right front door
	translate([
		noseWidth + (chassisWidth - noseWidth) / 2, (cabLength + noseLength - noseDoorWidth - noseDoorOffsetFront),
		chassisHeight
	])
	{
		rotate([ 90, 0, 90 ])
		{
			difference()
			{
				color(noseDoorColor) cuboid([ noseDoorWidth, noseDoorHeight, noseSteelThickness ], center = false)
				{
				}

				translate([ (noseDoorWidth - noseDoorWindowWidth) / 2, noseDoorWindowOffsetBottom, -1 ])
				{
					cuboid([ noseDoorWindowWidth, noseDoorWindowHeight, noseSteelThickness + 2 ], center = false)
					{
					}
				}
			}
		}
	}

	// draw the right rear door
	translate([
		noseWidth + (chassisWidth - noseWidth) / 2,
		(cabLength + noseLength - noseDoorWidth * 2 - noseDoorOffsetFront * 2),
		chassisHeight
	])
	{
		rotate([ 90, 0, 90 ])
		{
			difference()
			{
				color(noseDoorColor) cuboid([ noseDoorWidth, noseDoorHeight, noseSteelThickness ], center = false)
				{
				}
				translate([ (noseDoorWidth - noseDoorWindowWidth) / 2, noseDoorWindowOffsetBottom, -1 ])
				{
					cuboid([ noseDoorWindowWidth, noseDoorWindowHeight, noseSteelThickness + 2 ], center = false)
					{
					}
				}
			}
		}
	}

} // end of nose union

// draw wheels
union()
{

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
