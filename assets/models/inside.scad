use <utils/cube_rounded_side.scad>
use <utils/mirror_copy.scad>
use <battery.scad>
use <pcb_SeeedStudioXIAO.scad>
use <bottom.scad>

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
    translate([-1.25, 0, 3.75])
        cube([1, 18, 1.5], true);
    
    translate([2.75, 0, 3.75])
        cube([1, 18, 1.5], true);
    
    translate([0.75, 0, 5])
        cube([5, 20, 1], true);
    
    translate([0.75, 9.5, -4.5])
        cube([5, 1, 18], true);
    translate([0.75, -9.5, -4.5])
        cube([5, 1, 18], true);
}

module inside() {
    union() {
        difference() {
            cube_rounded_side([40, 40, 1], true, 1.5);
            
            mirror_copy([1, 0, 0])
                mirror_copy([0, 1, 0])
                    translate([20-1.2-3, 20-1.2-3, 0])
                        cylinder(h = 10, r = 1.1, $fn=200, center = true);
            
            //cube([5, 22, 2], true); // battery hole
            translate([0.75, 0, 0])
                cube([6, 18, 2], true); // pcb hole
        }
        
        //translate([0, 0, 14])
        //    color("red")
        //    battery_cover();
        translate([0, 0, 14])
            color("red")
            pcb_cover();
    }    
}

translate([0, 0, 0.5])
    inside();

width = 40;
depth = 40;
height = 2.5;
radius = 1.5;
innerRadius = 1.1;
outerRadius = 1.8;
spacing = 1.2+1.2;

//translate([0, 0, -0.0])
//rotate([0, 180, 0])
//bottom([width, depth, height], radius, innerRadius, outerRadius, spacing);

//translate([0, 0, 14.25])
//    battery();

translate([0, 0, 8.5])
rotate([0, 90, 0])
    pcb_seeedstudioxiao();