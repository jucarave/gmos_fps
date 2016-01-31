/*
 * scr_create_3d_tiles()
 */
 
var size = GRID_W;

global._DOOR = scr_create_door(size, 4, size);

global._SKYBOX = scr_create_skybox();

global._HANDGUN = scr_load_obj_model("Models_3D\handGun.obj", WP_HGUN);

