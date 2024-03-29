radius = 1.15;
height = 2;
size = 4.5;

module nutholder(radius, size, height) {
    difference() {
        cube([size+1.5, size+1.5, height+2], center = true);

        rotate([0, 0, -45])
        union() {
            translate([size, 0, 0])
                cube([size*2, size, height], center = true);
            inradius = (size/2)/(sqrt(3)/2);
            cylinder(r=inradius, h=height, $fn=6, center = true);
        }
        
        cylinder(r=radius, h=height+3, $fn=200, center = true);
    }
}

nutholder(radius, size, height);