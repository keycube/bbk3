use <utils/mirror_copy.scad>

module switch() {
    union() {
        cube([9, 3.5, 3.5], true);
        translate([0, 0, 3.5/2+1.75/2])
            cube([1.5, 1.5, 1.75], true);
        
        mirror_copy([0, 1, 0])
            mirror_copy([1, 0, 0])
                translate([5.6/2-0.6/2, 3.5/2+0.2/2, -3])
                    cube([0.6, 0.2, 4], true);
    }
}

switch();