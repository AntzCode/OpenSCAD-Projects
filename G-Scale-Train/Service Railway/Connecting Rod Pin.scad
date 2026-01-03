include<./libraries/BOSL/constants.scad>
use<./libraries/BOSL/shapes.scad>

include<./libraries/Round-Anything/polyround.scad>

$fn = 32;

// basic settings

pinLength = 15;
pinDiameter = 4;
pinHeadDiameter = 6;
pinHeadHeight = 4;
pinSplitWidth = 1.3;
pinSplitLength = 7;
pinBarbDiameter = 6;
pinBarbLength = 3;



difference(){

union(){
    // pin
    cyl(l=pinLength, d=pinDiameter, fillet=0);

    // pin head
    translate([0,0,pinLength-pinHeadHeight*2])
    cyl(l=pinHeadHeight, d=pinHeadDiameter, fillet=1);

    // pin barb
    translate([0, 0, (-(pinLength/2))-pinBarbLength/2+pinBarbLength])
    cylinder(h=pinBarbLength, d1=pinDiameter, d2=pinBarbDiameter, center=true);

    }

    // pin split
    translate([0, 0, -pinLength/2+pinSplitLength/2])
    cuboid([pinBarbDiameter, pinSplitWidth, pinSplitLength]);

}
