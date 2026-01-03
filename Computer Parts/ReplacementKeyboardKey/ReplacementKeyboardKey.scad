include <./libraries/BOSL/constants.scad>
use <./libraries/BOSL/shapes.scad>

include <./libraries/Round-Anything/polyround.scad>

$fn = 132;

keyCurveDepth = 0.5;
keyCurveRadius = 40;
keyEdgeFilletRadius = 1.5;
keyWidth = 19;
keyLength = 18;
keyThickness = 6;
keyHollowDepth = 2.5;
keyStemEdgeFilletRadius = 1;
keyStemLength = 10.5;
keyStemOuterWidth = 6;
keyStemOuterLength = 6;
keyStemWallThickness = 1.6;
keyStemClipDepth = 0.5;
keyStemClipOffset = 2;
keyStemClipSlitThickness = 0.3;
keyStemClipSlitOverhang = 4;


module drawKey() {
  difference() {
  cuboid([ keyWidth, keyLength, keyThickness ], center = false, fillet=keyEdgeFilletRadius, edges=EDGES_ALL);
  translate([keyWidth/2, keyLength, keyCurveRadius+keyThickness-keyCurveDepth]) rotate([90, 90, 0]) cylinder(keyLength, r=keyCurveRadius);
  
  color("red") translate([keyHollowDepth, keyHollowDepth, -0.1]) cuboid([keyWidth-keyHollowDepth*2, keyLength-keyHollowDepth*2, keyHollowDepth], center=false);
  }
}

module drawShaft() {
  difference() {
    union() {
      cuboid([keyStemOuterWidth, keyStemOuterLength, keyStemLength], center = false, fillet=keyStemEdgeFilletRadius, edges=EDGES_ALL);
      translate([keyStemOuterWidth, keyStemWallThickness, keyStemClipOffset]) rotate([0, 90, 0]) right_triangle([keyStemClipDepth, keyStemOuterLength-keyStemWallThickness*2, keyStemClipDepth], orient=ORIENT_Y, align=V_ALLPOS, center=undef);
      translate([0, keyStemOuterLength-keyStemWallThickness, keyStemClipOffset]) rotate([0, 90, 180]) right_triangle([keyStemClipDepth, keyStemOuterLength-keyStemWallThickness*2, keyStemClipDepth], orient=ORIENT_Y, align=V_ALLPOS, center=undef);
    }
    translate([keyStemWallThickness, keyStemWallThickness, -keyStemWallThickness]) cuboid([keyStemOuterWidth-keyStemWallThickness*2, keyStemOuterLength-keyStemWallThickness*2, keyStemLength + keyStemWallThickness*2], center = false);
    translate([-keyStemClipDepth, keyStemWallThickness, 0]) cuboid([keyStemOuterWidth+keyStemClipDepth*2, keyStemClipSlitThickness, keyStemClipOffset+keyStemClipSlitOverhang], center = false);
  
    translate([-keyStemClipDepth, keyStemOuterLength-keyStemWallThickness-keyStemClipSlitThickness, 0]) cuboid([keyStemOuterWidth+keyStemClipDepth*2, keyStemClipSlitThickness, keyStemClipOffset+keyStemClipSlitOverhang], center = false);
  }
}


drawKey();

translate([keyWidth/2-keyStemOuterWidth/2, keyLength/2-keyStemOuterLength/2, -(keyStemLength-(keyThickness-keyCurveDepth))]) drawShaft();
