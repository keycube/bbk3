use <body.scad>
use <bottom.scad>

x = 40;
y = 40;
z = 40;
radius = 1.5;
thickness = 1.2;
hole = 14;

innerRadius = 1.1;
outerRadius = 1.8;
spacing = 1.2+1.2; // thickness + (3 - outerRadius)

body([x, y, z], radius, thickness, hole);
translate([0, 0, 20-2.5])
    bottom([x, y, 2.5], radius, innerRadius, outerRadius, spacing);