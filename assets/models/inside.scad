use <utils/mirror_copy.scad>
use <battery.scad>
use <pcb_SeeedStudioXIAO.scad>
use <bottom.scad>
use <switch.scad>
use <body.scad>


module battery_cover() {
    mirror_copy([0, 1, 0])
        translate([0, 8, 0])
            union() {
                translate([-3, 0, 0])
                    cube([1, 6, 27], true);
                translate([3, 0, 0])
                    cube([1, 6, 27], true);
                translate([0, 0, 14])
                    cube([7, 6, 1], true);
                translate([0, 3.5, 0.5])
                    cube([7, 1, 7], true);
            }
}

module pcb_cover() {
    translate([-1.25, 0, 5.25]) // top side
        cube([1, 19, 1.5], true);
    translate([2.75, 0, 5.25]) // top side
        cube([1, 19, 1.5], true);
    
    translate([0.75, 0, 7]) // top flat
        cube([5, 22, 2], true);
    
    translate([0.75, 10.25, -3.75]) // side
        cube([5, 1.5, 19.5], true);
    translate([0.75, -10.25, -3.75]) // side
        cube([5, 1.5, 19.5], true);
}

module switch_cover() {
    mirror_copy([0, 1, 0])
        translate([0, 5.5, 0.25])
            cube([2.5, 1.5, 3.5], true);
    translate([0, 0, 1.25])
        cube([2.5, 11, 1.5], true);
}

module inside() {
    union() {
        difference() {
            cube([40-1.3*2, 40-1.3*2, 1], true);
            
            // screw hole
            mirror_copy([1, 0, 0])
                mirror_copy([0, 1, 0])
                    translate([20-1.2-3, 20-1.2-3, 0])
                        cylinder(h = 10, r = 1.15, $fn=100, center = true);

            // battery hole
            translate([5.5, 0, 0])
                cube([5, 22, 2], true); 
            
            // pcb hole
            translate([-1.5, 0, 0])
                cube([7, 19, 2], true); 
            translate([1, 0, 0])
                cube([6, 10, 2], true);
            
            // switch hole
            translate([-8, 0, 0])
            cube([4, 9.5, 2], true);
        }
        
        // battery cover
        translate([5.5, 0, 14])
            color("red")
            battery_cover();
        
        // pcb cover
        translate([-1.25, 0, 14])
            color("red")
            pcb_cover();
        
        // switch cover
        translate([-8, 0, 2])
            color("red")
            switch_cover();
    }    
}

translate([0, 0, 0.5])
    inside();

/*
width = 40;
depth = 40;
height = 2.5;
radius = 1.5;
innerRadius = 1.1;
outerRadius = 1.8;
spacing = 1.2+3;

translate([0, 0, -0.0])
rotate([0, 180, 0])
bottom([width, depth, height], radius, innerRadius, outerRadius, spacing);


translate([5.5, 0, 14])
    color("yellow")
        battery();

translate([-1.25, 0, 8.5])
    rotate([0, 90, 0])
        color("yellow")
            pcb_seeedstudioxiao();

translate([-8, 0, 1])
    rotate([180, 0, 90])
        color("yellow")
            switch();
    
x = 40;
y = 40;
z = 40;
thickness = 1.2;
hole = 14;
translate([0, 0, (40-5)/2+0])
rotate([0, 180, 0])
body([x, y, z], radius, thickness, hole);
*/