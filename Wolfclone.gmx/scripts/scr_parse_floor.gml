/*
 * scr_parse_floor(tile, x, y, z)
 *
 * argument[0]: Tile in a floor layer
 * argument[1]: X position of the floor
 * argument[2]: Y Position of the floor
 * argument[3]: Z position of the floor
 */
 
var tile = argument[0];
var xx = argument[1];
var yy = argument[2];
var z = argument[3];

var left = tile_get_left(tile);
var top = tile_get_top(tile);

obj_floors.floors[obj_floors.floors_count, 0] = xx + GRID_HW;
obj_floors.floors[obj_floors.floors_count, 1] = yy + GRID_HW;
obj_floors.floors[obj_floors.floors_count, 2] = 0;
obj_floors.floors[obj_floors.floors_count, 3] = scr_get_floor_texture(left, top);

obj_floors.floors_count += 1;
