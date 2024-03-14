use <utils/cube_rounded_side.scad>

module battery() {
    cube_rounded_side([4, 20, 26.5], true, 1);
}

battery();