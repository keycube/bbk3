centered = false;
x = 12;
y = 8;
z = 1;
radius = 1.5;

module cube_rounded_side(size, radius, center) {
    width = size[0];
    depth = size[1];
    height = size[2];
    
    obj_translate = (center == false) ? [0, 0, 0] : [width/-2, depth/-2, height/-2];
    translate(obj_translate)
        hull() {
            translate([radius, radius, 0]) cylinder(r = radius, h = height);
            translate([width - radius, radius, 0]) cylinder(r = radius, h = height);
            translate([radius, depth - radius, 0]) cylinder(r = radius, h = height);
            translate([width - radius, depth - radius, 0]) cylinder(r = radius, h = height);
        }
}

cube_rounded_side([x, y, z], radius, true);
$fs = 0.1;