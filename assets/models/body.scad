use <utils/cube_rounded.scad>

difference() {
    cube_rounded([40, 40, 40], true, 3.0);
    translate([0, 0, 40/2-1])
        cube([41, 41, 4], true);
    translate([0, 0, 1.5])
        cube([37, 37, 40], true);
    cube([41, 14, 14], true);
    cube([14, 41, 14], true);
    cube([14, 14, 41], true);
}