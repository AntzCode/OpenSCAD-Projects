



fork_thickness = 5.6;


mount_thickness_inner = 4.2;
mount_plate_thickness = 4;

mount_bolt_hole_dia = 6;
mount_bolt_hole_offset_rear = 37;
mount_bolt_hole_offset_bottom = 58;
mount_bolt_head_clearance_dia = 0;

cable_tunnel_length = 40;
cable_tunnel_thickness = 3;
cable_dia_outer = 8;
cable_dia_inner = 6;
cable_tunnel_angle = 30;

$fn = 80;

cable_tunnel_dia_outer = cable_dia_outer + cable_tunnel_thickness * 2;

    // mount plate

    render()
    difference() {
        //rotate([0, 0, mount_angle_c - 90])
        translate([0, -20, 0])
        linear_extrude(height=mount_plate_thickness)
        polygon([
            [0, 0],
            [0, 14],
            [33, 2],
            [38, 2],
            [43, 4],
            [45, 6],
            [46.5, 9],
            [47, 13],
            [40.7, 43.5],
            [0, 24]
            
        ]);
        translate([mount_bolt_hole_offset_rear, 49 - mount_bolt_hole_offset_bottom, 0])
        cylinder(h=mount_plate_thickness, d=mount_bolt_hole_dia);
    }

    rotate([0, 0, 30])
    cube([47, mount_plate_thickness, mount_plate_thickness + fork_thickness]);

    translate([0, -0, mount_plate_thickness + fork_thickness])
    rotate([0, 0, 30])
    translate([0, -mount_thickness_inner, 0])
    cube([47, mount_plate_thickness + mount_thickness_inner, mount_thickness_inner]);

    // cable tunnel

    translate([-5.5, 0, -cable_tunnel_dia_outer/2 + cable_tunnel_thickness])
    rotate([5, 90, 19])
    render()
    difference() {

        hull() {
            translate([-(11-mount_plate_thickness), 0, 2])
            rotate([-14, 0, 0])
            rotate([0, -90, 180])
            linear_extrude(height=7-mount_plate_thickness)
            translate([0, 0, 10])
            polygon([
                    [0, 0],
                    [39, 0],
                    [30, 21],
                    [0, 12]
                ]);

            // draw a cylinder for the cable tunnel
            cylinder(h=cable_tunnel_length, d=cable_tunnel_dia_outer);



        }

        // carve room for the bolt head
        translate([-mount_plate_thickness, -19.3, 38])
        rotate([0, 90, 0])
        cylinder(h=cable_dia_outer, d=mount_bolt_head_clearance_dia);

        // hone the outer cable
        translate([0, 0, cable_tunnel_thickness * 2])
        cylinder(h=cable_tunnel_length - cable_tunnel_thickness * 2, d=cable_dia_outer);

        // hone the inner cable
        cylinder(h=cable_tunnel_thickness * 2, d=cable_dia_inner);
    }



