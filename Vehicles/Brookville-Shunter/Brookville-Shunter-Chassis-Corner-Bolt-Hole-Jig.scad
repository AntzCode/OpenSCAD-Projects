

// creates a jig for aligning pilot drill for bolt holes when making the chassis corner pieces for the Brookville Shunter

$fn = 100;

echo (["Jig Height", jigHeight]);
chassisSteelWidth = 100;
chassisSteelThickness = 3;

// what is the bolt hole size? (size of the drill bit)
pilotBoltHoleDiameter = 3.2;

// what is the size of the cylinder guiding the drillbit?
pilotHoleCylinderDiameter = 20;

pilotHoleCylinderHeight = 40;



// how far from the edge of the chassis steel do the holes center along?
pilotBoltHoleInset = 12;

// how many bolt holes?
pilotBoltHoleNum = 4;

// how far the steel slides into the jig
jigSteelSlotDepth = 50;

echo (["Jig Height", jigHeight]);
jigWidth = 80;
jigHeight = 10;
jigScrewHoleDiameter = 4;
echo (["Jig Height", jigHeight]);
jigScrewTabWidth = 30;
tolerance = 0.3;


overallWidth = chassisSteelWidth + tolerance * 2 + jigScrewTabWidth * 2;

overallCylinderLength = jigHeight + pilotHoleCylinderHeight;


difference() {


hull() {
// draw the overall cube
cube([overallWidth, jigWidth, jigHeight], center = false);

// draw the cylinders for the pilot drills


hull() {
for(i =[1:pilotBoltHoleNum]) {
    
    _spacing = chassisSteelWidth / (pilotBoltHoleNum);
    _holePosition = _spacing * i;
    _offsetX = jigScrewTabWidth + tolerance + _holePosition - (_spacing/2);
    #translate([_offsetX, jigSteelSlotDepth + tolerance - pilotBoltHoleInset, 0])
    cylinder(h=overallCylinderLength, d=pilotHoleCylinderDiameter, center = false);
}
}


}

// carve the mount tab clearance
#translate([0, 0, jigHeight])
cube([jigScrewTabWidth, jigWidth, pilotHoleCylinderHeight]);

// carve the mount tab clearance
#translate([chassisSteelWidth + jigScrewTabWidth + tolerance * 2, 0, jigHeight])
cube([jigScrewTabWidth, jigWidth, pilotHoleCylinderHeight]);



// draw the slot for the chassis steel
#translate([jigScrewTabWidth + tolerance, 0, 0])
cube([chassisSteelWidth + tolerance * 2, jigSteelSlotDepth + tolerance, chassisSteelThickness + tolerance], center = false);

// left top
#translate([jigScrewTabWidth/2, jigWidth - jigWidth/4, 0])
cylinder(h=jigHeight, d=jigScrewHoleDiameter, center = false);

// left bottom
#translate([jigScrewTabWidth/2, jigWidth/4, 0])
cylinder(h=jigHeight, d=jigScrewHoleDiameter, center = false);


// right top
#translate([overallWidth - jigScrewTabWidth/2, jigWidth - jigWidth/4, 0])
cylinder(h=jigHeight, d=jigScrewHoleDiameter, center = false);

// right bottom
#translate([overallWidth - jigScrewTabWidth/2, jigWidth/4, 0])
cylinder(h=jigHeight, d=jigScrewHoleDiameter, center = false);


// draw the bolt holes
for(i =[1:pilotBoltHoleNum]) {
    
    _spacing = chassisSteelWidth / (pilotBoltHoleNum);
    _holePosition = _spacing * i;
    _offsetX = jigScrewTabWidth + tolerance + _holePosition - (_spacing/2);
    #translate([_offsetX, jigSteelSlotDepth + tolerance - pilotBoltHoleInset, 0])
    cylinder(h=overallCylinderLength, d=pilotBoltHoleDiameter, center = false);
}


}



