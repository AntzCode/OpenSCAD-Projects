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

// cab
cabLength = 1730 / scale;
cabWidth = 2220 / scale;
cabHeightCenter = 2280 / scale;
cabHeightSides = 2080 / scale;
cabCornerRadius = 200 / scale;

rightWindowWidth = 300 / scale;
rightWindowHeight = 300 / scale;
rightWindowCabOffset = 1600 / scale;

// chassis
chassisWidth = 1600 / scale;
chassisHeight = 470 / scale;
chassisLength = 2970 / scale;

// Wheel holes
wheelHoleWidth = chassisHeight / 2;
wheelHoleHeight = chassisHeight / 4;
backWheelHoleOffset = 600 / scale;
frontWheelHoleOffset = 2100 / scale;

wheelColor = "red";
wheelFlangeColor = "darkRed";
wheelDiameter = 450 / scale;
wheelWidth = 18;       // mm in scale
wheelFlangeWidth = 3;  // mm in scale
wheelFlangeHeight = 5; // mm in scale
wheelTrackWidth = 184; // mm in scale
axleDiameter = 20;     // mm in scale

// building materials

// frame timber = 3x2 dressed
frameTimberWidth = 55;
frameTimberHeight = 75;
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
	echo(cabCenterRadius);
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
	echo(noseCenterRadius);
	polygon(polyRound(
	    [
		    [ 0, 0, 0 ],                                              // left bottom
		    [ noseWidth, 0, 0 ],                                       // right bottom
		    [ noseWidth, noseHeightSides, noseCornerRadius ],            // right side top
		    [ (noseWidth / 4) * 3, noseHeightCenter, noseCenterRadius ], // nose center
		    [ (noseWidth / 4), noseHeightCenter, noseCenterRadius ],     // nose center
		    [ 0, noseHeightSides, noseCornerRadius ]                    // left side top
	    ],
	    10));
}

// draw chassis frame
*union()
{
	// left frame
	translate([ 0, 0, 0 ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, chassisLength, frameTimberWidth ])
		{
		}
	}

	// right frame
	translate([ chassisWidth - frameTimberHeight, 0, 0 ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, chassisLength, frameTimberWidth ])
		{
		}
	}

	// rear frame
	translate([ frameTimberHeight, 0, 0 ])
	{
		color(frameTimberColor) cube([ chassisWidth - frameTimberHeight * 2, frameTimberHeight, frameTimberWidth ])
		{
		}
	}

	// front frame
	translate([ frameTimberHeight, chassisLength - frameTimberHeight, 0 ])
	{
		color(frameTimberColor) cube([ chassisWidth - frameTimberHeight * 2, frameTimberHeight, frameTimberWidth ])
		{
		}
	}
}

// draw chassis
difference()
{
	color("black") cube([ chassisWidth, chassisLength, chassisHeight ])
	{
	}

	// draw wheel holes
	translate([ -1, backWheelHoleOffset, -1 ])
	{
		color("red") cube([ chassisWidth + 2, wheelHoleWidth, wheelHoleHeight + 1 ])
		{
		}
	}

	// draw wheel holes
	translate([ -1, frontWheelHoleOffset, -1 ])
	{
		color("red") cube([ chassisWidth + 2, wheelHoleWidth, wheelHoleHeight + 1 ])
		{
		}
	}
}

// draw cab frame
*union()
{
	// left front frame
	translate(
	    [ cabWidth - (frameTimberHeight + (cabWidth - chassisWidth) / 2), cabLength - frameTimberWidth, chassisHeight ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ])
		{
		}
	}

	// right front frame
	translate([ -(cabWidth - chassisWidth) / 2, cabLength - frameTimberWidth, chassisHeight ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ])
		{
		}
	}

	// left rear frame
	translate([ cabWidth - (frameTimberHeight + (cabWidth - chassisWidth) / 2), 0, chassisHeight ])
	{
		color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeightCenter ])
		{
		}
	}

	// right rear frame
	translate([ -(cabWidth - chassisWidth) / 2, 0, chassisHeight ])
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

	// draw right window
	translate([ cabWidth / 2, cabLength / 2, rightWindowCabOffset + chassisHeight ])
	{
		color("red") cube([ cabWidth / 2 + 2, rightWindowWidth, rightWindowHeight + 1 ])
		{
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
}

// draw wheels
union()
{

	// rear axle
	translate([
		(chassisWidth - (wheelTrackWidth - wheelFlangeWidth * 2)) / 2,
		(backWheelHoleOffset - wheelHoleWidth / 2) + (wheelDiameter / 2 + wheelFlangeHeight), 0
	])
	{
		rotate([ 0, 90, 0 ])
		{
			cylinder(wheelTrackWidth - wheelFlangeWidth * 2, d = axleDiameter, center = false)
			{
			}
		}
	}

	// rear left wheel
	translate([
		((chassisWidth - wheelTrackWidth) / 2) + wheelFlangeWidth,
		(backWheelHoleOffset - wheelHoleWidth / 2) + (wheelDiameter / 2 + wheelFlangeHeight), 0
	])
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
		(backWheelHoleOffset - wheelHoleWidth / 2) + (wheelDiameter / 2 + wheelFlangeHeight), 0
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
	translate([
		(chassisWidth - (wheelTrackWidth - wheelFlangeWidth * 2)) / 2,
		(frontWheelHoleOffset - wheelHoleWidth / 2) + (wheelDiameter / 2 + wheelFlangeHeight), 0
	])
	{
		rotate([ 0, 90, 0 ])
		{
			cylinder(wheelTrackWidth - wheelFlangeWidth * 2, d = axleDiameter, center = false)
			{
			}
		}
	}

	// front left wheel
	translate([
		((chassisWidth - wheelTrackWidth) / 2) + wheelFlangeWidth,
		(frontWheelHoleOffset - wheelHoleWidth / 2) + (wheelDiameter / 2 + wheelFlangeHeight), 0
	])
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
		(frontWheelHoleOffset - wheelHoleWidth / 2) + (wheelDiameter / 2 + wheelFlangeHeight), 0
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