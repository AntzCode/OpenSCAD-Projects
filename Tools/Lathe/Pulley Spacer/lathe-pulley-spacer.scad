include <./libraries/BOSL/constants.scad>
use <./libraries/BOSL/shapes.scad>

$fn=100;

outerDiameter=36;
innerDiameter=20;
height=17;
tabWidth=6;
tabThickness=outerDiameter-innerDiameter;
gap=20;
tabHoleDiameter=6;
tabHoleOffset=2;
tabHoleClearance=4;
tabEdgeFillet=2;

function tabHoleClearanceDiameter() = tabHoleDiameter+tabHoleClearance*2;

function tabHoleCenterOffsetY() = (outerDiameter/2+(tabWidth-tabHoleDiameter/2-tabHoleOffset));

module tab(){
    cuboid([tabThickness, tabWidth*2, height], center=false, fillet=tabEdgeFillet, edges=EDGES_Z_ALL);
} // end module tab()

module spacer(){
    difference(){
        union(){
            // draw a pipe
            difference(){
                cylinder(height, d=outerDiameter);
                
                // tab hole clearance for tab A
                color("red") translate([-outerDiameter/2,tabHoleCenterOffsetY(),height/2]) rotate([0,90,0]) cylinder(outerDiameter, d=tabHoleClearanceDiameter());
                
                // tab hole clearance for tab B
                color("red") translate([-outerDiameter/2,-tabHoleCenterOffsetY(),height/2]) rotate([0,90,0]) cylinder(outerDiameter, d=tabHoleClearanceDiameter());
                
            }
            
            // add tab A 
            translate([-tabThickness/2, (outerDiameter/2 - tabWidth), 0]) tab();
            
            // add tab B
            translate([-tabThickness/2, -(outerDiameter/2 + tabWidth), 0]) tab();
        }
        
        // drill hole through tab A
        color("red") translate([-(outerDiameter/2), tabHoleCenterOffsetY(), height/2]) rotate([0,90,0]) cylinder(outerDiameter, d=tabHoleDiameter);
        
        // drill hole through tab B
        color("red") translate([-(outerDiameter/2), -(outerDiameter/2+(tabWidth-tabHoleDiameter/2-tabHoleOffset)), height/2]) rotate([0,90,0]) cylinder(outerDiameter, d=tabHoleDiameter);
        
        // drill the center of the pipe
        cylinder(height, d=innerDiameter);
        
    }
} // end module spacer()

*translate([-gap/2,0,0]){
    // front half
    difference(){
        spacer();
        color("red") translate([0, -(outerDiameter + tabWidth*2)/2, 0]) cube([outerDiameter/2, outerDiameter + tabWidth*2, height],false);
    }
}

translate([gap/2,0,0]){
    // back half
    difference(){
        spacer();
        color("red") translate([-outerDiameter/2, -(outerDiameter + tabWidth*2)/2, 0]) cube([outerDiameter/2, outerDiameter + tabWidth*2, height],false);
    }
}



