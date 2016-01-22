/*
 * scr_create_3d_tiles()
 */
 
var size = GRID_W;

global._WALLS[WALL_3D]  = scr_create_wall(size, true, true, true, true);
global._WALLS[WALL_TL]  = scr_create_wall(size, true, true, false, false);
global._WALLS[WALL_T]   = scr_create_wall(size, false, true, false, false);
global._WALLS[WALL_TR]  = scr_create_wall(size, false, true, true, false);
global._WALLS[WALL_R]   = scr_create_wall(size, false, false, true, false);
global._WALLS[WALL_BR]  = scr_create_wall(size, false, false, true, true);
global._WALLS[WALL_B]   = scr_create_wall(size, false, false, false, true);
global._WALLS[WALL_BL]  = scr_create_wall(size, true, false, false, true);
global._WALLS[WALL_L]   = scr_create_wall(size, true, false, false, false);
global._WALLS[WALL_LTB] = scr_create_wall(size, true, true, false, true);
global._WALLS[WALL_TRB] = scr_create_wall(size, false, true, true, true);
global._WALLS[WALL_LTR] = scr_create_wall(size, true, true, true, false);
global._WALLS[WALL_LRB] = scr_create_wall(size, true, false, true, true);
global._WALLS[WALL_TB]  = scr_create_wall(size, false, true, false, true);
global._WALLS[WALL_LR]  = scr_create_wall(size, true, false, true, false);

global._FLOOR = scr_create_floor(size);

global._CEIL = scr_create_ceil(size);

global._DOOR = scr_create_door(size, 4, size);

global._SKYBOX = scr_create_skybox();

global._HANDGUN = scr_load_obj_model("Models_3D\handGun.obj", WP_HGUN);
