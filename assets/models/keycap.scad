use <utils/cube_rounded.scad>

difference() {
    difference() {
        cube_rounded([34.0, 34.0, 8], true, 1.5);
        translate([0, 0, -3])
            cube([40, 40, 6], true);
    }
    translate([0, 0, 1])
    cube([32.0, 32.0, 4.0], true);
}