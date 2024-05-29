/**
 * 3D model enclosure for LM2596
 * Author: AntzCode Ltd
 * URL: https://github.com/AntzCode/OpenSCAD-Projects/Electronics%20Protective%20Cases/XL4015
 * License: GPLv3
*/

include <BOSL/constants.scad>
use <BOSL/shapes.scad>

// number of facets used to generate an arc
$fn=32;

// show/hide various parts
hideMountPlate=false;
hideBox=false;
hideBoard=false;
hideHardWiresAccess=false;
hideDcPlugAccess=false;

// does the mount plate have screwholes?
drillMountPlateScrewHoles=true;

// attach screwtabs to the lid or not?
hideScrewTabs=false;

// explode the model for screenshots
explode=false;
explodeDistanceX=-30;
explodeDistanceY=-30;
explodeDistanceZ=30;

// box size
boardWidth=36;
boardLength=50;
boardThickness=2;

// gap above chipboard for components to fit
gapAboveBoard=10;

// gap below chipboard for soldering to fit
gapBelowBoard=3;

// thickness of the enclosure walls
boxThickness=2;

// thickness of the mounting plate
mountPlateThickness=4;

// chamfer on external edges
chamfer=1;

// width and height of the hole for the USB port
usbPlugsWidth=32;
usbPlugsHeight=7;

// width and height of the hole for the wires port
hardWiresWidth=10;
hardWiresHeight=10;
hardWiresOffsetLeft=4;

// screwdriver access hole for hard wires
hardWiresScrewholeDiameter=4;
hardWiresScrewholeLength=10;
hardWiresScrewholeOffsetLeft=4;
hardWiresScrewholeOffsetTop=3;

// adjustable position of the DC plug port
dcPlugWidth=9;
dcPlugHeight=10;
dcPlugOffsetRight=2;

// screw tab - how wide along the body
screwTabWidth=18;

// screw tab - how far does it protrude?
screwTabLength=10;

// screw tab - how thick is it?
screwTabThickness=4;

// screw tab - want smooth edges?
screwTabFillet=2;

// screw tab - diameter of the screw hole
screwTabScrewholeDiameter=4.5;

// screw tab - move the hole further from the box 
screwTabScrewholeOffset=0.5;

// screw tab - countersink settings
screwTabScrewholeCountersinkDiameter=8;
screwTabScrewholeCountersinkDepth=3;

// vent holes on the left side
ventHoleLeftOffsetTop=8;
ventHoleLeftOffsetBack=10;
ventHoleLeftRows=5;
ventHoleLeftColumns=16;
ventHoleLeftDiameter=1.4;
ventHoleLeftSpacing=0.8;

// vent holes on the right side
ventHoleRightOffsetTop=8;
ventHoleRightOffsetBack=10;
ventHoleRightRows=5;
ventHoleRightColumns=15;
ventHoleRightDiameter=1.5;
ventHoleRightSpacing=0.5;

// mount plate width
mountPlateWidth=boardWidth;
mountPlateLength=boardLength;

// mount-plate clips (circular lugs)
mountPlateClipsDiameter=2;
mountPlateClipsProtrusionOffset=-0.5;
mountPlateClipsPositionOffset=2;

// screw holes on the mount plate
mountPlateScrewHoleDiameter=4;
mountPlateScrewHoleCountersinkDiameter=8;
mountPlateScrewHoleCountersinkDepth=2.5;
mountPlateScrewHole1OffsetY=4;
mountPlateScrewHole2OffsetY=-15;

// lower-center pin
mountPlatePin1Length=5;
mountPlatePin1Diameter=2.4;
mountPlatePin1OffsetX=0;
mountPlatePin1OffsetY=11;

// upper-left pin
mountPlatePin2Length=5;
mountPlatePin2Diameter=2.4;
mountPlatePin2OffsetX=-10.5;
mountPlatePin2OffsetY=-7.7;

// upper-right pin
mountPlatePin3Length=5;
mountPlatePin3Diameter=2.4;
mountPlatePin3OffsetX=10.5;
mountPlatePin3OffsetY=-7.7;

// board-support under pins 1-4
mountPlatePinRiserDiameter=4;

/**
 * End of user configuration - do not adjust below this line
 */

boxOuterWidth=boardWidth+(boxThickness*2);
boxOuterLength=boardLength+boxThickness;
boxOuterHeight=boardThickness+gapAboveBoard+gapBelowBoard+boxThickness+mountPlateThickness;

module roundedtab(xdim,ydim,zdim,rdim){
    cuboid([xdim,ydim,zdim], fillet=rdim, edges=EDGES_Y_TOP+EDGE_TOP_FR+EDGES_Z_FR);
}

// box shell
module box_shell(){


    // move the box to sit on 0 at z plane
    translate([0,0,boxOuterHeight/2]){
        
        union(){
            difference(){
                
                // draw the box as a solid cube
                translate([0,-boxThickness,0]){
                    cuboid([boxOuterWidth,boxOuterLength,boxOuterHeight], chamfer=chamfer, edges=EDGES_X_TOP+EDGES_Y_TOP+EDGES_Z_ALL);
                }
                
                // hollow-out the interior from the bottom
                translate([0,-boxThickness,-boxThickness]){
                    cuboid([boxOuterWidth-boxThickness*2,boxOuterLength-boxThickness*2,(boxOuterHeight-boxThickness)+mountPlateThickness]);
                }
                
            }
            
            // lug/stopper on right side
            translate([(mountPlateWidth/2+1)-2,-(boardLength/2-10/2-16),-(boxOuterHeight/2-mountPlateThickness-gapBelowBoard-boardThickness-0.4)]){
                rounded_prismoid(size1=[3,6], size2=[1,6], h=3, shift=[1,0], r=1);
            }
            
            // lug/stopper on left side
            translate([-(mountPlateWidth/2),-(boardLength/2-10/2-18),-(boxOuterHeight/2-mountPlateThickness-gapBelowBoard-boardThickness-0.4)]){
            
                rotate([0,0,180]){
                    rounded_prismoid(size1=[3,6], size2=[1,6], h=3, shift=[1,0], r=1);
                }
            }
        }
    }
}

// hole for USB plugs
module usb_plugs_port(){
translate([
        0,
        boxOuterLength/2-boxThickness-1,
        mountPlateThickness+boxThickness/2+(usbPlugsHeight/2-1)
    ]){
        cuboid([usbPlugsWidth,boxThickness+1,usbPlugsHeight+mountPlateThickness+gapBelowBoard+1]);
    }
}
// hole for chipboard
module chipboard_access(){
    translate([0,boardLength/2-boxThickness,(boardThickness+mountPlateThickness+gapBelowBoard)/2-0.5]){
        cuboid([boardWidth,boxThickness+1,boardThickness+mountPlateThickness+gapBelowBoard+1]);
    }
}

// hole for hard wires
module hard_wires_port(){
    translate([(boxOuterWidth/2-hardWiresWidth/2)-hardWiresOffsetLeft,-(boxOuterLength/2+boxThickness/2),(hardWiresHeight/2-1)]){
        cuboid([hardWiresWidth,boxThickness+1,usbPlugsHeight+mountPlateThickness+gapBelowBoard+1]);
    }
}

// hole for hard wires screwdriver access
module hard_wires_screw_hole(){
    translate([(boxOuterWidth/2-hardWiresScrewholeLength/2)-hardWiresScrewholeOffsetLeft,-(boxOuterLength/2-hardWiresScrewholeOffsetTop),boxOuterHeight/2+1]){
        hull(){
            translate([-(hardWiresScrewholeLength-hardWiresScrewholeDiameter)/2,0,0]){
                zcyl(l=boxOuterHeight,d=hardWiresScrewholeDiameter);
            }
            translate([(hardWiresScrewholeLength-hardWiresScrewholeDiameter/2)/2,0,0]){
                zcyl(l=boxOuterHeight,d=hardWiresScrewholeDiameter);
            }
        }
    }
}

// hole for dc plug
module dc_plug_port(){
    translate([-(boxOuterWidth/2-dcPlugWidth/2)+dcPlugOffsetRight,-(boxOuterLength/2+boxThickness/2),(dcPlugHeight/2-1)]){
        cuboid([dcPlugWidth,boxThickness+1,dcPlugHeight+mountPlateThickness+gapBelowBoard+1]);
    }
}

// left screw tab
module left_screw_tab(){
    translate([-(boxOuterWidth/2+screwTabLength/2),0,screwTabThickness/2]){
        rotate([0,0,-90]){
            difference(){
                roundedtab(screwTabWidth,screwTabLength,screwTabThickness,screwTabFillet);
                translate([0,screwTabScrewholeOffset,0.1]){
                    zcyl(h=screwTabThickness+1,d=screwTabScrewholeDiameter);
                    translate([0,screwTabScrewholeOffset,screwTabThickness/2-screwTabScrewholeCountersinkDepth/2+0.001]){
                        zcyl(l=screwTabScrewholeCountersinkDepth,d1=screwTabScrewholeDiameter,d2=screwTabScrewholeCountersinkDiameter);
                    }
                }
            }
        }
    }
}

// right screw tab
module right_screw_tab(){
    translate([+(boxOuterWidth/2+screwTabLength/2),0,screwTabThickness/2]){
        rotate([0,0,90]){
            difference(){
                roundedtab(screwTabWidth,screwTabLength,screwTabThickness,screwTabFillet);
                translate([0,screwTabScrewholeOffset,0.1]){
                    zcyl(h=screwTabThickness+1,d=screwTabScrewholeDiameter);
                    translate([0,screwTabScrewholeOffset,screwTabThickness/2-screwTabScrewholeCountersinkDepth/2+0.001]){
                        zcyl(l=screwTabScrewholeCountersinkDepth,d1=screwTabScrewholeDiameter,d2=screwTabScrewholeCountersinkDiameter);
                    }
                }
            }
        }
    }
}

module etch_text(){
        
    translate([
        -(boxOuterWidth/2-(1+chamfer)),
        -((boxOuterLength/2)+boxThickness),
        boxOuterHeight-(4+chamfer)
    ]){

        if(!hideDcPlugAccess || !hideHardWiresAccess){
            translate([7,0,0]){
                rotate([90,0,0]){
                    // input volt range
                    linear_extrude(0.5){
                        text("DC Input 6v - 40v", size=2.2);
                    }
                }
            }
        }

        if(!hideDcPlugAccess){

            translate([-3,0,3]){
                rotate([90,0,0]){
                    // dc plug polarity
                    translate([0.9+chamfer,-4,0]){
                        arced_slot(d=3.5, h=0.5, sd=0.4, sa=50, ea=310, align=V_ALLPOS);
                    }
                }
                translate([2,-0.5,-3.9]){
                    ycyl(l=0.5,d=1.7,align=V_ALLPOS);
                }
                
                // dc plug positive pole
                translate([5.2,0,-3.95]){
                    rotate([90,0,0]){
                        linear_extrude(0.5){
                            text("+", size=2);
                        }
                    }
                }
                
                // dc plug points to positive
                translate([4,0,-3.05]){
                    rotate([90,0,0]){
                        linear_extrude(0.5){
                            square([1,0.5], true);
                        }
                    }
                }
                
                // dc plug points to negative
                translate([0.5,0,-3.05]){
                    rotate([90,0,0]){
                        linear_extrude(0.5){
                            square([1,0.5], true);
                        }
                    }
                }
                
                // dc plug negative pole
                translate([-1.4,0,-3.8]){
                    rotate([90,0,0]){
                        linear_extrude(0.5){
                            text("-", size=2);
                        }
                    }
                }
                
            }

            if(!hideHardWiresAccess){

                // wired positive pole
                translate([19,0,-3.5]){
                    rotate([90,0,0]){
                        linear_extrude(0.5){
                            text("+", size=3);
                        }
                    }
                }
                
                // wired negative pole
                translate([26.5,0,-3.3]){
                    rotate([90,0,0]){
                        linear_extrude(0.5){
                            text("-", size=3);
                        }
                    }
                }
            }
        }
    }
}

// mount plate
module mount_plate(){

    union(){
        
        translate([0,-boxThickness/2,mountPlateThickness/2]){
            // draw the plate as a solid piece, chamfered top edges to help inserting into the cover
            cuboid([boardWidth,boardLength,mountPlateThickness], chamfer=0.2, edges=EDGES_X_TOP+EDGES_Y_TOP);
        }
        
        // add pin 1
        translate([mountPlatePin1OffsetX,mountPlatePin1OffsetY,mountPlateThickness+mountPlatePin1Length/2]){
            zcyl(h=mountPlatePin1Length,d1=mountPlatePin1Diameter,d2=mountPlatePin1Diameter-0.5);
            translate([0,0,-(mountPlatePin1Length/2-gapBelowBoard/2)]){
                zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
            }
        }
        
        // add pin 2
        translate([mountPlatePin2OffsetX,mountPlatePin2OffsetY,mountPlateThickness+mountPlatePin2Length/2]){
            zcyl(h=mountPlatePin2Length,d1=mountPlatePin2Diameter,d2=mountPlatePin2Diameter-0.5);
            translate([0,0,-(mountPlatePin1Length/2-gapBelowBoard/2)]){
                zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
            }
        }
        
        // add pin 3
        translate([mountPlatePin3OffsetX,mountPlatePin3OffsetY,mountPlateThickness+mountPlatePin3Length/2]){
            zcyl(h=mountPlatePin3Length,d1=mountPlatePin3Diameter,d2=mountPlatePin3Diameter-0.5);
            translate([0,0,-(mountPlatePin1Length/2-gapBelowBoard/2)]){
                zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
            }
        }

        // support under USB left
        translate([mountPlateWidth/2/2,mountPlateLength/2-mountPlatePinRiserDiameter,mountPlateThickness+gapBelowBoard/2]){
            zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
        }
        
        // support under USB right
        translate([-mountPlateWidth/2/2,mountPlateLength/2-mountPlatePinRiserDiameter,mountPlateThickness+gapBelowBoard/2]){
            zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
        }
            
        // support under hard wires terminals
        translate([mountPlateWidth/2-mountPlatePinRiserDiameter-3,-(mountPlateLength/2-mountPlatePinRiserDiameter-3),mountPlateThickness+gapBelowBoard/2]){
            zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
        }
        
        // support under DC input port
        translate([-mountPlateWidth/2+mountPlatePinRiserDiameter,-(mountPlateLength/2-mountPlatePinRiserDiameter+boxThickness),mountPlateThickness+gapBelowBoard/2]){
            zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
        }
            
        // support along left edge
        translate([-mountPlateWidth/2+1,-boxThickness/2,mountPlateThickness+gapBelowBoard/2]){
            cuboid([2,boardLength,gapBelowBoard]);
        }
            
        // support along right edge
         translate([mountPlateWidth/2-1,-boxThickness/2,mountPlateThickness+gapBelowBoard/2]){
            cuboid([2,boardLength,gapBelowBoard]);
        }
    }
}

// mount plate clips
module mount_plate_clips(){

    translate([
        (mountPlateWidth/2-(mountPlateClipsDiameter/2+mountPlateClipsProtrusionOffset)),
        mountPlateLength/2-mountPlateClipsPositionOffset-boxThickness,
        mountPlateThickness/2
    ]){
        sphere(d=mountPlateClipsDiameter);
    }
    
    translate([-(mountPlateWidth/2-(mountPlateClipsDiameter/2+mountPlateClipsProtrusionOffset)),mountPlateLength/2-mountPlateClipsPositionOffset-boxThickness,mountPlateThickness/2]){
        sphere(d=mountPlateClipsDiameter);
    }
    
    translate([(mountPlateWidth/2-(mountPlateClipsDiameter/2+mountPlateClipsProtrusionOffset)),-(mountPlateLength/2-mountPlateClipsPositionOffset),mountPlateThickness/2]){
        sphere(d=mountPlateClipsDiameter);
    }
    
    translate([-(mountPlateWidth/2-(mountPlateClipsDiameter/2+mountPlateClipsProtrusionOffset)),-(mountPlateLength/2-mountPlateClipsPositionOffset),mountPlateThickness/2]){
        sphere(d=mountPlateClipsDiameter);
    }
}

// mount plate screw holes
module mount_plate_screw_holes(){
    translate([0,mountPlateScrewHole1OffsetY,mountPlateThickness/2]){
        zcyl(l=mountPlateThickness+(drillMountPlateScrewHoles?1:-2),d=mountPlateScrewHoleDiameter);
        translate([0,0,mountPlateThickness/2-mountPlateScrewHoleCountersinkDepth/2+0.001]){
            zcyl(l=mountPlateScrewHoleCountersinkDepth,d1=mountPlateScrewHoleDiameter,d2=mountPlateScrewHoleCountersinkDiameter);
        }
    }
    translate([0,mountPlateScrewHole2OffsetY,mountPlateThickness/2]){
        zcyl(l=mountPlateThickness+(drillMountPlateScrewHoles?1:-2),d=mountPlateScrewHoleDiameter);
        translate([0,0,mountPlateThickness/2-mountPlateScrewHoleCountersinkDepth/2+0.001]){
            zcyl(l=mountPlateScrewHoleCountersinkDepth,d1=mountPlateScrewHoleDiameter,d2=mountPlateScrewHoleCountersinkDiameter);
        }
    }
}

module vent_holes(ventHoleRows, ventHoleColumns, ventHoleDiameter, ventHoleSpacing){
    for(y=[0:1:ventHoleRows-1]){
        for (x=[0:1:ventHoleColumns-1]) {
            if(y%2==0){
                // even row
                translate([(ventHoleDiameter+ventHoleSpacing)/2,0,0]){
                    translate([ventHoleDiameter*x+ventHoleSpacing*x, ventHoleDiameter*y+ventHoleSpacing/2*y, 0]){
                        zcyl(l=boxThickness*2+0.01,d=ventHoleDiameter);
                    }
                }
            }else{
                // odd row
                translate([ventHoleDiameter*x+ventHoleSpacing*x, ventHoleDiameter*y+(ventHoleSpacing/2)*y, 0]){
                    zcyl(l=boxThickness*2+0.01,d=ventHoleDiameter);
                }
            }
        }
    }
}

module etch_label(){
    
    rotate([0,0,180]){
        translate([-12,5,boxOuterHeight]){
            scale([0.35,0.35,1]){
                linear_extrude(0.5){
                import("./assets/usb.dxf");
                }
            }
        }
        translate([-14,-10,boxOuterHeight]){
            linear_extrude(0.5){
                text("USB", size=10);
            }
        }
        
        translate([-8,-18,boxOuterHeight]){
            linear_extrude(0.5){
                text("5v 3A", size=5);
            }
        }
    }
}

if(!hideBox){
    // draw the box lid

    boxExplodeX=explode ? explodeDistanceX * (!hideBoard ? 2 : 1) : 0;
    boxExplodeY=explode ? explodeDistanceY * (!hideBoard ? 2 : 1) : 0;
    boxExplodeZ=explode ? explodeDistanceZ * (!hideBoard ? 2 : 1) : 0;

    // move the box shell if we are rendering parts in exploded view    
    translate([boxExplodeX,boxExplodeY,boxExplodeZ]){

        // join the tabs onto the box shell

        union(){
            
            // cut holes into the box shell
            difference(){
                
                box_shell();
                
                mount_plate_clips();
                chipboard_access();
                usb_plugs_port();

                if(!hideHardWiresAccess){
                    hard_wires_port();
                    hard_wires_screw_hole();
                }

                if(!hideDcPlugAccess){
                    dc_plug_port();
                }

                mount_plate_clips();

                translate([5,0.19,0]){
                    etch_text();
                }

                translate([0,0,-0.3]){
                    etch_label();
                }
                
                // vent holes at left
                translate([boxOuterWidth/2,-(boxOuterLength/2-ventHoleLeftOffsetTop),ventHoleLeftOffsetBack]){
                    rotate([90,0,90]){
                        vent_holes(ventHoleLeftRows, ventHoleLeftColumns, ventHoleLeftDiameter, ventHoleLeftSpacing);
                    }
                }

                // vent holes at right
                translate([-boxOuterWidth/2,-(boxOuterLength/2-ventHoleRightOffsetTop),ventHoleRightOffsetBack]){
                    rotate([90,0,90]){
                        vent_holes(ventHoleRightRows, ventHoleRightColumns, ventHoleRightDiameter, ventHoleRightSpacing);
                    }
                }
            }
            
            if(!hideScrewTabs){
                // only attach screw tabs if not hidden
                left_screw_tab();
                right_screw_tab();
            }
        }
    }
}

if(!hideBoard){
    // draw the board (for debugging)

    boardExplodeX=explode ? explodeDistanceX * 1 : 0;
    boardExplodeY=explode ? explodeDistanceY * 1 : 0;
    boardExplodeZ=explode ? explodeDistanceZ * 1 : 0;
    
    translate([boardExplodeX,boardExplodeY,boardExplodeZ]){
        translate([0,-boxThickness/2,mountPlateThickness+gapBelowBoard+boardThickness/2]){
            color ("red") cube([boardWidth,boardLength,boardThickness], true);
        }
    }
}

if(!hideMountPlate){
    // draw the mount plate

    difference(){

        union(){
            // attach the clips to the mount plate
            mount_plate();
            mount_plate_clips();
        }

        // drill screw holes into the mount plate
        mount_plate_screw_holes();

    }

}

