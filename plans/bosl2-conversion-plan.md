# BOSL1 to BOSL2 Conversion Plan for Brookville-Shunter.scad

## Overview

This document outlines the conversion strategy for converting the Brookville-Shunter model from BOSL1 to BOSL2 library.

## Conversion Status: COMPLETE ✓

## Summary of Changes

### 1. Library Include/Use Changes

**Current (BOSL1):**
```openscad
include <./libraries/BOSL/constants.scad>
use <./libraries/BOSL/shapes.scad>
```

**Converted (BOSL2):**
```openscad
include <./libraries/BOSL2/std.scad>
include <./libraries/BOSL2/constants.scad>
include <./libraries/BOSL2/attachments.scad>
use <./libraries/BOSL2/shapes3d.scad>
use <./libraries/BOSL2/shapes2d.scad>
use <./libraries/BOSL2/transforms.scad>
```

### 2. Edge Compatibility Constants

Added BOSL1-compatible edge constants since BOSL2 uses a different system:
```openscad
// All Z-aligned (vertical) edges
EDGES_Z_ALL = [[0,0,0,0], [0,0,0,0], [1,1,1,1]];
// All X-aligned (horizontal X) edges  
EDGES_X_ALL = [[1,1,1,1], [0,0,0,0], [0,0,0,0]];
// All Y-aligned (horizontal Y) edges
EDGES_Y_ALL = [[0,0,0,0], [1,1,1,1], [0,0,0,0]];
```

### 3. Parameter Changes

| BOSL1 Parameter | BOSL2 Parameter | Notes |
|----------------|----------------|-------|
| `fillet=r` | `rounding=r` | 9 instances converted |
| `center=false` | `anchor=BOT` | All cuboid() calls updated |
| `center=false` | (removed) | cylinder() calls - BOSL2 uses different syntax |

### 4. Files Modified:
- [`Vehicles/Brookville-Shunter/Brookville-Shunter.scad`](Vehicles/Brookville-Shunter/Brookville-Shunter.scad) (Version 2.0.0)

### 5. Version Updated
- Version bumped from 1.0.1 to 2.0.0
- Conversion notes added to header comment

## Testing Notes

The conversion requires OpenSCAD testing to verify:
1. Model renders correctly
2. No undefined operations occur
3. All `center=` warnings for `cuboid()` are resolved
4. Edge constants work correctly

## Third-Party Libraries (No Changes Required)

- `libraries/Round-Anything/polyround.scad` - Round-Anything library (no changes needed)
- `libraries/pschatzmann-spring/pschatzmann-spring.scad` - Spring library (no changes needed)

---

**Author:** Anthony Gallon  
**Owner/Licensor:** AntzCode Ltd https://www.antzcode.com  
**Contact:** https://github.com/AntzCode  
**Created:** 2026-06-01
**Last Updated:** 2026-06-01
