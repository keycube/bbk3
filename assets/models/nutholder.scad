module nutholder() {
    difference() {
        cube([6, 6, 1.75+2], center = true);

        rotate([0, 0, 45])
        union() {
            translate([4, 0, 0])
                cube([8, 4, 1.75], center = true);
            s = 4;
            inradius = (s/2)/(sqrt(3)/2);
            cylinder(r=inradius, h=1.75, $fn=6, center = true);
        }
        
        cylinder(r=1.05, h=10, $fn=200, center = true); 
    }
}

nutholder();