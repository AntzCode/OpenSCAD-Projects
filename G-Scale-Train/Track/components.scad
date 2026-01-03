
// distance from the end of the sleeper to the outer edge of the rail heel
function railHeelOffset() = (railHeelWidth - railWidth) / 2;

// distance from the end of the sleeper to the left edge of the first sleeper
function sleeperRailOffset() = (sleeperLength - railSpacing) / 2 - railHeelOffset() - railWidth;

// distance from the left edge of one sleeper to the left edge of the next sleeper (gap + sleeper width)
function sleeperSpacing() = (railLength + coupleLength / 2 + leftRailOffset / 2) / (numberOfSleepers + 1);

function sleeperGap() = sleeperSpacing() - sleeperWidth;

function sleeperOffsetSouth() = (sleeperSpacing() - sleeperWidth);
function sleeperOffsetNorth() = sleeperSpacing() * numberOfSleepers;

// draw a female couple in the style of the Service Railway model set
module coupleFemale_SR() {

    difference() {

        // draw the coupling block as a solid rectagular cube
        translate([ 0, -coupleThickness, -coupleThickness ]) {
            cuboid([
                coupleLength, 
                railHeelWidth + coupleThickness * 2,
                railHeelHeight + coupleThickness * 2
            ], center = false, fillet = railCornerRadius){};
        }

        // carve-out the rail heel from the coupling block
        translate(
            [ -coupleTolerance, -coupleTolerance / 2, -coupleTolerance / 2 ]) {
            cuboid([
                coupleLength + coupleTolerance, railHeelWidth + coupleTolerance,
                railHeelHeight +
                coupleTolerance
            ], center = false){};
        }

        // carve-out the rail from the coupling block
        translate([ -coupleTolerance, railHeelOffset() - coupleTolerance / 2, 0 ]) {
            cuboid([
                coupleLength - sleeperWidth + coupleTolerance,
                railWidth + coupleTolerance,
                railHeight
            ], center = false){};
        }

        // carve-out the wheel track in case the coupling block protrudes and collides with the wheel flange
        translate([
            0, 
            railHeelOffset() - wheelFlangeWidth,
            (railHeight - wheelFlangeHeight)
        ]) {
            cuboid([
                coupleLength, 
                wheelFlangeWidth + railCornerRadius,
                wheelFlangeHeight
            ], center = false, fillet = railCornerRadius, edges = EDGES_X_ALL){};
        }
    } // end difference

    // add the notch to lock the male couple in place
    translate([
        coupleNotchDiameter / 2 + coupleNotchOffset,
        railHeelWidth + coupleNotchDiameter / 2 - coupleNotchTightness, 0
    ]) {
        cylinder(railHeelHeight + coupleTolerance * 2, coupleNotchDiameter / 2,
            coupleNotchDiameter / 2) {}
    }

    if(drawSupports) {
        // draw the support plate under the left lip of the couple top
        difference(){
            translate([ 0, supportPlateGap, railHeelHeight - supportPlateGap ]) {
                rotate([ 0, 90, 0 ]){
                    cuboid([
                        supportPlateThickness, railHeelWidth - supportPlateGap * 2, (coupleLength - (railLength - sleeperOffsetNorth() - leftRailOffset / 2) - supportPlateGap)
                    ], center = false){};
                }
            }

            // add the notch to lock the male couple in place
            translate([
                coupleNotchDiameter / 2 + coupleNotchOffset,
                railHeelWidth + coupleNotchDiameter / 2 - coupleNotchTightness, 0
            ]) {
                cylinder(railHeelHeight + coupleTolerance * 2, coupleNotchDiameter / 2 + supportPlateGap,
                    coupleNotchDiameter / 2 + supportPlateGap ) {}
            }


        }
    }


}

// draw a female couple in the Easy Print™ style
module coupleFemale_EP() {

    difference() {

        // draw the coupling block
        hull() {
            translate([ 0, 0, -(railHeight + coupleThickness) ]) {
                rotate([ 90, 0, 90 ]) {
                    linear_extrude(height = coupleLength) {
                        polygon(polyRound([
                            [ -coupleThickness, sleeperHeight, railCornerRadius ],
                            [ railHeelWidth / 2, sleeperHeight / 2, railCornerRadius ],
                            [ railHeelWidth + coupleThickness, sleeperHeight, railCornerRadius ]
                        ]));
                    }
                }
            }

            translate([ 0, -coupleThickness, -coupleThickness ]) {
                cuboid([
                    coupleLength, 
                    railHeelWidth + coupleThickness * 2,
                    railHeelHeight + coupleThickness * 2
                ], center = false, fillet = railCornerRadius){};
            }
        }

        // carve-out the top triangle
        translate([ coupleLength - sleeperWidth, -coupleTolerance, -coupleTolerance ]) {
            rotate([ 0, 270, 0 ]) {
                linear_extrude(height = coupleLength - sleeperWidth + 1) {
                    polygon(polyRound([
                        [ 0, 0, 0 ], 
                        [ 0, railHeelWidth + coupleTolerance * 2, 0 ],
                        [ railHeight + coupleTolerance, (railHeelWidth + coupleTolerance * 2) / 2, 0 ]
                    ])){};
                }
            }
        }

        // carve-out the bottom triangle
        translate([ -0.2, 0, -railHeight ]) {
            rotate([ 90, 0, 90 ]) {
                linear_extrude(height = coupleLength) {
                    polygon(polyRound([
                        [ -coupleTolerance, sleeperHeight - coupleTolerance + 0.01, 0 ],
                        [ railHeelWidth / 2, sleeperHeight / 2, 0 ],
                        [ railHeelWidth + coupleTolerance, sleeperHeight - coupleTolerance + 0.01, 0 ]
                    ]));
                }
            }
        }

        // carve-out the rail
        translate([ -coupleTolerance, railHeelOffset() - coupleTolerance / 2, 0 ]) {
            cuboid([
                coupleLength - sleeperWidth + coupleTolerance,
                railWidth + coupleTolerance,
                railHeight
            ], center = false){};
        }

        // carve-out the wheel track
        translate([
            0, 
            railHeelOffset() - wheelFlangeWidth, 
            (railHeight - wheelFlangeHeight)
        ]) {
            cuboid([
                coupleLength, 
                wheelFlangeWidth + railCornerRadius,
                wheelFlangeHeight
            ], center = false, fillet = railCornerRadius, edges = EDGES_X_ALL){};
        }
    } // end difference

    // add the pin that locks in to the notch on the male couple
    translate([
        coupleNotchDiameter / 2 + coupleNotchOffset,
        railHeelWidth + coupleNotchDiameter / 2 - coupleNotchTightness, 
        -coupleTolerance
    ]) {
        cylinder(railHeelHeight + coupleTolerance * 2, coupleNotchDiameter / 2,
            coupleNotchDiameter / 2) {}
    }
}

// draw a male couple in the style of the Service Railway model set
module coupleMale_SR() {

    // shave the thickness of the rail heel according to tolerance settings
    translate([ railLength - coupleLength, 0, -0.1 ]) {
        cuboid([ coupleLength, railHeelWidth, coupleTolerance ], center = false){};
    }

    // shave the edges off the inner rail heel according to tolerance settings
    translate([ railLength - coupleLength, -0.1, 0 ]) {
        cuboid([ coupleLength, coupleTolerance, railHeelHeight ], center = false){};
    }

    // shave the edges off the outer rail heel according to tolerance settings
    translate([ railLength - coupleLength, railHeelWidth - coupleTolerance, 0 ]) {
        cuboid([ coupleLength, coupleTolerance, railHeelHeight ], center = false){};
    }

    // carve out the notch for the pin to lock into
    translate([
        railLength - coupleNotchDiameter - coupleNotchOffset,
        railHeelWidth - railHeelOffset(), 
        0
    ]) {
        cube([ coupleNotchDiameter, railHeelOffset(), railHeight ]);
    }

    // carve out a wedge shape on the leading edge of the outer rail heel to help slide into the notch
    translate([ railLength - coupleNotchOffset, railHeelWidth, railHeelHeight ]) {
        rotate([ 180, 0, 0 ]) {
        linear_extrude(height = railHeelHeight) {
            polygon(polyRound([
            [ 0, 0, 0 ], [ 0, coupleNotchTightness, 0 ],
            [ coupleNotchOffset + 0.1, coupleNotchTightness * 2, 0 ],
            [ coupleNotchOffset + 0.1, 0, 0 ]
            ])){};
        }
        }
    }
}


// draw a male couple in the Easy Print™ style
module coupleMale_EP() {

    translate([ railLength, 0, 0 ]) {

        color("green") union(){

        difference() { //                ________________
            //                           |     /  \     |
            //  make a shape like this   |    /    \    |
            //   that will be used to    |   /      \   |
            //   subtract as difference  |  /        \  |
            //   against the rail        | /__________\ |
            //                           |______________|

            translate([ -(coupleLength - sleeperWidth), -0.1, 0 ]) {
                // draw a cube to shave the rail heel
                cuboid([
                    coupleLength - sleeperWidth + 0.2, 
                    railHeelWidth + 0.2,
                    railHeelHeight
                    ], center = false
                ){};
            }

            // carve out the top triangle
            translate([ 0.3, 0, 0 ]) {
                rotate([ 0, 270, 0 ]) {
                    linear_extrude(height = coupleLength - sleeperWidth + 0.2) {
                        polygon(polyRound([
                        [ 0, 0, 0 ], [ 0, railHeelWidth, 0 ],
                        [ railHeight, (railHeelWidth) / 2, 0 ]
                        ])){};
                    }
                }
            }
        }

        // carve out a wedge shape on the leading edge of the outer rail heel to help slide into the notch
        translate([ 
            -coupleNotchOffset - 0.5, 
            railHeelWidth + 0.1, 
            railHeelHeight 
        ]) {
            rotate([ 180, 0, 0 ]) {
                linear_extrude(height = railHeight) {
                    polygon(polyRound([
                        [ 0, 0, 0 ], 
                        [ 0, coupleTolerance, 0 ],
                        [ coupleNotchOffset + coupleTolerance, coupleNotchTightness * 2, 0],
                        [ coupleNotchOffset + coupleTolerance, 0, 0 ]
                    ])){};
                }
            }
        }

        // carve out the notch for the pin to lock into
        translate([
            -(coupleNotchOffset + coupleNotchDiameter / 2),
            railHeelWidth - coupleTolerance, 
            -railHeelHeight
        ]) {
            cylinder(
                r1 = coupleNotchDiameter / 2, 
                r2 = coupleNotchDiameter / 2,
                h = railHeight
            ){};
        }

        }

    } // end translate
}

// draw a rail 
module makeRail(femaleCoupleType, maleCoupleType) {

    translate([ railLength, railHeelWidth, 0 ]) {

        rotate([ 0, 0, 180 ]) {

            if (femaleCoupleType == "SR") {
                // draw the female couple in the Service Railway style
                coupleFemale_SR();
            }
            if (femaleCoupleType == "EP") {
                // draw the female couple in the Easy Print™ style
                coupleFemale_EP();
            }

            difference() {

                union() {

                    translate([ coupleLength/2, railHeelOffset(), 0 ]) {
                        // draw the shape of the rail
                        cuboid([
                            railLength - coupleLength / 2, railWidth,
                            railHeight
                        ], center = false, fillet = railCornerRadius){};
                    }

                    translate([ coupleLength - sleeperWidth, 0, 0 ]) {
                        // draw the shape of the heel of the rail
                        cuboid([
                            railLength - (coupleLength - sleeperWidth),
                            railHeelWidth - 0.4, railHeelHeight - 0.01
                        ], center = false, fillet = railCornerRadius){};
                    }

                    if (maleCoupleType == "EP") {

                        hull() {

                            translate([ (railLength - sleeperOffsetSouth()), 0, 0 ]) {
                                // draw the shape of the heel of the rail
                                cuboid([
                                    railLength - (railLength - sleeperOffsetSouth()),
                                    railHeelWidth - 0.4, railHeelHeight - 0.01
                                ], center = false, fillet = railCornerRadius){};
                            }

                            // fill the shape of a triangle for the Easy Print™ style couple
                            translate([ (railLength - sleeperOffsetSouth()), 0, -railHeight ]) {
                                rotate([ 90, 0, 90 ]) {
                                    linear_extrude(height = railLength - (railLength - sleeperOffsetSouth())) {
                                        polygon(polyRound([
                                            [ 0, sleeperHeight, 0 ],
                                            [ railHeelWidth / 2, sleeperHeight / 2 + coupleTolerance, 0 ],
                                            [ railHeelWidth, sleeperHeight, 0 ]
                                        ]));
                                    }
                                }
                            }
                        }
                    }

                }

                if (maleCoupleType == "SR") {
                    // draw the male couple in the Service Railway style
                    coupleMale_SR();
                }

                if (maleCoupleType == "EP") {
                    // draw the male couple in the Easy Print™ style
                    coupleMale_EP();

                }
            } // end difference

            if(drawSupports) {
                // draw the support plate under the rail at the female couple end

                if(femaleCoupleType == "SR"){ 
                    translate([ 0, -coupleThickness, -coupleThickness ]) {
                        rotate([ 0, 90, 0 ]){
                            cuboid([
                                supportPlateThickness, railHeelWidth + coupleThickness * 2, railLength - sleeperOffsetNorth() - supportPlateGap
                            ], center = false){};
                        }
                    }
                }

                if(femaleCoupleType == "EP"){ 
                    translate([ 0, railHeelWidth/2-supportPlateThickness/2, -sleeperHeight/2 - coupleThickness - supportPlateGap ]) {
                        rotate([ 0, 90, 0 ]){
                            cuboid([
                                supportPlateThickness, supportPlateThickness, sleeperOffsetSouth() - leftRailOffset / 2 - supportPlateGap
                            ], center = false){};
                        }
                    }
                }


            }

            if(drawSupports) {
                // draw the support plate under the rail at the male couple end

                if(maleCoupleType == "SR") {
                    translate([ 
                        railLength - (railLength - sleeperOffsetNorth() - supportPlateGap) - leftRailOffset / 2, 
                        0,
                        coupleTolerance-supportPlateGap
                    ]) {
                        rotate([ 0, 90, 0 ]){
                            cuboid([
                                supportPlateThickness, railHeelWidth, railLength - sleeperOffsetNorth() - supportPlateGap + leftRailOffset / 2
                            ], center = false){};
                        }
                    }
                }

                if(maleCoupleType == "EP") {
                    translate([ 
                        // @todo couple length should be sleeper offset
                        railLength - sleeperOffsetSouth() + supportPlateGap, 
                        railHeelWidth / 2 - supportPlateThickness/2,
                        -sleeperHeight/2 + supportPlateThickness/2 - supportPlateGap 
                    ]) {
                        rotate([ 0, 90, 0 ]){
                            cuboid([
                                supportPlateThickness, supportPlateThickness, sleeperOffsetSouth()- supportPlateGap
                            ], center = false){};
                        }
                    }
                }
            } // end if(drawSupports)
        }
    }
}


// draw a sleeper
module sleeper() {
    // draw a sleeper as a cuboid with rounded corners
    cuboid([ sleeperWidth, sleeperLength, sleeperHeight ], 
        center = false, fillet = sleeperCornerRadius
    ){};

    // draw the left-outer nail plate on the other side of the sleeper
    translate([
        sleeperWidth,
        sleeperLength - sleeperRailOffset() + nailPlateLength - nailPlateRailOverlap,
        0
    ]) {
        rotate([ 0, 0, 180 ]) { nailPlate(); }
    }

    // draw the left-inner nail plate on the other side of the sleeper
    translate([ 
        0, 
        sleeperRailOffset() - nailPlateLength + nailPlateRailOverlap + railSpacing + railWidth,
        0
    ]) {
        nailPlate();
    }
    
    // draw the right-outer nail plate on the sleeper
    translate([ 0, sleeperRailOffset() - nailPlateLength + nailPlateRailOverlap, 0 ]) {
        nailPlate();
    }

    // draw the right-inner nail plate on the other side of the sleeper
    translate([
        sleeperWidth,
        sleeperRailOffset() + railHeelWidth + nailPlateLength - nailPlateRailOverlap,
        0
    ]) {
        rotate([ 0, 0, 180 ]) { nailPlate(); }
    }

}

module nailPlate() {
    translate([ sleeperWidth / 2 - nailPlateWidth / 2, 0, sleeperHeight ]) {
        // draw the nail plate
        cuboid([ nailPlateWidth, nailPlateLength, nailPlateHeight ], 
            center = false, fillet = nailPlateCornerRadius
        ){};

        // draw the first nail
        translate([
            (nailPlateWidth - nailPlateNailRadius) / 3,
            (nailPlateLength - nailPlateRailOverlap) / 2,
            nailPlateHeight
        ]) {
            sphere(r = nailPlateNailRadius){};
        }

        // draw the second nail
        translate([
            (nailPlateWidth - (nailPlateWidth - nailPlateNailRadius) / 3),
            (nailPlateLength - nailPlateRailOverlap) / 2,
            nailPlateHeight
        ]) {
            sphere(r = nailPlateNailRadius){};
        }
    }
}

module roadRamp() {
    translate([ 0, 0, 0 ]) {
        rotate([ 0, 270, 0 ]) {
            hull() {
                linear_extrude(height = roadWidth) {
                    polygon(polyRound([
                        [ 0, 0, 0 ], 
                        [ 0, roadRampLength, 0 ],
                        [ 
                            railHeight + sleeperHeight + roadHeightDifference, 
                            roadRampLength,
                            roadRampEdgeRadius
                        ]
                    ]));
                }
                translate([ 0, 0, -roadSidesBevel ]) {
                    linear_extrude(height = roadSidesBevel) {
                        polygon(polyRound([
                            [ 0, 0, 0 ], 
                            [ 0, roadRampLength, 0 ],
                            [ sleeperHeight, roadRampLength, roadRampEdgeRadius ]
                        ]));
                    }
                }
                translate([ 0, 0, roadWidth ]) {
                    linear_extrude(height = roadSidesBevel) {
                        polygon(polyRound([
                            [ 0, 0, 0 ], 
                            [ 0, roadRampLength, 0 ],
                            [ sleeperHeight, roadRampLength, roadRampEdgeRadius ]
                        ]));
                    }
                }
            }
        }
    }
}

module drawLevelCrossing() {
    translate([
        railLength - (railLength / 2 - roadWidth / 2),
        -(roadRampLength - sleeperRailOffset() - railHeelOffset() / 2), 
        0
    ]) {
        roadRamp();
    }
    translate([
        (railLength - roadWidth) / 2,
        roadRampLength + (sleeperLength - sleeperRailOffset() - railHeelOffset() / 2),
        0
    ]) {
        rotate([ 0, 0, 180 ]) { roadRamp(); }
    }

    hull() {
        translate([
            railLength - (railLength - roadWidth) / 2,
            (sleeperLength - railSpacing) / 2 + wheelFlangeWidth, 
            0
        ]) {
        rotate([ 0, 0, 90 ]) {
            cuboid([
                railSpacing - wheelFlangeWidth * 2, roadWidth,
                railHeight + sleeperHeight +
                roadHeightDifference
            ], center = false, fillet = roadRampEdgeRadius);
            }
        }

        translate([
            railLength - (railLength - roadWidth) / 2 + roadSidesBevel,
            (sleeperLength - railSpacing) / 2 + wheelFlangeWidth, 
            0
        ]) {
            rotate([ 0, 0, 90 ]) {
                cuboid([
                    railSpacing - wheelFlangeWidth * 2, 
                    roadSidesBevel,
                    sleeperHeight
                ], center = false, fillet = roadRampEdgeRadius);
            }
        }

        translate([
            (railLength - roadWidth) / 2,
            (sleeperLength - railSpacing) / 2 + wheelFlangeWidth, 
            0
        ]) {
            rotate([ 0, 0, 90 ]) {
                cuboid([
                    railSpacing - wheelFlangeWidth * 2, 
                    roadSidesBevel,
                    sleeperHeight
                ], center = false, fillet = roadRampEdgeRadius);
            }
        }
    }

    translate([
        (railLength - (roadWidth + roadSidesBevel * 2)) / 2,
        (sleeperLength - (railSpacing + railHeelWidth * 2)) / 2, 0
    ]) {
        cuboid([
            roadWidth + roadSidesBevel * 2, railSpacing + railHeelWidth * 2,
            sleeperHeight
        ], center = false, fillet = roadRampEdgeRadius, edges = EDGES_Y_TOP);
    }
}

// draw a series of sleepers
module sleepers() {
    for (i = [0:numberOfSleepers - 1]) {
        translate([ sleeperSpacing() * i, 0, 0 ]) { sleeper(){}; }
    }
    for (i = [0:numberOfSleepers - 2]) {
        if(drawSupports) {
            translate([ sleeperSpacing() * i + sleeperWidth + supportPlateGap, 0, -supportPlateThickness ]) {
                translate([ 0, sleeperRailOffset(), sleeperHeight - supportPlateGap ]){
                    cuboid([ sleeperGap() - supportPlateGap * 2, railHeelWidth, supportPlateThickness ], center = false){};
                }
                translate([ 0, sleeperRailOffset() + railSpacing + railHeelOffset(), sleeperHeight - supportPlateGap ]){
                    cuboid([ sleeperGap() - supportPlateGap * 2, railHeelWidth, supportPlateThickness ], center = false){};
                }
            }
        }
    }
    
}
