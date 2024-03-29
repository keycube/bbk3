use <utils/cube_rounded.scad>
use <utils/mirror_copy.scad>
use <nutholder.scad>

x = 40;
y = 40;
z = 40;
radius = 1.5;
thickness = 1.2;
hole = 14;

module body(size, radius, thickness = 1.2, hole = 14) {
    width = size[0];
    depth = size[1];
    height = size[2];
    
    union() {
        difference() {
            cube_rounded([width, depth, height], true, radius);
            
            translate([0, 0, height/2])
                cube([width+0.1, depth+0.1, radius*2], true);
            
            translate([0, 0, thickness])
                cube([width-thickness*2, depth-thickness*2, height], true);
            
            cube([width+0.1, hole, hole], true);
            cube([hole, depth+0.1, hole], true);
            cube([hole, hole, height+0.1], true);
            
            translate([0, 0, height/2-radius])
                cube([width+0.1, depth+0.1, 2*1], true); // remove 1 mm
        }
        
        nh_radius = 1.15;
        nh_size = 4.5;
        nh_height = 2;
        mirror_copy([1, 0, 0])
            mirror_copy([0, 1, 0])
                translate([
                    width/-2+(nh_size+1.5)/2+thickness, 
                    depth/2-(nh_size+1.5)/2-thickness, 
                    height/2-radius-(nh_height+2)/2-2-0.1
                ]) // UPDATE here (bad const related to nutholder)
                    nutholder(nh_radius, nh_size, nh_height);
    }
}

body([x, y, z], radius, thickness, hole);