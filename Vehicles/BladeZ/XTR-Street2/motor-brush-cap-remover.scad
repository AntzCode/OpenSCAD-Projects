

/**
 * Motor Brush Cap Remover Tool
 *
 * Description:
 * Specialized 3D printable tool to safely remove motor brush caps on Brushed DC Motors
 * for maintenance access when the caps have been damaged. Features two pin holes 
 * that when drilled into the cap, engage the cap in lieu of the slot. Square drive 
 * shaft for grip with an adjustable wrench. 
 *
 * Usage:
 * 1. Open this file in OpenSCAD.
 * 2. Render (F6) and export as STL.
 * 3. 3D print the tool (no supports needed).
 * 4. Drill the holes through the tool into the cap.
 * 5. Use nails through the holes to remove the stuck cap.
 *
 * Photos and instructions online at https://github.com/AntzCode/OpenSCAD-Projects
 *
 * Parameters (customizable at top):
 * - cube_length: Length of the handle (30mm default)
 * - cube_width: Width of the handle (26mm default)
 * - cylinder_width_inner/outer: Grip dimensions
 * - pin_width/distance: Pin dimensions for cap engagement
 *
 * Author: Anthony Gallon
 * Owner/Licensor: AntzCode Ltd <https://www.antzcode.com>
 * Contact: https://github.com/AntzCode
 *
 * License:
 * GNU General Public License v3.0 (GPL-3.0)
 * See ../../LICENSE for full license details.
 */

cube_length=30;
cube_width=26;
cylinder_overlap=7;
cylinder_inner_inset=5;
cylinder_width_inner=26.5;
cylinder_width_outer=36;
pin_width=2.55;
pin_outer_distance=13;

function cylinder_length() = cylinder_inner_inset + cylinder_overlap;

function pin_length() =cylinder_length()+cylinder_overlap+cube_length;


function pin_offset() = (pin_outer_distance-pin_width)/2;

module pin_hole() {
    cylinder(h=pin_length(), d=pin_width, $fn = 100);
}

difference() {

    union() {
        // draw the cube
        translate([0, 0, cube_length/2])
            cube([cube_width, cube_width, cube_length], center=true);

        difference() {
            // draw the outer cylinder
            translate([0, 0, -(cylinder_inner_inset + cylinder_overlap)/2 + cylinder_overlap])
            cylinder(h=(cylinder_inner_inset + cylinder_overlap), d=cylinder_width_outer, center=true, $fn = 100);

            // carve-out the inner cylinder
            color("red") translate([0, 0, -(cylinder_inner_inset)/2])
            cylinder(h=cylinder_inner_inset, d=cylinder_width_inner, center=true, $fn = 100);

        }
    }

    // pin hole 1
    translate([-pin_offset(), 0, -cube_length/2]) 
    color("green") pin_hole();

    // pin hole 2
    translate([pin_offset(), 0, -cube_length/2]) 
    color("green") pin_hole();


}