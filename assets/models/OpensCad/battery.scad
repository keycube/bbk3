use <utils/cube_rounded_side.scad>

module battery() {
    cube_rounded_side([4, 20, 28], true, 1);
}

battery();