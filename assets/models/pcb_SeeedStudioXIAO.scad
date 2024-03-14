module pcb_seeedstudioxiao() {
    union() {
        cube([20, 17.5, 1], true);
    
        translate([-4.75+2.5, 0, 1.5])
        cube([10.5, 10.5, 2], true);
        
        translate([8, 0, 2])
            cube([6, 7.5, 3], true);
    }
}

pcb_seeedstudioxiao();