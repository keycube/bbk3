use <utils/cube_rounded.scad>

translate([0, 0, 4])
difference() {
    difference() {
        cube_rounded([34.0, 34.0, 8], true, 1.5);
        translate([0, 0, 3])
            cube([40, 40, 6], true);
    }
    translate([0, 0, -1])
    cube([32.0, 32.0, 4.0], true);
}

translate([0, 8.5, 2.25])
    cube([33, 1, 3.5], true);

translate([0, -8.5, 2.25])
    cube([33, 1, 3.5], true);

translate([8.5, 0, 2.25])
    cube([1, 33, 3.5], true);

translate([-8.5, 0, 2.25])
    cube([1, 33, 3.5], true);

translate([2.35+0.5, 0, 2.75])
    cube([1.0, 2.9, 4.5], true);

translate([-2.35-0.5, 0, 2.75])
    cube([1.0, 2.9, 4.5], true);