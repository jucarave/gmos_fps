/*
 * scr_get_next_lower_floor(x, y, z)
 *
 * argument[0]: X grid position of the current floor
 * argument[1]: Y grid position of the current floor
 * argument[2]: Z grid position of the current floor
 */

var xx = argument[0];
var yy = argument[1];
var z = argument[2];

var z_floor = ds_grid_get(obj_room_master.floor_z_grid, xx - 1, yy);
if (z_floor < z){ return z_floor; }

z_floor = ds_grid_get(obj_room_master.floor_z_grid, xx, yy - 1);
if (z_floor < z){ return z_floor; }

z_floor = ds_grid_get(obj_room_master.floor_z_grid, xx + 1, yy);
if (z_floor < z){ return z_floor; }

z_floor = ds_grid_get(obj_room_master.floor_z_grid, xx, yy + 1);
if (z_floor < z){ return z_floor; }

return z;
