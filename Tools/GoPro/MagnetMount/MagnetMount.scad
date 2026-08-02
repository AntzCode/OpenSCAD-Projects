// A magnetic Gopro mount.
// Draws a case for holding a donut style magnet, with clips on top for clamping the gopro position.
// Designed for a microwave oven magnet.
// @licnese GPL-3.0
// @author Anthony Gallon
// @url https://www.github.com/AntzCode/OpenSCAD-Projects

// which part to show? (for rendering and exporting)
show_magnet = false;
show_lid = false;
show_case = true;
show_nut_holder = false;
show_square_shaft_holder = true;

// the protrusions that hold the lid in place
mount_lid_clip_dia = 1.4;

// size of the magnet
magnet_outer_dia = 56.5;
magnet_inner_dia = 20.5;
magnet_thickness = 12.5;

// thickness of the case
case_thickness = 2;

// thickness of the case underneath the magnet
case_floor_thickness = 0.6; 

// diameter of the holes in the bottom
case_bottom_hole_dia = 8;

// tolerances

// space around the magnet
magnet_tolerance = 0.8;

// space to add between case components
case_tolerance = 0.4;

// mount sizes
mount_thickness = 3;
mount_spacing = 3.5;

// diameter of the roundness at the top of the mount
mount_outer_dia = 14;

// diameter of the hole for the mount bolt
mount_hole_dia = 5;

// how far above the top of the case is the mount bolt?
mount_hole_offset = 20;

// size of the hex hold for holding the nut (add tolerance for fitting)
nut_holder_size = 8.6;

// how thick is the tab holding the nut
nut_holder_thickness = 4;

square_shaft_thickness = 19;
square_shaft_width = 25;
square_shaft_length = 100;




// colors (for render & preview)
magnet_color = "#666666";
case_color = "#ff8800";
nut_holder_color = "#ff5e00";

// how smooth is the render
$fn = 80;

//
// end of user-config
//




// computed values
overall_dia = magnet_outer_dia + magnet_tolerance + case_thickness * 2;
overall_height = magnet_thickness + magnet_tolerance + case_thickness + case_floor_thickness + mount_lid_clip_dia;
overall_mount_width = mount_thickness * 3 + mount_spacing * 2;


// mount tab module
module mount_tab() {
    color(case_color)
    render()
    difference() {
        hull(){
            // draw the tab body
            translate([0, 0, overall_height])
            cube([mount_outer_dia, mount_thickness, mount_hole_offset - mount_outer_dia/2], center=false);

            // draw the tab roundness
            translate([mount_outer_dia/2, 0, overall_height + mount_hole_offset])
            rotate([0, 90, 90])
            cylinder(h=mount_thickness, d=mount_outer_dia);
        }

        // draw the mount bolt hole
        translate([mount_outer_dia/2, 0, overall_height + mount_hole_offset])
        rotate([0, 90, 90])
        cylinder(h=mount_thickness, d=mount_hole_dia);
    }
}


if(show_case) {

    // draw outer shell

    color(case_color)
    render()
    difference() {

        union() {
            // draw the overall shell
            cylinder(h=overall_height, d=overall_dia, center=false);
            
            if(show_square_shaft_holder) {
                translate([magnet_outer_dia / 2 + case_tolerance, -square_shaft_length/2, 0])
                difference () {
                    cube([square_shaft_width + case_thickness * 2 + case_tolerance * 2, square_shaft_length, square_shaft_thickness + case_thickness + case_tolerance], center=false);
                    
                    translate([case_thickness, 0, 0])
                    cube([square_shaft_width + case_tolerance * 2, square_shaft_length, square_shaft_thickness + case_tolerance]);
                }
            }
            
        }
    
        // carve-out inner shell
        translate([0, 0, case_floor_thickness])
        cylinder(h=overall_height - case_floor_thickness, d=overall_dia - case_thickness * 2, center = false);


        // drill two holes in the bottom for pushing the magnet out
        translate([0, overall_dia/2 / 2, 0])
        cylinder(h=case_floor_thickness, d=case_bottom_hole_dia, center=false);

        // drill two holes in the bottom for pushing the magnet out
        translate([0, -overall_dia/2 / 2, 0])
        cylinder(h=case_floor_thickness, d=case_bottom_hole_dia, center=false);

    }

    // draw the lid clips
    color(case_color)
    translate([0, overall_dia/2 - case_thickness - case_tolerance / 2, overall_height - mount_lid_clip_dia / 2])
    sphere(d=mount_lid_clip_dia);

    color(case_color)
    translate([0, -overall_dia/2 + case_thickness + case_tolerance / 2, overall_height - mount_lid_clip_dia / 2])
    sphere(d=mount_lid_clip_dia);


    // draw the pedestal
    color(case_color)
    cylinder(h=overall_height, d=magnet_inner_dia - magnet_tolerance);


    // draw the mount tabs
    color(case_color)
    render()
    difference(){
        union(){
            translate([-mount_outer_dia / 2, -overall_mount_width/2, 0])
            mount_tab();
            translate([-mount_outer_dia / 2, - mount_thickness/2, 0])
            mount_tab();
            translate([-mount_outer_dia / 2, overall_mount_width/2 - mount_thickness, 0])
            mount_tab();
        }

        // round-off the edges of the mount tabs if they protrude outside the donut (this is so the lid can slide on)
        translate([0, 0, overall_height])
        difference(){
            cylinder(h=mount_hole_offset + mount_outer_dia/2, d=overall_dia);
            cylinder(h=mount_hole_offset + mount_outer_dia/2, d=magnet_inner_dia - magnet_tolerance);
        }
    }
}


if(show_lid) {

    // draw the lid
    
    color(case_color)
    translate([0, 0, overall_height - case_thickness - mount_lid_clip_dia])
    render()
    difference() {
        cylinder(h=case_thickness, d=overall_dia - case_thickness * 2 - case_tolerance * 2, center=false);
        cylinder(h=case_thickness, d=magnet_inner_dia + magnet_tolerance, center=false);
    }
}

if(show_nut_holder) {

    // draw the nut holder
    
    color(nut_holder_color)
    render()
    union(){

        // draw the tab with rounded-top
        translate([0, overall_mount_width/2, overall_height + mount_hole_offset])
        rotate([0, 90, 90])
        difference(){
            hull(){
                cylinder(h=nut_holder_thickness, d=mount_outer_dia);
                translate([0, -mount_outer_dia/2 - case_tolerance, 0])
                rotate([90, 0, 90])
                cube([mount_outer_dia + case_tolerance * 2, nut_holder_thickness, mount_hole_offset - case_tolerance], center=false);
            }

            // carve-out the hex socket for the nut
            cylinder(h=nut_holder_thickness, d=nut_holder_size, $fn=6);
        }

        // add the left leg        
        translate([mount_outer_dia/2 + case_tolerance, -overall_mount_width/2, overall_height + case_tolerance])
        cube([case_thickness, overall_mount_width + nut_holder_thickness, nut_holder_thickness], center=false);

        // add the right leg
        translate([-mount_outer_dia/2 - case_thickness - case_tolerance, -overall_mount_width/2, overall_height + case_tolerance])
        cube([case_thickness, overall_mount_width + nut_holder_thickness, nut_holder_thickness], center=false);

        // add the leg stabalizer
        translate([-mount_outer_dia/2 - case_tolerance, -case_tolerance*2 - mount_thickness + (mount_thickness-nut_holder_thickness)/2, overall_height + case_tolerance])
        cube([mount_outer_dia + case_tolerance * 2, case_thickness, nut_holder_thickness], center=false);
    }
}

if(show_magnet) {

    // draw the magnet (for demo/display)
    
    color(magnet_color)
    render()
    translate([0, 0, case_floor_thickness + case_tolerance])
    difference() {
        cylinder(h=magnet_thickness, d=magnet_outer_dia);
        cylinder(h=magnet_thickness, d=magnet_inner_dia);
    }
}