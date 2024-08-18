/**
 * 3D model of the Brookville Shunter
 * Author: AntzCode Ltd
 * Version: 1.0.1
 * URL: https://github.com/AntzCode/OpenSCAD-Projects/Vehicles/Brookville-Shunter
 * License: GPLv3
 */

include <BOSL/constants.scad>
use <BOSL/shapes.scad>

// asterisk hides it
// this is used to compare the model to a known size (eg: 300mm)
*translate([ 150, 0, 0 ])
{
	color("red") sphere(d = 300)
	{
	}
}

// scale factor for translating to a model size
scale = 7.8;

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
backWheelHoleOffset = 100;
frontWheelHoleOffset = 300;

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

// draw cab
translate([ -(cabWidth - chassisWidth) / 2, 0, chassisHeight ])
{
	cube([ cabWidth, cabLength, cabHeight ])
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

// draw nose
translate([ (chassisWidth - noseWidth) / 2, cabLength, chassisHeight ])
cube([ noseWidth, noseLength, noseHeight ])
{
}
