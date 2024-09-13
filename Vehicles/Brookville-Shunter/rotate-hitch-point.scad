
include <./libraries/Round-Anything/polyround.scad>

function scale() = 4.5;

hitchNotchWidth = 80 / scale();
hitchNotchLength = 260 / scale();
hitchNotchDepth = 140 / scale();
hitchNotchCornerRadius = 30 / scale();

hitchPointDiameterBig = 280 / scale();
hitchPointDiameterSmall = 120 / scale();
hitchPointLength = 300 / scale();

       c = hitchPointDiameterBig;
        a = hitchPointDiameterBig / 2;
        b = sqrt(c * c - a * a);
        archHeight = (hitchPointDiameterBig - b);



rotate_extrude(angle=360){
    rotate([0,0,90]){
        color("green") polygon(polyRound([
            [0, 0, 0],
            [0, hitchPointDiameterSmall/2, 0],
            // create a curvature in the cylinder:
            [hitchPointLength/4 * 3, hitchPointDiameterSmall/2 + hitchPointDiameterBig/2 / 4, 200],
            [hitchPointLength, hitchPointDiameterBig/2, 5],
            [hitchPointLength + archHeight, 0, hitchNotchCornerRadius],
            [hitchPointLength + archHeight-archHeight/10, 0, 0]
        ]));

        // color("blue") polygon(polyRound([
        //     [0, 0, 0],
        //     [0, hitchPointDiameterSmall/2, 0],
        //     // create a curvature in the cylinder:
        //     [hitchPointLength/4 * 3, hitchPointDiameterSmall/2 + hitchPointDiameterBig/2 / 4, 200],
        //     [hitchPointLength, hitchPointDiameterBig/2, 5],
        //     [hitchPointLength + archHeight, 0, hitchNotchCornerRadius],
        //     [hitchPointLength + archHeight-1, 0, 0]
        // ]));
    }
}
