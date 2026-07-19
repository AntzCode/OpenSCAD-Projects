/**
 * 3D model of the Brookville Shunter
 * Author: AntzCode Ltd
 * Version: 2.0.0
 * URL: https://github.com/AntzCode/OpenSCAD-Projects/Vehicles/Brookville-Shunter
 * License: GPLv3
 * 
 * This file has been converted from BOSL1 to BOSL2 library.
 * Conversion notes:
 *   - Library includes changed from BOSL/ to BOSL2/
 *   - Parameter 'fillet=' changed to 'rounding='
 *   - polyRound() helper function wraps BOSL2 round_corners() with automatic radius clamping
 */

//include <./libraries/BOSL2/std.scad>

include <./libraries/BOSL2-2.0.743/std.scad>

cyl(d=40, l=20, rounding2=2);
