use <utils/cube_rounded_side.scad>
use <utils/mirror_copy.scad>
use <battery.scad>

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

module inside() {
    union() {
        difference() {
            cube_rounded_side([40, 40, 1], true, 1.5);
            
            mirror_copy([1, 0, 0])
                mirror_copy([0, 1, 0])
                    translate([20-1.2-3, 20-1.2-3, 0])
                        cylinder(h = 10, r = 1.1, $fn=200, center = true);
            
            cube([5, 22, 2], true); // battery hole
        }
        
        translate([0, 0, 14])
            color("red")
            battery_cover();        
    }    
}

translate([0, 0, 0.5])
    inside();

translate([0, 0, 14.25])
    battery();