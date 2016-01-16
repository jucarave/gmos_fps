/*
 * scr_parse_ceil(tile, x, y, z)
 *
 * argument[0]: Tile in a ceil layer
 * argument[1]: X position of the ceil
 * argument[2]: Y Position of the ceil
 * argument[3]: Z position of the ceil
 */
 
var tile = argument[0];
var xx = argument[1];
var yy = argument[2];
var z = argument[3];

var left = tile_get_left(tile);
var top = tile_get_top(tile);

obj_floors.ceils[obj_floors.ceils_count, 0] = xx + GRID_HW;
obj_floors.ceils[obj_floors.ceils_count, 1] = yy + GRID_HW;
obj_floors.ceils[obj_floors.ceils_count, 2] = z;
obj_floors.ceils[obj_floors.ceils_count, 3] = scr_get_ceil_texture(left, top);

obj_floors.ceils_count += 1;

ds_grid_set(obj_room_master.ceil_z_grid, xx / GRID_W, yy / GRID_W, z);
