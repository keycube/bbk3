use <utils/cube_rounded.scad>
use <utils/cube_rounded_side.scad>
use <utils/mirror_copy.scad>

width = 40;
depth = 40;
height = 2.5;
radius = 1.5;
innerRadius = 1.15;
outerRadius = 2.05;
spacing = 4.2;
magnetRadius = 3.2;

module screwhole(position, innerRadius, outerRadius) {
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
        
        // Screw hole
        mirror_copy([0, 1, 0])
            mirror_copy([1, 0, 0])
                screwhole([width/2-spacing, depth/2-spacing], innerRadius, outerRadius);
        
        // USB-C hole
        translate([-0.75, 0, 0])
            cube_rounded_side([3.75, 9.2, 6], true, 1.25);
        translate([-2.5, 0, 0])
            cube([11, 22, 2], true);
        
        // Switch hole and placeholder
        translate([8, 0, -0.25])
            cube([4, 9.5, 2], true);
        translate([8, 0, 1.75/2+0.75])
            linear_extrude(scale = 2, center = true, height=1.8)
                square([2, 4.75], true);
        
        // Magnet placeholder
        mirror_copy([0, 1, 0])
            mirror_copy([1, 0, 0])
                translate([12, 12, 0-0.5])
                cylinder(h=2.5, r=magnetRadius, center = false);
    }
}

bottom([width, depth, height], radius, innerRadius, outerRadius, spacing);
$fa = 1;
$fs = 0.1;