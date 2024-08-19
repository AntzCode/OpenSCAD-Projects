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
noseCornerRadius = 400 / scale;
noseSteelThickness = 3 / scale;

noseFrontWindowWidth = noseWidth - 20 / scale;
noseFrontWindowHeight = noseHeightCenter - 330 / scale;

// cab
cabLength = 1730 / scale;
cabWidth = 2220 / scale;
cabHeightCenter = 2280 / scale;
cabHeightSides = 2080 / scale;
cabCornerRadius = 200 / scale;
cabSteelThickness = 3 / scale;

// cab side windows
leftWindowWidth = 980 / scale;
leftWindowHeight = 720 / scale;
leftWindowOffsetBottom = (100 + 1070) / scale;
leftWindowOffsetFront = 150 / scale;
leftWindowCornerRadius = 70 / scale;

rightWindowWidth = 980 / scale;
rightWindowHeight = 720 / scale;
rightWindowOffsetBottom = (100 + 1070) / scale;
rightWindowOffsetFront = 150 / scale;
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

// chassis
chassisWidth = 1600 / scale;
chassisHeight = 470 / scale;
chassisLength = 2970 / scale;
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
		    [ 0, 0, 0 ],                                                 // left bottom
		    [ noseWidth, 0, 0 ],                                         // right bottom
		    [ noseWidth, noseHeightSides, noseCornerRadius ],            // right side top
		    [ (noseWidth / 4) * 3, noseHeightCenter, noseCenterRadius ], // nose center
		    [ (noseWidth / 4), noseHeightCenter, noseCenterRadius ],     // nose center
		    [ 0, noseHeightSides, noseCornerRadius ]                     // left side top
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
difference()
{

	translate([ -(cabWidth - chassisWidth) / 2, cabLength, chassisHeight ])
	{
		rotate([ 90, 0, 0 ])
		{
			linear_extrude(height = cabLength)
			{
				cabPolygon();
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
		cuboid([ cabSteelThickness + 2, leftWindowWidth, leftWindowHeight + 1 ], center=false, fillet=leftWindowCornerRadius, edges=EDGES_X_ALL)
		{
		}
	}

	// draw right window
	translate([
		cabWidth - ((cabWidth - chassisWidth) / 2 + cabSteelThickness + 1),
		cabLength - (rightWindowOffsetFront + rightWindowWidth), rightWindowOffsetBottom +
		chassisHeight
	])
	{
		cuboid([ cabSteelThickness + 2, rightWindowWidth, rightWindowHeight + 1 ], center=false, fillet=rightWindowCornerRadius, edges=EDGES_X_ALL)
		{
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
			color("red") cuboid([ frontCenterWindowWidth, frontCenterWindowHeight, cabSteelThickness + 2 ],
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
			color("red") linear_extrude(cabSteelThickness + 2) polygon(polyRound(radiiPoints, 30));
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
				color("red") linear_extrude(cabSteelThickness + 2) polygon(polyRound(
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
			color("red") cuboid([ frontCenterWindowWidth, frontCenterWindowHeight, cabSteelThickness + 2 ],
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
			color("red") linear_extrude(cabSteelThickness + 2) polygon(polyRound(radiiPoints, 30));
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
				color("red") linear_extrude(cabSteelThickness + 2) polygon(polyRound(
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
	}
}

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
