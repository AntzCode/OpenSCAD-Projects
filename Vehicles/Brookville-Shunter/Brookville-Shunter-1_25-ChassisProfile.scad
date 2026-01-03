
// Draws a Chassis Profile for the 1:25 model

chassisBodyOffsetFront_125 = 20;
chassisLength_125 = 76.5;
chassisWidth_125 = 24;
chassisHeight_125 = 18;
motorLength_125 = 21;
motorWidth_125 = 24;
motorHeight_125 = 32;

screwPostWidth_125 = 5;
screwPostHeight_125 = 20;
screwPostOffsetBack_125 = 6;

batteryDiameter_125 = 18.5;
batteryLength_125 = 65;
batteryTerminalDividerThickness_125 = 3;
batteryTerminalThickness_125 = 4;

function batteryCavityInsetSides_125() = (chassisWidth_125 - batteryDiameter_125) / 2;

module drawChassisProfile_125() {   
    translate([
        (-(cabWidth - chassisWidth) / 2) + (cabWidth - chassisWidth_125) / 2, 
        cabLength + noseLength - chassisLength_125 - chassisBodyOffsetFront_125,
        chassisHeight
    ]) {
        union() {
            // chassis cavity
            cube([chassisWidth_125, chassisLength_125, chassisHeight_125]);

            // slope top left
            translate([batteryCavityInsetSides_125(), chassisLength_125, chassisHeight_125]){
                rotate([90, 270, 0]){
                    linear_extrude(height=chassisLength_125){
                    polygon(points=[[0,0], [0,batteryCavityInsetSides_125()], [batteryCavityInsetSides_125(),0]]);
                }
                }
            }

            // slope top right
            translate([chassisWidth_125 - batteryCavityInsetSides_125(), chassisLength_125, chassisHeight_125]){
                rotate([90, 0, 0]){
                    linear_extrude(height=chassisLength_125){
                        polygon(points=[[0,0], [0,batteryCavityInsetSides_125()], [batteryCavityInsetSides_125(),0]]);
                    }
                }
            }
            translate([batteryCavityInsetSides_125(), motorLength_125 + batteryTerminalDividerThickness_125, chassisHeight_125]){
                rotate([90, 0, 0]){
                    linear_extrude(height=batteryTerminalDividerThickness_125){
                        polygon(points=[
                            [0,0], 
                            [0,batteryCavityInsetSides_125()], 
                            [batteryDiameter_125/2, batteryDiameter_125/2], 
                            [batteryDiameter_125, batteryCavityInsetSides_125()], 
                            [batteryDiameter_125, 0]
                        ]);
                    }
                }
                //cube([chassisWidth_125 - batteryCavityInsetSides_125() * 2, batteryTerminalDividerThickness_125, batteryCavityInsetSides_125()]);
            }

            // motor cavity
            cube([motorWidth_125, motorLength_125, motorHeight_125]);

            // arch top
            translate([motorWidth_125/2, motorLength_125, motorHeight_125]){
                rotate([90, 90, 0]){
                    cylinder(d=motorWidth_125, h=motorLength_125);
                }
            }

            // left screw hole cavity
            translate([
                -screwPostWidth_125,
                screwPostOffsetBack_125,
                0
            ]) {
                difference(){
                    cube([screwPostWidth_125, screwPostWidth_125, screwPostHeight_125 + screwPostWidth_125]);
                    // slope top
                    translate([0, 0, screwPostHeight_125 + screwPostWidth_125]){
                        rotate([270, 0, 0]){
                            linear_extrude(height=screwPostWidth_125){
                                polygon(points=[[0,0], [0,screwPostWidth_125], [screwPostWidth_125,0]]);
                            }
                        }
                    }
                }
            }

            // right screw hole cavity
            translate([
                chassisWidth_125,
                screwPostOffsetBack_125,
                0
            ]) {
                difference(){
                    cube([screwPostWidth_125, screwPostWidth_125, screwPostHeight_125 + screwPostWidth_125]);
                    // slope top
                    translate([screwPostWidth_125, screwPostWidth_125, screwPostHeight_125 + screwPostWidth_125]){
                        rotate([90, 180, 0]){
                            linear_extrude(height=screwPostWidth_125){
                                polygon(points=[[0,0], [0,screwPostWidth_125], [screwPostWidth_125,0]]);
                            }
                        }
                    }
                    
                }
            }

            // battery cavity
            translate([chassisWidth_125/2, (batteryLength_125 + motorLength_125 + batteryTerminalThickness_125 + batteryTerminalDividerThickness_125), (chassisHeight_125 + batteryDiameter_125/2)]) {
                rotate([90, 90, 0]){
                    union(){
                        // arch top
                        cylinder(d=batteryDiameter_125, h=batteryLength_125 + batteryTerminalThickness_125);
                        translate([0, -(batteryDiameter_125 / 2), 0]){
                            cube([batteryDiameter_125 / 2 + chassisHeight_125, batteryDiameter_125, batteryLength_125 + batteryTerminalThickness_125]);
                        }
                    }
                }
            }
        }
    }
}

