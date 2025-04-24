centered = false;
x = 5.5;
y = 5.5;
z = 5.5;
radius = 0.5;


// More information: https://danielupshaw.com/openscad-rounded-corners/
module cube_rounded(size = [1, 1, 1], center = false, radius = 0.5) {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate = (center == false) ?
		[radius, radius, radius] :
		[
			radius - (size[0] / 2),
			radius - (size[1] / 2),
			radius - (size[2] / 2)
	];

	translate(v = translate)
	minkowski() {
		cube(size = [
			size[0] - (radius * 2),
			size[1] - (radius * 2),
			size[2] - (radius * 2)
		]);
		sphere(r = radius);
	}
}

// Example
cube_rounded([x, y, z], centered, radius);
$fa = 1;
$fs = 0.1;