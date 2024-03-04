use <utils/cube_rounded.scad>

x = 40;
y = 40;
z = 40;
thickness = 1.2;
radius = 1.5;
hole = 14;

module body(size, radius, thickness = 1.2, hole = 14) {
    width = size[0];
    depth = size[1];
    height = size[2];
    
    difference() {
        cube_rounded([width, depth, height], true, radius);
        
        translate([0, 0, height/2])
            cube([width+0.1, depth+0.1, radius*2], true);
        
        translate([0, 0, thickness])
            cube([width-thickness*2, depth-thickness*2, height], true);
        
        cube([width+0.1, hole, hole], true);
        cube([hole, depth+0.1, hole], true);
        cube([hole, hole, height+0.1], true);
    }
}

body([x, y, z], radius, thickness, hole);