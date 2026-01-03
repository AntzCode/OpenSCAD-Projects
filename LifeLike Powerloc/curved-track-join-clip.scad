
$fn = 128;

pinDiameter = 6;
pinLength = 6;
pinSpacingOuter = 82;
pinSpacingInner = 78;
pinSpacingPair = 26;

basePlateThickness = 1.5;
basePlateBorderWidth = 9;
basePlateCornerRadius = 5;

//trapezoidHeight = 25.923;
//angleA = 85.588;
//angleB = 94.412;

function trapezoidHeight() = sqrt(pinSpacingPair^2 - ((pinSpacingOuter-pinSpacingInner)/2)^2);

function trapezoidAcuteAngle() = 90 - asin((pinSpacingOuter-pinSpacingInner)/2 / pinSpacingPair);

function trapezoidObtuseAngle() = 180 - trapezoidAcuteAngle();

function trackCurveCenterDistanceY() = ((pinSpacingInner / 2) / cos(trapezoidAcuteAngle()));

function outerTrackCurveRadius() = (trackCurveCenterDistanceY() - basePlateBorderWidth) + trapezoidHeight() + basePlateBorderWidth;

function outerArcHeight() = ((outerTrackCurveRadius()) - sqrt(outerTrackCurveRadius()^2 - ((pinSpacingOuter+basePlateBorderWidth*2)/2)^2));


function pin1OffsetX() = -(pinSpacingInner / 2);
function pin1OffsetY() = 0;
function pin2OffsetX() = -(pinSpacingOuter / 2);
function pin2OffsetY() = (trapezoidHeight());

function pin3OffsetX() = (pinSpacingInner / 2);
function pin3OffsetY() = 0;
function pin4OffsetX() = (pinSpacingOuter / 2);
function pin4OffsetY() = (trapezoidHeight());

echo("trapAcuteAngle");
echo(trapezoidAcuteAngle());
echo("trapObtuseAngle");
echo(trapezoidObtuseAngle());
echo("trackCurveCenterDistanceY");
echo(trackCurveCenterDistanceY());
echo("overall width");
echo(pinSpacingPair+pinDiameter+basePlateBorderWidth*2);



// pin 1
translate([pin1OffsetX(), pin1OffsetY(), 0]){
    cylinder(d=pinDiameter, h=pinLength + basePlateThickness){}
}

// pin 2
translate([pin2OffsetX(), pin2OffsetY(), 0]){
    cylinder(d=pinDiameter, h=pinLength + basePlateThickness){}
}

// pin 3
translate([pin3OffsetX(), pin3OffsetY(), 0]){
    cylinder(d=pinDiameter, h=pinLength + basePlateThickness){}
}

// pin 4
translate([pin4OffsetX(), pin4OffsetY(), 0]){
    cylinder(d=pinDiameter, h=pinLength + basePlateThickness){}
}


difference(){

hull(){
// pin 1
translate([pin1OffsetX() - pinDiameter/2 - basePlateBorderWidth/2, pin1OffsetY() - pinDiameter/2 - basePlateBorderWidth/2, 0]){
    cylinder(d=basePlateCornerRadius+0.01, h=basePlateThickness){}
}

// pin 2
translate([pin2OffsetX() - pinDiameter/2 - basePlateBorderWidth/2, pin2OffsetY() + pinDiameter/2 + basePlateBorderWidth/2, 0]){
    cylinder(d=basePlateCornerRadius+0.01, h=basePlateThickness){}
}

// pin 3
translate([pin3OffsetX() + pinDiameter/2 + basePlateBorderWidth/2, pin3OffsetY() - pinDiameter/2 - basePlateBorderWidth/2, 0]){
    cylinder(d=basePlateCornerRadius+0.01, h=basePlateThickness){}
}

// pin 4
translate([pin4OffsetX() + pinDiameter/2 + basePlateBorderWidth/2, pin4OffsetY() + pinDiameter/2 + basePlateBorderWidth/2, 0]){
    cylinder(d=basePlateCornerRadius+0.01, h=basePlateThickness){}
}

translate([0, -(trackCurveCenterDistanceY()), 0]){
    rotate_extrude(
        angle=(90 - (trapezoidAcuteAngle() ))*2, 
        start=90 - (90 - trapezoidAcuteAngle()), 
        convexity=0
    ){
        translate([outerTrackCurveRadius() + outerArcHeight(), 0, 0]){
            square(size=[basePlateBorderWidth, basePlateThickness]);
        }
    }
}


}

translate([0, -(trackCurveCenterDistanceY() + pinDiameter/2 + basePlateBorderWidth), 0]){
    cylinder(r=trackCurveCenterDistanceY(), h=basePlateThickness);
}

}



