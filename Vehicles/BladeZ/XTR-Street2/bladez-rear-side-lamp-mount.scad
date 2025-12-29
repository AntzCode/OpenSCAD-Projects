// Bracket for mounting rear-facing LED lights to an e-scooter
// Make: Blade-Z 
// Model:  XTR Street II
// Author: Anthony Gallon
// Date: 29 December 2025
// Link: https://github.com/AntzCode/OpenSCAD-Projects

// Creates a rectangular mount that offsets the light from the chassis and straightens the alignment
// The mount reuses existing holes for bolting the wheel guard to the chassis and requires an additional hole to secure the bottom

// whether to show/hide the individual components
//  - printing separately requires glue and assembly but reduces need for printed supports
show_mount_plate = 1;
show_shaft_support = 1;
show_lamp = 1;
show_shaft_joiner = 0;

// whether to print the bracket for the left-hand or right-hand side of the scooter
// left_or_right = "left";
left_or_right = "right";

// mount dimensions
width = 106;  // overall width of the mount
height = 60; // overall height of the mount
thickness = 35; // overall thickness, including the stem support
mount_plate_thickness = 15; // the actual thickness of the mount plate, at the widest part
shaft_support_thickness = 5; // the thickness of the support shaft, at the thinnest end
shaft_support_bottom_thickness = 10; // the thickness of the support shaft where it joins onto the mount plate
shaft_joiner_length = 14; // the length of the ring insert that is used to join the mount plate and support shaft
shaft_joiner_looseness = 0.8; // how snug the fit should be for the joiner

// Hole diameter for bolts (original uses M6 dia x 1mm pitch)
hole_diameter = 6;

// Positions for the two mounting holes (centered)
hole_spacing = 87; // distance between holes

// Function to calculate hole edge offset, for uniform appearance all-round
function hole_edge_offset() = (width - hole_spacing)/2;

// Nut hole diameter
nut_hole_diameter = 24; // diameter of the threaded shaft from the LED light, which grasps onto the mount

// Nut hole depth
function nut_hole_depth() = (height - mount_plate_thickness); // how deep should the hole be for the threaded shaft

// Diameter of the cable, which is used for creating a cavity for the cable to exit the mount
cable_cavity_diameter = 6;

// how much angle is on the front wedge
front_wedge_thickness = 2;
front_wedge_length = 15;

// how much angle is on the rear wedge
rear_wedge_thickness = 5;
rear_wedge_length = width - front_wedge_length;

// the wheelguard slips behind the mount, so we add a groove to compensate
wheelguard_offset_thickness = 3;
wheelguard_offset_depth = 24;

// how deep does the led shaft stick into the shaft support?
shaft_mount_inset = 14;

// we add some bevel to the corners, gives it a smoother appearance
shaft_mount_bevel = 2;

// the corners of the mount are rounded to improve the look-n-feel
mount_corner_bevel = 10;

///////////////////////////////////////////////
// lamp dimensions (for modeling/preview)
///////////////////////////////////////////////

shaft_bolt_outer_diameter = 8;
shaft_bolt_length = 22;

shaft_cylinder_outer_diameter = 15.5;
shaft_cylinder_length = 25;

shaft_joiner_thickness = 3;

// the cone is the curved body of the light housing
cone_outer_diameter = 36;
cone_length = 47;

// the donut is the ring of lights around the outside of the lens
donut_thickness = 8;
donut_outer_diameter = 36;

// the sphere is the shape of the lens inside the donut
sphere_diameter = 22;

shaft_cone_overlap = 3;

//
// Draw the lamp (used for preview)
//
module lamp() {

    // Shaft cylinder
    color("black") translate([cone_outer_diameter/2 - shaft_cone_overlap, 0, shaft_cylinder_outer_diameter/2]) rotate([0,90,0]) cylinder(d=shaft_cylinder_outer_diameter, h=shaft_cylinder_length, $fn=20);

    // Shaft bolt
    color("silver") translate([cone_outer_diameter/2 - shaft_cone_overlap + shaft_cylinder_length, 0, shaft_cylinder_outer_diameter/2]) 
    rotate([0,90,0]) 
    cylinder(d=shaft_bolt_outer_diameter, h=shaft_bolt_length, $fn=20);

    // Cone with logarithmic curve
    r0 = cone_outer_diameter/2;
    h = cone_length;
    steps = 50;
    k = 3;
    c = exp(k) - 1;
    max_ln = ln(1 + c);
    points = concat([[0, 0]], [for (i = [0:steps]) let(z = i * h / steps, r = r0 * ln(1 + c * (1 - z / h)) / max_ln) [r, z]], [[0, h]]);
    color("black") rotate_extrude($fn=50) polygon(points);

    // Donut
    color("orange") translate([0, 0, -donut_thickness/2]) {
        rotate_extrude($fn=50) {
            translate([(donut_outer_diameter - donut_thickness)/2, 0, 0]) {
                circle(d=donut_thickness, $fn=20);
            }
        }
    }

    // Sphere
    color("red") sphere(d=sphere_diameter, $fn=30);

}

//
// Draw the joiner sleeve that is used for gluing the shaft support to the mount plate (if printing parts separately)
// 
module shaft_joiner() {
    difference() {
        cylinder(d=nut_hole_diameter - shaft_joiner_looseness, h=shaft_joiner_length, $fn=100);
        cylinder(d=nut_hole_diameter - shaft_joiner_thickness, h=shaft_joiner_length, $fn=100);
    }
}

//
// Draw the mount plate and support shaft
//
module lamp_mount() {

    difference() {

        // Main body
        union() {

            // use minkowski to round the sharp corners after carving the curves
            scale([1, 1, 0.999]) minkowski() {

                difference() {
                    // Create main rectangular body from a solid cube
                    translate([mount_corner_bevel/2, mount_corner_bevel/2, 0]) cube([width - mount_corner_bevel, height - mount_corner_bevel, thickness]);

                    // carve-out the upper portion where the shaft mount will protrude
                    cube([width, height, thickness - mount_plate_thickness]);

                    // carve-out the front bottom corner
                    translate([0, height, 0]) {
                        cylinder(r=height - hole_edge_offset() * 2 + mount_corner_bevel/2, h=thickness, center=false, $fn=20);
                    }

                    // carve-out the rear bottom corner
                    translate([width, height, 0]) {
                        cylinder(r=height - hole_edge_offset() * 2 + mount_corner_bevel/2, h=thickness, center=false, $fn=20);
                    }

                }

                // define the roundness of the corners
                cylinder(d=mount_corner_bevel, h=0.001);

            }
            
            // draw the support for the light mount
            difference() {
                // use minkowski to add a bevel to the cylinder
                minkowski() {
                    translate([width/2, height/2, shaft_mount_bevel]) {
                        cylinder(d1=shaft_cylinder_outer_diameter + shaft_support_thickness * 2, d2=shaft_cylinder_outer_diameter + shaft_support_bottom_thickness * 2, h=thickness - mount_plate_thickness - shaft_mount_bevel * 2, center=false, $fn=50);
                    }
                    sphere(shaft_mount_bevel);
                }

                // Carve-out enough space for the lower bolt head
                translate([width/2 - (shaft_cylinder_outer_diameter + shaft_support_bottom_thickness * 2)/2, height - hole_edge_offset() - hole_diameter, 0]) cube([shaft_cylinder_outer_diameter + shaft_support_bottom_thickness * 2, hole_edge_offset() + hole_diameter, thickness - mount_plate_thickness]);
            }

        }

        // Draw a mount plate that is shaped for fitment on the left-hand side
        if (left_or_right == "left") {

            // Wedge to subtract from the front edge
            translate([0, 0, thickness]) {
                rotate([0, 90, 0]) {
                    polyhedron(
                        points = [
                            [0, 0, 0],                           // 0
                            [front_wedge_thickness, 0, 0],           // 1
                            [0, 0, front_wedge_length],         // 2
                            [0, height, 0],                        // 3
                            [front_wedge_thickness, height, 0],       // 4
                            [0, height, front_wedge_length]     // 5
                        ],
                        faces = [
                            [0, 1, 2],     // bottom triangle
                            [3, 4, 5],     // top triangle
                            [0, 3, 4, 1],  // front rectangle
                            [1, 4, 5, 2],  // right rectangle
                            [0, 3, 5, 2]   // back rectangle
                        ]
                    );
                }
            }

            // Wedge to subtract a groove from the front edge where the wheel guard will go
            translate([0, 0, thickness]) {
                rotate([270, 0, 0]) {
                    linear_extrude(height=wheelguard_offset_depth, scale=[1,1])
                    polygon(points = [
                        [0, 0],
                        [0, front_wedge_thickness + wheelguard_offset_thickness],
                        [front_wedge_length, wheelguard_offset_thickness],
                        [front_wedge_length, 0]
                    ]);
                }
            }

            // Wedge to subtract from the rear edge
            translate([width, height, thickness]) {
                rotate([0, 90, 180]) {
                    polyhedron(
                        points = [
                            [0, 0, 0],                           // 0
                            [rear_wedge_thickness, 0, 0],           // 1
                            [0, 0, rear_wedge_length],         // 2
                            [0, height, 0],                        // 3
                            [rear_wedge_thickness, height, 0],       // 4
                            [0, height, rear_wedge_length]     // 5
                        ],
                        faces = [
                            [0, 1, 2],     // bottom triangle
                            [3, 4, 5],     // top triangle
                            [0, 3, 4, 1],  // front rectangle
                            [1, 4, 5, 2],  // right rectangle
                            [0, 3, 5, 2]   // back rectangle
                        ]
                    );
                }
            }

            // Wedge to subtract a groove from the rear edge where the wheel guard will go
            translate([width, wheelguard_offset_depth, thickness]) {
                rotate([-90, 0, 180]) {
                    linear_extrude(height=wheelguard_offset_depth, scale=[1,1])
                    polygon(points = [
                        [0, 0],
                        [0, rear_wedge_thickness + wheelguard_offset_thickness],
                        [rear_wedge_length, wheelguard_offset_thickness],
                        [rear_wedge_length, 0]
                    ]);
                }
            }

        } // end if left_or_right == "left"


        // Draw a mount plate that is shaped for fitment on the right-hand side
        if (left_or_right == "right") {

            // Wedge to subtract from the front edge
            translate([width, height, thickness]) {
                rotate([180, 90, 0]) {
                    polyhedron(
                        points = [
                            [0, 0, 0],                           // 0
                            [front_wedge_thickness, 0, 0],           // 1
                            [0, 0, front_wedge_length],         // 2
                            [0, height, 0],                        // 3
                            [front_wedge_thickness, height, 0],       // 4
                            [0, height, front_wedge_length]     // 5
                        ],
                        faces = [
                            [0, 1, 2],     // bottom triangle
                            [3, 4, 5],     // top triangle
                            [0, 3, 4, 1],  // front rectangle
                            [1, 4, 5, 2],  // right rectangle
                            [0, 3, 5, 2]   // back rectangle
                        ]
                    );
                }
            }

            // Wedge to subtract a groove from the front edge where the wheel guard will go
            translate([width, wheelguard_offset_depth, thickness]) {
                rotate([90, 180, 0]) {
                    linear_extrude(height=wheelguard_offset_depth, scale=[1,1])
                    polygon(points = [
                        [0, 0],
                        [0, front_wedge_thickness + wheelguard_offset_thickness],
                        [front_wedge_length, wheelguard_offset_thickness],
                        [front_wedge_length, 0]
                    ]);
                }
            }

            // Wedge to subtract from the rear edge
            translate([0, 0, thickness]) {
                rotate([0, 90, 0]) {
                    polyhedron(
                        points = [
                            [0, 0, 0],                           // 0
                            [rear_wedge_thickness, 0, 0],           // 1
                            [0, 0, rear_wedge_length],         // 2
                            [0, height, 0],                        // 3
                            [rear_wedge_thickness, height, 0],       // 4
                            [0, height, rear_wedge_length]     // 5
                        ],
                        faces = [
                            [0, 1, 2],     // bottom triangle
                            [3, 4, 5],     // top triangle
                            [0, 3, 4, 1],  // front rectangle
                            [1, 4, 5, 2],  // right rectangle
                            [0, 3, 5, 2]   // back rectangle
                        ]
                    );
                }
            }

            // Wedge to subtract a groove from the rear edge where the wheel guard will go
            translate([0, 0, thickness]) {
                rotate([-90, 0, 0]) {
                    linear_extrude(height=wheelguard_offset_depth, scale=[1,1])
                    polygon(points = [
                        [0, 0],
                        [0, rear_wedge_thickness + wheelguard_offset_thickness],
                        [rear_wedge_length, wheelguard_offset_thickness],
                        [rear_wedge_length, 0]
                    ]);
                }
            }

        } // end if left_or_right == "right"

        // Screw-hole top-front
        translate([hole_edge_offset(), hole_edge_offset(), -1]) {
            cylinder(d=hole_diameter, h=thickness+2, $fn=20);
        }

        // Screw-hole top-rear
        translate([width - hole_edge_offset(), hole_edge_offset(), -1]) {
            cylinder(d=hole_diameter, h=thickness+2, $fn=20);
        }

        // Screw-hole bottom center
        translate([width/2, height/2 + shaft_cylinder_outer_diameter/2 + shaft_support_thickness + hole_edge_offset(), -1]) {
            cylinder(d=hole_diameter, h=thickness+2, $fn=20);
        }

        // Hole for the shaft
        translate([width/2, height/2, shaft_mount_inset/2]) {
            cylinder(d=shaft_cylinder_outer_diameter, h=shaft_mount_inset, center=true, $fn=100);
        }

        // Hole for the shaft bolt
        translate([width/2, height/2, thickness/2]) {
            cylinder(d=shaft_bolt_outer_diameter, h=thickness, center=true, $fn=100);
        }

        // Hole for the shaft bolt nut
        translate([width/2, height/2, thickness - 2]) {
            cylinder(d=nut_hole_diameter, h=nut_hole_depth(), center=true, $fn=100);
        }

        // cable cavity - the cable comes out the top of the mount
        translate([width/2 - cable_cavity_diameter/2, 0, thickness - cable_cavity_diameter/2 - rear_wedge_thickness/2 - wheelguard_offset_thickness]) cube([cable_cavity_diameter, height/2, cable_cavity_diameter]);

    }
}


///////////////////////////////////////////////
// Draw the parts according to configuration
///////////////////////////////////////////////

if (show_shaft_support < 1 && show_mount_plate > 0) {
    // only print the mount plate but not the shaft support
    difference() {
        lamp_mount();
        cube([width, height, thickness - mount_plate_thickness]);
    }
}

if (show_shaft_support > 0 && show_mount_plate < 1) {
    // only print the shaft support but not the mount plate
    difference() {
        lamp_mount();
        translate([0, 0, thickness - mount_plate_thickness - 0.1]) cube([width, height, thickness - (thickness - mount_plate_thickness)]);
    }
}

if (show_shaft_support > 0 && show_mount_plate > 0) {
    // print both the shaft support and the mount plate
    lamp_mount();
}

if (show_shaft_joiner > 0) {
    // print the joiner
    if (show_mount_plate > 0) {
        // move it so it doesn't collide with the mount base
        translate([-shaft_cylinder_outer_diameter/2 - shaft_joiner_thickness, -shaft_cylinder_outer_diameter/2 - shaft_joiner_thickness, 0]) shaft_joiner();
    } else {
        shaft_joiner();
    }
}

if (show_lamp > 0) {
    // draw the lamp for proportions
    translate([shaft_cylinder_outer_diameter/2 + width/2, height/2, -cone_outer_diameter/2 - shaft_cylinder_length + shaft_cone_overlap + shaft_mount_inset]) rotate([0, -90, 0]) lamp();
}

