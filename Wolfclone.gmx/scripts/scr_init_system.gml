/*
 * scr_init_system()
 */

d3d_start();

d3d_set_culling(true);
d3d_set_fog(true, c_black, 100, 300);

texture_set_interpolation(false);

scr_create_3d_tiles();
scr_load_textures();

draw_set_color(c_white);
