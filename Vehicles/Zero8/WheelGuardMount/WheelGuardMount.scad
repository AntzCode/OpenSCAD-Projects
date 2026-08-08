

show_inner_clamp_bolt_hole = false;
show_outer_clamp_bolt_holes = true;


front_offset = 4;
rear_offset = 4;
shaft_width = 16.8;
shaft_height = 16.8;

clamp_height = 44;
clamp_length = 69.2;

lip_width = 0;
lip_offset_bottom = 1;
lip_height = 8;

shaft_bolt_dia = 0;

mount_plate_width = 69.2;
mount_plate_length = 50;
mount_plate_thickness = 10;
mount_plate_offset = 0;
mount_plate_hole_dia = 4.8;
mount_plate_hole_depth = 28;
mount_plate_hole_spacing_rear = 27;
mount_plate_hole_spacing_front = 20;
mount_plate_hole_offset_rear = 16;
mount_plate_front_bevel_angle = -40;
mount_plate_front_bevel_offset = -22;

clamp_tab_width = 8; // ensure clearance for bolt head size + tool
clamp_tab_thickness = 14;
clamp_tab_bolt_hole_dia = 0;
clamp_tab_nut_size = 10.6;
clamp_tab_nut_thickness = 0;
clamp_bolt_spacing = 60;

$fn = 80;


// calculated
clamp_width = front_offset + rear_offset + shaft_width;


module clamp_tab_a() {
    render()
    difference() {
        cube([clamp_length, clamp_tab_thickness, clamp_tab_width], center=false);
        
        // drill the hole for clamp bolts

        if(show_outer_clamp_bolt_holes)
        translate([clamp_length/4, 0, clamp_tab_width/2])
        rotate([0, 90, 90])
        cylinder(h=clamp_tab_thickness, d=clamp_tab_bolt_hole_dia);

        if(show_inner_clamp_bolt_hole)
        translate([clamp_length/2, 0, clamp_tab_width/2])
        rotate([0, 90, 90])
        cylinder(h=clamp_tab_thickness, d=clamp_tab_bolt_hole_dia);

        if(show_outer_clamp_bolt_holes)        
        translate([clamp_length/4*3, 0, clamp_tab_width/2])
        rotate([0, 90, 90])
        cylinder(h=clamp_tab_thickness, d=clamp_tab_bolt_hole_dia);
    }
}


module clamp_tab_b() {
    render()
    difference(){
        cube([clamp_length, clamp_tab_thickness + clamp_tab_nut_thickness, clamp_tab_width], center=false);

        // drill the hole for clamp bolts
        if(show_outer_clamp_bolt_holes)
        translate([clamp_length/4, clamp_tab_nut_thickness, clamp_tab_width/2])
        rotate([0, 90, 90])
        cylinder(h=clamp_tab_thickness, d=clamp_tab_bolt_hole_dia);

        if(show_inner_clamp_bolt_hole)
        translate([clamp_length/2, clamp_tab_nut_thickness, clamp_tab_width/2])
        rotate([0, 90, 90])
        cylinder(h=clamp_tab_thickness, d=clamp_tab_bolt_hole_dia);
        
        if(show_outer_clamp_bolt_holes)
        translate([clamp_length/4*3, clamp_tab_nut_thickness, clamp_tab_width/2])
        rotate([0, 90, 90])
        cylinder(h=clamp_tab_thickness, d=clamp_tab_bolt_hole_dia);

        // drill the nut holders
        if(show_outer_clamp_bolt_holes)
        translate([clamp_length/4, 0, clamp_tab_width/2])
        rotate([0, 90, 90])
        cylinder(h=clamp_tab_nut_thickness, d=clamp_tab_nut_size, $fn=6);

        if(show_inner_clamp_bolt_hole)
        translate([clamp_length/2, 0, clamp_tab_width/2])
        rotate([0, 90, 90])
        cylinder(h=clamp_tab_nut_thickness, d=clamp_tab_nut_size, $fn=6);
        
        if(show_outer_clamp_bolt_holes)
        rotate([0, 0, 0])
        translate([clamp_length/4*3, 0, clamp_tab_width/2])
        rotate([0, 90, 90])
        cylinder(h=clamp_tab_nut_thickness, d=clamp_tab_nut_size, $fn=6);

    }

}

// draw the main block
render()
translate([0, 0, clamp_tab_width])
difference() {
    union() {
        cube([clamp_length, clamp_width, clamp_height]);

        // left lip

        translate([-lip_width, 0, shaft_height + lip_offset_bottom])
        cube([lip_width, clamp_width, lip_height], center=false);


        // right lip
        translate([clamp_length, 0, shaft_height + lip_offset_bottom])
        cube([lip_width, clamp_width, lip_height], center=false);

        // draw the mount plate

        translate([0, mount_plate_offset, 0])
        difference() {

            // draw the mount plate
            union() {
                // draw the semi-circle
                translate([(clamp_length - mount_plate_width) / 2 + mount_plate_width / 2, mount_plate_length - mount_plate_width / 2, clamp_height])
                difference() {
                    cylinder(h=mount_plate_thickness, d=mount_plate_width);
                    
                    translate([-mount_plate_width/2, -mount_plate_width, 0])
                    cube([mount_plate_width, mount_plate_width, mount_plate_thickness], center=false);
                    
                    // subtract the bevel from the front edge
                    translate([mount_plate_width / 2, 0, mount_plate_front_bevel_offset])
                    rotate([mount_plate_front_bevel_angle, 180, 0])
                    cube([mount_plate_width, mount_plate_length, mount_plate_thickness], center=false);
                    
                }

                // draw the back part of the mount plate
                translate([(clamp_length - mount_plate_width) / 2, 0, clamp_height])
                cube([mount_plate_width, mount_plate_length - mount_plate_width / 2, mount_plate_thickness], center=false);
            }

        }

    }

    // cut the hole for the shaft
    translate([0, rear_offset, 0])
    cube([clamp_length, shaft_width, shaft_height]);


    // drill the mount plate holes

    // drill the mount plate bolt hole left rear
    translate([clamp_length / 2 - mount_plate_hole_spacing_rear / 2, mount_plate_offset + mount_plate_hole_offset_rear, clamp_height + mount_plate_thickness - mount_plate_hole_depth])
    cylinder(h=mount_plate_hole_depth, d=mount_plate_hole_dia);

    // drill the mount plate bolt hole right rear
    translate([clamp_length / 2 + mount_plate_hole_spacing_rear / 2, mount_plate_offset + mount_plate_hole_offset_rear, clamp_height + mount_plate_thickness - mount_plate_hole_depth])
    cylinder(h=mount_plate_hole_depth, d=mount_plate_hole_dia);

    // drill the mount plate bolt hole front
    translate([clamp_length / 2, mount_plate_offset + mount_plate_hole_offset_rear + mount_plate_hole_spacing_front, clamp_height + mount_plate_thickness - mount_plate_hole_depth])
    cylinder(h=mount_plate_hole_depth, d=mount_plate_hole_dia);

}

// draw the clamp_tabs
translate([0, clamp_width - clamp_tab_thickness, 0])
clamp_tab_a();

translate([0, 0, 0])
clamp_tab_b();



