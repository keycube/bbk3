use <utils/cube_rounded.scad>

module keycap(size, radius, thickness = 1.0) {
    width = size[0];
    depth = size[1];
    height = size[2];

    union() {
        difference() {
            translate([0, 0, height])
            difference() {
                cube_rounded([width, depth, height*2], true, 1.5);
                translate([0, 0, (height+1)/2])
                    cube([width+1, depth+1, height+1], true);
            }
            translate([0, 0, height/2+thickness])
                cube([width-thickness*2, depth-thickness*2, height], true);
        }
        
        translate([0, 8.5, 1.75])
            cube([width-thickness*2+0.1, 1, 2.5], true);

        translate([0, -8.5, 1.75])
            cube([width-thickness*2+0.1, 1, 2.5], true);

        translate([8.5, 0, 1.75])
            cube([1, depth-thickness*2+0.1, 2.5], true);

        translate([-8.5, 0, 1.75])
            cube([1, depth-thickness*2+0.1, 2.5], true);

        translate([2.35+0.5, 0, 2.75])
            cube([1.0, 2.9, 4.5], true);

        translate([-2.35-0.5, 0, 2.75])
            cube([1.0, 2.9, 4.5], true);
    }
}

keycap([34.0, 34.0, 4.0], radius = 1.25);