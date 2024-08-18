/**
 * 3D model of the Brookville Shunter
 * Author: AntzCode Ltd
 * Version: 1.0.1
 * URL: https://github.com/AntzCode/OpenSCAD-Projects/Vehicles/Brookville-Shunter
 * License: GPLv3
 */

include <BOSL/constants.scad>
use <BOSL/shapes.scad>

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
scale = 8;

// nose
noseWidth = 1200 / scale;
noseLength = 1090 / scale;
noseHeight = 1070 / scale;

// cab
cabHeight = 2280 / scale;
cabLength = 1730 / scale;
cabWidth = 2220 / scale;

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
backWheelHoleOffset = 600/scale;
frontWheelHoleOffset = 2100/scale;

wheelColor = "red";
wheelFlangeColor = "darkRed";
wheelDiameter = 450 / scale;
wheelWidth = 30;       // mm in scale
wheelFlangeWidth = 3;  // mm in scale
wheelFlangeHeight = 2; // mm in scale
wheelTrackWidth = 184; // mm in scale
axleDiameter = 20;     // mm in scale

// building materials

// frame timber = 3x2 dressed
frameTimberWidth = 55;
frameTimberHeight = 75;
frameTimberColor = "SaddleBrown";

module flangedWheel(diameter, flangeHeight, flangeWidth)
{
	color(wheelFlangeColor)
	    cylinder(flangeWidth, d = diameter + flangeHeight * 2, center = false)
	{
	}
	translate([ 0, 0, flangeWidth ])
	{
		color(wheelColor) cylinder(wheelWidth - flangeWidth, d = diameter, center = false)
		{
		}
	}
}

// draw chassis frame

union()
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

difference()
{
	// draw chassis
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

// left front frame
translate(
    [ cabWidth - (frameTimberHeight + (cabWidth - chassisWidth) / 2), cabLength - frameTimberWidth, chassisHeight ])
{
	color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeight ])
	{
	}
}

// right front frame
translate([ -(cabWidth - chassisWidth) / 2, cabLength - frameTimberWidth, chassisHeight ])
{
	color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeight ])
	{
	}
}

// left rear frame
translate([ cabWidth - (frameTimberHeight + (cabWidth - chassisWidth) / 2), 0, chassisHeight ])
{
	color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeight ])
	{
	}
}

// right rear frame
translate([ -(cabWidth - chassisWidth) / 2, 0, chassisHeight ])
{
	color(frameTimberColor) cube([ frameTimberHeight, frameTimberWidth, cabHeight ])
	{
	}
}

difference()
{
	// draw cab
	translate([ -(cabWidth - chassisWidth) / 2, 0, chassisHeight ])
	{
		cuboid([ cabWidth, cabLength, cabHeight ], center = false, fillet = 10, edges = EDGES_Y_TOP)
		{
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

// draw nose
translate([ (chassisWidth - noseWidth) / 2, cabLength, chassisHeight ])
{
	cube([ noseWidth, noseLength, noseHeight ])
	{
	}
}

// draw wheels

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