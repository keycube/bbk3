use <utils/cube_rounded.scad>

module battery() {
    cube_rounded([26.5, 20, 4], true, radius = 1);
}

battery();