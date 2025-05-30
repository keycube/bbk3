use <utils/cube_rounded.scad>

x = 34.5;
y = 34.5;
z = 4.5;
radius = 1.5;

module keycap(size, radius, thickness = 1.0, insertHeight = 4.0) {
    width = size[0];
    depth = size[1];
    height = size[2];
    
    insertSpacing = 4.7;
    insertWidth = 1.05;
    insertDepth = 2.9;

    union() {
        difference() {
            translate([0, 0, height])
            difference() {
                cube_rounded([width, depth, height*2], true, radius);
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

        translate([insertSpacing/2+insertWidth/2, 0, insertHeight/2+thickness])
            cube([insertWidth, insertDepth, insertHeight+0.01], true);

        translate([-insertSpacing/2-insertWidth/2, 0, insertHeight/2+thickness])
            cube([insertWidth, insertDepth, insertHeight+0.01], true);
    }
}

keycap([x, y, z], radius);