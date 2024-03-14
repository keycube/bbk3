use <utils/cube_rounded_side.scad>

module pcb_seeedstudioxiao() {
    union() {
        cube_rounded_side([20, 17.5, 1], true, 1.5);
    
        translate([-4.75+2.5, 0, 1.5])
        cube([10.5, 10.5, 2], true);
        
        translate([8, 0, 2])
        rotate([0, 90, 0])
            cube_rounded_side([3, 7.5, 6], true, 1.25);
    }
}

pcb_seeedstudioxiao();