use <utils/cube_rounded.scad>
use <utils/cube_rounded_side.scad>

width = 40;
depth = 40;
height = 2.5;
radius = 1.5;
innerRadius = 1.1;
outerRadius = 1.8;
spacing = 1.5;

module hole(position, innerRadius, outerRadius) {
    x = position[0];
    y = position[1];
    translate([x, y, 1])
        cylinder(h=3, r=outerRadius, center = false);
    translate([x, y, 0])
        cylinder(h=6, r=innerRadius, center = true);
}

module bottom(size, radius, innerRadius, outerRadius, spacing) {
    difference() {
        cube_rounded([width, depth, height*2], true, radius);
        translate([0, 0, height*-1])
            cube([width+0.1, depth+0.1, height*2], center = true);
        
        hole([width/2-outerRadius-spacing, depth/2-outerRadius-spacing], innerRadius, outerRadius);
        hole([(width/2-outerRadius-spacing)*-1, depth/2-outerRadius-spacing], innerRadius, outerRadius);
        hole([width/2-outerRadius-spacing, (depth/2-outerRadius-spacing)*-1], innerRadius, outerRadius);
        hole([(width/2-outerRadius-spacing)*-1, (depth/2-outerRadius-spacing)*-1], innerRadius, outerRadius);
        
        translate([-0.75, 0, 0])
            cube_rounded_side([3.75, 8.25, 6], true, 1.25);
        translate([-3, 0, 0])
            cube([10, 22, 2], true);
        
        translate([8, 0, -0.25])
            cube([4, 9.5, 2], true);
        translate([8, 0, 1.75/2+0.75])
            linear_extrude(scale = 2, center = true, height=1.755)
                square([2, 4.75], true);

    }
}

bottom([width, depth, height], radius, innerRadius, outerRadius, spacing);
$fa = 1;
$fs = 0.1;