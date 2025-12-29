# XTR-Street 2 LED Mount

## Description

This OpenSCAD project provides a custom mount for rear-facing LED lights on the Blade-Z XTR Street II e-scooter. The mount offsets the light from the chassis, straightens the alignment, and reuses existing holes for the wheel guard while requiring an additional hole for secure mounting.

## Features

- Customizable for left or right side mounting
- Option to print parts separately or together to reduce supports
- Includes preview of the LED lamp for alignment purposes
- Reuses existing M6 holes from the wheel guard
- Requires one additional M6 hole for bottom securing

## Requirements

- OpenSCAD (version 2021.01 or later recommended)
- 3D printer capable of printing the generated STL files

## Usage

1. Open `bladez-rear-side-lamp-mount.scad` in OpenSCAD.
2. Set the `left_or_right` variable to `"left"` or `"right"` as needed for your scooter side.
3. Adjust the `show_*` variables to display desired parts:
   - `show_mount_plate = 1;` - Show the main mount plate
   - `show_shaft_support = 1;` - Show the shaft support
   - `show_lamp = 1;` - Show the LED lamp preview
   - `show_shaft_joiner = 0;` - Show the joiner sleeve for separate printing
4. Render the model (F6) and export as STL.
5. Print the STL(s) and assemble if printed separately (glue the parts together using the joiner sleeve).

## Dimensions

- Overall width: 106mm
- Overall height: 60mm
- Overall thickness: 35mm
- Hole diameter: 6mm (M6 bolts)
- Hole spacing: 87mm (between top holes)

## Customization

The scad file includes many customizable parameters at the top, such as dimensions, hole sizes, and bevel amounts. Modify these as needed for your specific LED light or scooter model.

## Author

Anthony Gallon

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](../../LICENSE) file for details.

## Links

- [GitHub Repository](https://github.com/AntzCode/OpenSCAD-Projects)