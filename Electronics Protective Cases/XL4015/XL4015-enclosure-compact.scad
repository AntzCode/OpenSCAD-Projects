/**
 * 3D model enclosure for XL4015
 * Author: AntzCode Ltd
 * Version: 1.0.1
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
hideAdjustmentAccess=false;

// does the mount plate have screwholes?
drillMountPlateScrewHoles=true;

// attach screwtabs to the lid or not?
hideScrewTabs=false;

// explode the model for screenshots
explode=false;
explodeDistanceX=-18;
explodeDistanceY=-15;
explodeDistanceZ=24;

// box size
boardWidth=26;
boardLength=51;
boardThickness=1.5;
boardSpacingX=1;
boardSpacingY=1;

// gap above chipboard for components to fit
gapAboveBoard=11;

// gap below chipboard for soldering to fit
gapBelowBoard=1.5;

// thickness of the enclosure walls
boxThickness=2;

// thickness of the mounting plate
mountPlateThickness=4;

// chamfer on external edges
chamfer=1;

// width and height of the hole for the wires port
hardWiresPortWidth=10;
hardWiresPortHeight=6;

// adjustable position of the hard wires port
hardWiresPortOffsetX=12;
hardWiresPortOffsetY=0;

// screwdriver access hole for hard wires
hardWiresScrewholeDiameter=5;
hardWiresScrewholeLength=10;
hardWiresScrewholeOffsetX=12;
hardWiresScrewholeOffsetY=0.5;

// screwdriver access hole for CCCV adjustments
voltAdjustHoleDiameter=4.5;
voltAdjustHoleOffsetX=6.5;
voltAdjustHoleOffsetY=23.2;
currentAdjustHoleDiameter=4.5;
currentAdjustHoleOffsetX=6.5;
currentAdjustHoleOffsetY=30.5;


// screw tab - how wide along the body
screwTabWidthBase=24;
screwTabWidthPoint=14;

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

// a stopper to support the hard-wires terminals
terminalReinforcementStopperWidth=7;
terminalReinforcementStopperLength=10;
terminalReinforcementStopperHeight=6;
terminalReinforcementStopperOffsetY=8;

// vent holes on the left side
ventHoleLeftOffsetTop=4;
ventHoleLeftOffsetBack=8;
ventHoleLeftRows=5;
ventHoleLeftColumns=22;
ventHoleLeftDiameter=1.4;
ventHoleLeftSpacing=0.8;

// vent holes on the right side
ventHoleRightOffsetTop=4;
ventHoleRightOffsetBack=8;
ventHoleRightRows=5;
ventHoleRightColumns=22;
ventHoleRightDiameter=1.8;
ventHoleRightSpacing=0.4;

// makes the vent grill thinner than the box thickness by carving from the inside
ventHoleGrillThickness=1.5;

// mount plate width
mountPlateWidth=boardWidth+boardSpacingX*2;
mountPlateLength=boardLength+boardSpacingY*2;

// mount-plate clips (circular lugs)
mountPlateClipsDiameter=2;
mountPlateClipLength=2;
mountPlateClipsProtrusionOffset=-0.5;
mountPlateClipsPositionOffset=2;

// screw holes on the mount plate
mountPlateScrewHoleDiameter=4.5;
mountPlateScrewHoleCountersinkDiameter=8.5;
mountPlateScrewHoleCountersinkDepth=3.5;
mountPlateScrewHole1OffsetY=15;
mountPlateScrewHole2OffsetY=-15;

// top-left pin
mountPlatePin1Length=4;
mountPlatePin1Diameter=2.2;
mountPlatePin1OffsetX=0.5;
mountPlatePin1OffsetY=0.5;

// top-right pin
mountPlatePin2Length=4;
mountPlatePin2Diameter=2.2;
mountPlatePin2OffsetX=0.5;
mountPlatePin2OffsetY=0.5;

// bottom-right pin
mountPlatePin3Length=4;
mountPlatePin3Diameter=2.2;
mountPlatePin3OffsetX=0.5;
mountPlatePin3OffsetY=0.5;

// bottom-left pin
mountPlatePin4Length=4;
mountPlatePin4Diameter=2.2;
mountPlatePin4OffsetX=0.5;
mountPlatePin4OffsetY=0.5;

// board-support under pins 1-4
mountPlatePinRiserDiameter=3;

/**
 * End of user configuration - do not adjust below this line
 */

boxOuterWidth=mountPlateWidth+(boxThickness*2);
boxOuterLength=mountPlateLength+(boxThickness*2);
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
                translate([0,0,0]){
                    cuboid([boxOuterWidth,boxOuterLength,boxOuterHeight], chamfer=chamfer, edges=EDGES_X_TOP+EDGES_Y_TOP+EDGES_Z_ALL, align=V_ZERO);
                }
                
                // hollow-out the interior from the bottom
                translate([0,0,-boxThickness]){
                    cuboid([boxOuterWidth-boxThickness*2,boxOuterLength-boxThickness*2,(boxOuterHeight-boxThickness)+mountPlateThickness-1]);
                }
                
            }
            
            // reinforcement of input screw 
            translate([
                mountPlateWidth/2-terminalReinforcementStopperLength/2-boardSpacingX-0-hardWiresPortOffsetX,
                (-boxOuterLength/2+terminalReinforcementStopperWidth/2+boxThickness+boardSpacingY+terminalReinforcementStopperOffsetY),
                boxOuterHeight/2-boxThickness-terminalReinforcementStopperHeight/2+1
            ]){
                cuboid([
                terminalReinforcementStopperLength,
                    terminalReinforcementStopperWidth,
                    terminalReinforcementStopperHeight+1
                ], align=V_CENTER, chamfer=2, edges=EDGE_BOT_BK);
            }
            
            // reinforcement of output screw 
            translate([
                -(mountPlateWidth/2-terminalReinforcementStopperLength/2)+boardSpacingX+hardWiresPortOffsetX,
                (boxOuterLength/2-terminalReinforcementStopperWidth/2-boxThickness-boardSpacingY-terminalReinforcementStopperOffsetY),
                boxOuterHeight/2-boxThickness-terminalReinforcementStopperHeight/2+1
            ]){
                cuboid([
                terminalReinforcementStopperLength,
                    terminalReinforcementStopperWidth,
                    terminalReinforcementStopperHeight+1
                ], align=V_CENTER, chamfer=2, edges=EDGE_BOT_FR);
            }
            
                // reinforcement of current pot
            translate([
                mountPlateWidth/2-boardSpacingX-3-4,
                -(mountPlateLength/2)+1+boardSpacingY+13.8,
                boxOuterHeight/2-boxThickness-terminalReinforcementStopperHeight/2+2
            ]){
                cuboid([6,2,5], align=V_CENTER, chamfer=1, edges=EDGE_BOT_BK);
            }
        
                
            // reinforcement of voltage pot
            translate([
                mountPlateWidth/2-boardSpacingX-3-4,
                -(mountPlateLength/2)+boardSpacingY+1+26,
                boxOuterHeight/2-boxThickness-terminalReinforcementStopperHeight/2+2
            ]){
                cuboid([6,2,5], align=V_CENTER, chamfer=1, edges=EDGE_BOT_FR);
            }

            // reinforce box corner near INPUT
            translate([
                -boxOuterWidth/2+boxThickness,
                -boxOuterLength/2+boxThickness,
                (0-(boxOuterHeight)/2)+(boardThickness+mountPlateThickness+gapBelowBoard)+2
            ]){
                linear_extrude(boxOuterHeight-boxThickness-mountPlateThickness-boardThickness-2) polygon(points=[[0,0], [0,5], [5,0]]);
            }

            // reinforce box corner near INPUT
            translate([
                boxOuterWidth/2-boxThickness,
                -boxOuterLength/2+boxThickness,
                (0-(boxOuterHeight)/2)+(boardThickness+mountPlateThickness+gapBelowBoard)+2
            ]){
                rotate([0,0,90]){
                    linear_extrude(boxOuterHeight-boxThickness-mountPlateThickness-boardThickness-2) polygon(points=[[0,0], [0,5], [5,0]]);
                }
            }

            // reinforce box corner near OUTPUT
            translate([
                boxOuterWidth/2-boxThickness,
                boxOuterLength/2-boxThickness,
                (0-(boxOuterHeight)/2)+(boardThickness+mountPlateThickness+gapBelowBoard)+2
            ]){
                rotate([0,0,180]){
                    linear_extrude(boxOuterHeight-boxThickness-mountPlateThickness-boardThickness-2) polygon(points=[[0,0], [0,5], [5,0]]);
                }
            }

            // reinforce box corner near OUTPUT
            translate([
                -boxOuterWidth/2+boxThickness,
                boxOuterLength/2-boxThickness,
                (0-(boxOuterHeight)/2)+(boardThickness+mountPlateThickness+gapBelowBoard)+2
            ]){
                rotate([0,0,270]){
                    linear_extrude(boxOuterHeight-boxThickness-mountPlateThickness-boardThickness-2) polygon(points=[[0,0], [0,5], [5,0]]);
                }
            }

        }
    }
}

            
            
// hole for hard wires OUT
module hard_wires_out_port(){
    translate([
        -(boxOuterWidth/2)+boxThickness+hardWiresPortOffsetX+boardSpacingX,
        (boxOuterLength/2)-boxThickness-0.5,
        -1
    ]){
        cuboid([
            hardWiresPortWidth,boxThickness+1,
            1+hardWiresPortHeight+mountPlateThickness+gapBelowBoard+boardThickness
        ],align=V_ALLPOS);
    }
}

// hole for hard wires screwdriver access
module hard_wires_out_screw_hole(){
    translate([
        (0-boxOuterWidth/2)+boxThickness+hardWiresScrewholeDiameter/2+hardWiresScrewholeOffsetX+boardSpacingX,
        (boxOuterLength/2-boxThickness)-hardWiresScrewholeDiameter-hardWiresScrewholeOffsetY-boardSpacingY,
        boxOuterHeight-boxThickness-0.5]
    ){
        hull(){
            translate([-hardWiresScrewholeDiameter/2,0,0]){
                zcyl(l=boxThickness+1,d=hardWiresScrewholeDiameter,align=V_ALLPOS);
            }
            translate([hardWiresScrewholeLength-(hardWiresScrewholeDiameter+hardWiresScrewholeDiameter/2),0,0]){
                zcyl(l=boxThickness+1,d=hardWiresScrewholeDiameter,align=V_ALLPOS);
            }
        }
    }
}

// hole for hard wires IN
module hard_wires_in_port(){
    translate([
        (boxOuterWidth/2-hardWiresPortWidth)-boxThickness-(hardWiresPortOffsetX)-boardSpacingX,
        -(boxOuterLength/2)-0.5,
        -1
    ]){
        cuboid([
            hardWiresPortWidth,boxThickness+1,
            1+hardWiresPortHeight+mountPlateThickness+gapBelowBoard+boardThickness
        ],align=V_ALLPOS);
    }
}

// hole for hard wires screwdriver access
module hard_wires_in_screw_hole(){
    translate([
        (boxOuterWidth/2-hardWiresScrewholeLength-hardWiresScrewholeOffsetX-boardSpacingX),
        -(boxOuterLength/2-boxThickness)+hardWiresScrewholeOffsetY+boardSpacingY,
        boxOuterHeight-boxThickness
    ]){
        hull(){
            translate([-hardWiresScrewholeDiameter/2,0,0]){
                zcyl(l=boxThickness+1,d=hardWiresScrewholeDiameter,align=V_ALLPOS);
            }
            translate([hardWiresScrewholeLength-(hardWiresScrewholeDiameter+hardWiresScrewholeDiameter/2),0,0]){
                zcyl(l=boxThickness+1,d=hardWiresScrewholeDiameter,align=V_ALLPOS);
            }
        }
    }
}

// left screw tab
module left_screw_tab(){
    translate([-(boxOuterWidth/2+screwTabLength/2),0,screwTabThickness/2]){
        rotate([0,0,-90]){
            difference(){
                roundedtab(screwTabWidthPoint,screwTabLength,screwTabThickness,screwTabFillet);
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
                roundedtab(screwTabWidthPoint,screwTabLength,screwTabThickness,screwTabFillet);
                translate([0,screwTabScrewholeOffset,0]){
                    zcyl(h=screwTabThickness+1,d=screwTabScrewholeDiameter);
                }
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

// mount plate
module mount_plate(){
    union(){
        translate([0,0,mountPlateThickness/2]){
            // draw the plate as a solid piece, chamfered top edges to help inserting into the cover
            cuboid([mountPlateWidth,mountPlateLength,mountPlateThickness], chamfer=0.2, edges=EDGES_X_TOP+EDGES_Y_TOP);
        }
        
        // add pin 1
        translate([
            (mountPlateWidth/2-mountPlatePin1Diameter/2-mountPlatePin1OffsetX-boardSpacingX),
            -(mountPlateLength/2-mountPlatePin1Diameter/2-mountPlatePin1OffsetY-boardSpacingY),
            mountPlateThickness+mountPlatePin1Length/2
        ]){
            zcyl(h=mountPlatePin1Length,d1=mountPlatePin1Diameter,d2=mountPlatePin1Diameter-0.5);
            translate([0,0,-(mountPlatePin1Length/2-gapBelowBoard/2)]){
                zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
            }
        }
        
        // add pin 2
        translate([
            -(mountPlateWidth/2-mountPlatePin2Diameter/2-mountPlatePin2OffsetX-boardSpacingX),
            -(mountPlateLength/2-mountPlatePin2Diameter/2-mountPlatePin2OffsetY-boardSpacingY),
            mountPlateThickness+mountPlatePin2Length/2
        ]){
            zcyl(h=mountPlatePin2Length,d1=mountPlatePin2Diameter,d2=mountPlatePin2Diameter-0.5);
            translate([0,0,-(mountPlatePin1Length/2-gapBelowBoard/2)]){
                zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
            }
        }
        
        // add pin 3
        translate([
            -(mountPlateWidth/2-mountPlatePin3Diameter/2-mountPlatePin3OffsetX-boardSpacingX),
            (mountPlateLength/2-mountPlatePin3Diameter/2-mountPlatePin3OffsetY-boardSpacingY),
            mountPlateThickness+mountPlatePin3Length/2]
        ){
            zcyl(h=mountPlatePin3Length,d1=mountPlatePin3Diameter,d2=mountPlatePin3Diameter-0.5);
            translate([0,0,-(mountPlatePin3Length/2-gapBelowBoard/2)]){
                zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
            }
        }
        
        // add pin 4
        translate([
            (mountPlateWidth/2-mountPlatePin4Diameter/2-mountPlatePin4OffsetX-boardSpacingX),
            (mountPlateLength/2-mountPlatePin4Diameter/2-mountPlatePin4OffsetY-boardSpacingY),
            mountPlateThickness+mountPlatePin3Length/2]
        ){
            zcyl(h=mountPlatePin4Length,d1=mountPlatePin4Diameter,d2=mountPlatePin4Diameter-0.5);
            translate([0,0,-(mountPlatePin4Length/2-gapBelowBoard/2)]){
                zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter);
            }
        }
        
        // support under DC In
        translate([
            0,
            (mountPlateLength/2-mountPlatePinRiserDiameter),
            mountPlateThickness+gapBelowBoard/2
        ]){
            zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter/2);
        }
        
        // support under DC Out
        translate([
            0,
            -(mountPlateLength/2-mountPlatePinRiserDiameter),
            mountPlateThickness+gapBelowBoard/2
        ]){
            zcyl(h=gapBelowBoard,d=mountPlatePinRiserDiameter/2);
        }
            
    }
}

// mount plate clips
module mount_plate_clips(isInset){

    difference(){
        union(){
            translate([
                (mountPlateWidth/2-(mountPlateClipsDiameter/2+mountPlateClipsProtrusionOffset)),
                mountPlateLength/2-mountPlateClipsPositionOffset-boxThickness-(isInset?-0.5:0),
                mountPlateThickness/2
            ]){
                rotate([90,0,0]){
                    linear_extrude(mountPlateClipLength+(isInset?1:0)) polygon(points=[[0,0],[0,3],[1,0]]);
                }
            }
            
            translate([
                -(mountPlateWidth/2-(mountPlateClipsDiameter/2+mountPlateClipsProtrusionOffset)),
                mountPlateLength/2-mountPlateClipsPositionOffset-boxThickness-(isInset?mountPlateClipLength-0.5:1),
                mountPlateThickness/2
            ]){
                rotate([270,180,0]){
                    linear_extrude(mountPlateClipLength+(isInset?1:0)) polygon(points=[[0,0],[0,3],[1,0]]);
                }
            }
            
            translate([
                (mountPlateWidth/2-(mountPlateClipsDiameter/2+mountPlateClipsProtrusionOffset)),
                (0-mountPlateLength/2)+mountPlateClipsPositionOffset+mountPlateClipLength+(isInset?0.5:0),
                mountPlateThickness/2
            ]){
                rotate([90,0,0]){
                    linear_extrude(mountPlateClipLength+(isInset?1:0)) polygon(points=[[0,0],[0,3],[1,0]]);
                }
            }
            
            translate([
                -(mountPlateWidth/2-(mountPlateClipsDiameter/2+mountPlateClipsProtrusionOffset)),
                -(mountPlateLength/2-mountPlateClipsPositionOffset)-(isInset?0.5:0),
                mountPlateThickness/2
            ]){
                rotate([270,180,0]){
                    linear_extrude(mountPlateClipLength+(isInset?1:0)) polygon(points=[[0,0],[0,3],[1,0]]);
                }
            }
        }
        translate([0,0,mountPlateThickness+1.5]) {
            cuboid([mountPlateWidth, mountPlateLength, 3]);
        }
    }
}

// mount plate screw holes
module mount_plate_screw_holes(){
    translate([
        0,
        mountPlateScrewHole1OffsetY,
        mountPlateThickness/2
    ]){
        zcyl(l=mountPlateThickness+(drillMountPlateScrewHoles?1:-2),d=mountPlateScrewHoleDiameter);
        translate([0,0,mountPlateThickness/2-mountPlateScrewHoleCountersinkDepth/2+0.001]){
            zcyl(l=mountPlateScrewHoleCountersinkDepth,d1=mountPlateScrewHoleDiameter,d2=mountPlateScrewHoleCountersinkDiameter);
        }
    }
    translate([
        0,
        mountPlateScrewHole2OffsetY,
        mountPlateThickness/2
    ]){
        zcyl(l=mountPlateThickness+(drillMountPlateScrewHoles?1:-2),d=mountPlateScrewHoleDiameter);
        translate([0,0,mountPlateThickness/2-mountPlateScrewHoleCountersinkDepth/2+0.001]){
            zcyl(l=mountPlateScrewHoleCountersinkDepth,d1=mountPlateScrewHoleDiameter,d2=mountPlateScrewHoleCountersinkDiameter);
        }
    }
    
}

// screwdriver access for voltage adjustments
module volt_adjust_hole(){
    translate([
        boxOuterWidth/2-voltAdjustHoleDiameter/2-boxThickness-voltAdjustHoleOffsetX-boardSpacingX,
        boxOuterLength/2-voltAdjustHoleDiameter/2-boxThickness-voltAdjustHoleOffsetY-boardSpacingY,
        boxOuterHeight-0.5
    ]){
        zcyl(l=boxThickness+1,d=voltAdjustHoleDiameter);
    }
}

// screwdriver access for current adjustments
module current_adjust_hole(){
    translate([
        boxOuterWidth/2-currentAdjustHoleDiameter/2-boxThickness-currentAdjustHoleOffsetX-boardSpacingX,
        boxOuterLength/2-currentAdjustHoleDiameter/2-boxThickness-currentAdjustHoleOffsetY-boardSpacingY,
        boxOuterHeight-0.5
    ]){
        zcyl(l=boxThickness+1,d=currentAdjustHoleDiameter);
    }
}

// create a set of ventilation holes
module vent_holes(ventHoleRows, ventHoleColumns, ventHoleDiameter, ventHoleSpacing){
    for(y = [0:1:ventHoleRows-1]){
        for (x=[0:1:ventHoleColumns-1]) {
            if(y%2==0){
                // even row
                translate([(ventHoleDiameter+ventHoleSpacing)/2,0,0]){
                    translate([ventHoleDiameter*x+ventHoleSpacing*x, ventHoleDiameter*y+ventHoleSpacing/2*y, 0]){
                        zcyl(l=boxThickness+1,d=ventHoleDiameter);
                    }
                }
            }else{
                // odd row
                translate([ventHoleDiameter*x+ventHoleSpacing*x, ventHoleDiameter*y+(ventHoleSpacing/2)*y, 0]){
                    zcyl(l=boxThickness+1,d=ventHoleDiameter);
                }
            }
        }
    }
}

// create the text for etching the labels
module etch_label(){
    
    if(!hideHardWiresAccess){
        // we do not print labels for hard wires if hard wires port is hidden

        // output neg
        translate([
                boxOuterWidth/2-5-boxThickness-boardSpacingX,
                boxOuterLength/2+0.01,
                mountPlateThickness+boardThickness+hardWiresPortHeight+2
            ]){
                rotate([90,0,0]){
                    linear_extrude(0.5){
                        text("-", size=5);
                }
            }
        }
        
        // output pos
        translate([
                boxOuterWidth/2-hardWiresPortWidth-5-boxThickness-boardSpacingX,
                boxOuterLength/2+0.01,
                mountPlateThickness+boardThickness+hardWiresPortHeight+2
            ]){
                rotate([90,0,0]){
                    linear_extrude(0.5){
                        text("+", size=5);
                }
            }   
        }
        
        // input neg
        translate([
                boxOuterWidth/2-boxThickness-2-hardWiresPortOffsetX-boardSpacingX,
                -boxOuterLength/2+0.49,
                mountPlateThickness+boardThickness+hardWiresPortHeight+2
            ]){
                rotate([90,0,0]){
                    linear_extrude(0.5){
                        text("-", size=5);
                }
            }
        }
        
        // input pos
        translate([
                boxOuterWidth/2-boxThickness-hardWiresPortOffsetX-hardWiresPortWidth-boardSpacingX-2,
                -boxOuterLength/2+0.49,
                mountPlateThickness+boardThickness+hardWiresPortHeight+2
            ]){
                rotate([90,0,0]){
                    linear_extrude(0.5){
                        text("+", size=5);
                }
            }   
        }

    }
    
    rotate([0,0,180]){
       
        if(!hideAdjustmentAccess){

            translate([
                -(boxOuterWidth/2-boxThickness-currentAdjustHoleOffsetX-currentAdjustHoleDiameter-boardSpacingX-1),
                -(boxOuterLength/2-currentAdjustHoleOffsetY-currentAdjustHoleDiameter-boardSpacingY),
                boxOuterHeight
            ]){
                linear_extrude(0.5){
                    text("current limit", size=1.7);
                }
            }
            
            translate([
                -(boxOuterWidth/2-boxThickness-voltAdjustHoleOffsetX-voltAdjustHoleDiameter-boardSpacingX-1),
                -(boxOuterLength/2-voltAdjustHoleOffsetY-voltAdjustHoleDiameter-boardSpacingY),
                boxOuterHeight
            ]){
                linear_extrude(0.5){
                    text("voltage", size=1.7);
                }
            }

        }
        
        translate([
            -(boxOuterWidth/2-boardSpacingX-5),
            (boxOuterLength/2-boxThickness-boardSpacingY-5),
            boxOuterHeight
        ]){
            linear_extrude(0.5){
                text("IN", size=3);
            }
        }
        
        translate([
            -boxOuterWidth/2+boardSpacingX+7,
            (boxOuterLength/2-boxThickness-boardSpacingY-9),
            boxOuterHeight
        ]){
            linear_extrude(0.5){
                text("4v - 38v", size=3);
            }
        }
        
        translate([
            (boxOuterWidth/2-boardSpacingX-12),
            -(boxOuterLength/2-boxThickness-boardSpacingY-2),
            boxOuterHeight
        ]){
            linear_extrude(0.5){
                text("OUT", size=3);
            }
        }
        translate([
            -(boxOuterWidth/2)+boardSpacingX+6,
            -(boxOuterLength/2-boxThickness-boardSpacingY-7),
            boxOuterHeight
        ]){
            linear_extrude(0.5){
                text("1.2v - 36v", size=3);
            }
        }
        
        translate([
            -(boxOuterWidth/2)+boardSpacingX+3.5,
            -(boxOuterLength/2-boxThickness-boardSpacingY-17),
            boxOuterHeight
        ]){
            linear_extrude(0.5){
                text("5A Max", size=5);
            }
        }
        
        translate([
            -(boxOuterWidth/2)+boardSpacingX+3,
            -(boxOuterLength/2-boardSpacingY-boxThickness-13),
            boxOuterHeight
        ]){
            linear_extrude(0.5){
                text("CCCV DC Buck", size=2.5);
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
                
                mount_plate_clips(true);

                if(!hideHardWiresAccess){
                    hard_wires_in_port();
                    hard_wires_in_screw_hole();
                    hard_wires_out_port();
                    hard_wires_out_screw_hole();
                }

                if(!hideAdjustmentAccess){
                    volt_adjust_hole();
                    current_adjust_hole();
                }
                
                translate([0,0,-0.3]){
                    etch_label();
                }
                
                // vent holes at left
                translate([
                    boxOuterWidth/2-boxThickness/2,
                    -(boxOuterLength/2-ventHoleLeftOffsetTop),
                    0+ventHoleLeftOffsetBack
                ]){
                    rotate([90,0,90]){
                        vent_holes(ventHoleLeftRows, ventHoleLeftColumns, ventHoleLeftDiameter, ventHoleLeftSpacing);
                    }
                }
                
                // vent hole left grill thickness
                translate([
                    (boxOuterWidth/2-boxThickness/2)-ventHoleGrillThickness,
                    0,
                    ((ventHoleLeftDiameter+ventHoleLeftSpacing)*ventHoleLeftRows-(ventHoleLeftSpacing*2))/2+ventHoleLeftOffsetBack-ventHoleLeftDiameter/2
                ]){
                    cuboid([
                        boxThickness,
                        (ventHoleLeftDiameter+ventHoleLeftSpacing)*ventHoleLeftColumns-(ventHoleLeftSpacing*2),
                        (ventHoleLeftDiameter+ventHoleLeftSpacing)*ventHoleLeftRows-(ventHoleLeftSpacing*2)
                    ], chamfer=1);
                }
            
                // vent holes at right
                translate([
                    -boxOuterWidth/2+boxThickness/2-0.001,
                    -(boxOuterLength/2)+ventHoleRightOffsetTop,
                    0+ventHoleRightOffsetBack
                ]){
                    rotate([90,0,90]){
                        vent_holes(ventHoleRightRows, ventHoleRightColumns, ventHoleRightDiameter, ventHoleRightSpacing);
                    }
                }
                
                // vent hole right grill thickness
                translate([
                    (-boxOuterWidth/2+boxThickness/2)+ventHoleGrillThickness,
                    0,
                    ((ventHoleRightDiameter+ventHoleRightSpacing)*ventHoleRightRows-(ventHoleRightSpacing*2))/2+ventHoleRightOffsetBack-ventHoleRightDiameter/2
                ]){
                    cuboid([
                        boxThickness,
                        (ventHoleRightDiameter+ventHoleRightSpacing)*ventHoleRightColumns-(ventHoleRightSpacing*2),
                        (ventHoleRightDiameter+ventHoleRightSpacing)*ventHoleRightRows-(ventHoleRightSpacing*2)
                    ], chamfer=1);
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
        translate([0,0,mountPlateThickness+gapBelowBoard+boardThickness/2]){
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
            mount_plate_clips(false);
        }

        // drill screw holes into the mount plate
        mount_plate_screw_holes();

    }
    
}

