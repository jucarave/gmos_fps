/*
 * scr_add_under_floor_walls(x, y, z,  depth)
 *
 * argument[0]: X position of the floor
 * argument[1]: Y position of the floor
 * argument[2]: Z position of the floor
 * argument[3]: Current layer
 * argument[4]: Depth of the layer
 */

var _x = argument[0] / GRID_W; 
var _y = argument[1] / GRID_W;
var _z = argument[2];
var layer = argument[3];
var _depth = argument[4]; 

var grid = obj_room_master.floor_z_grid;

var z = ds_grid_get(grid, _x, _y);

if (z == _z){
    var sur = scr_get_next_lower_floor(_x, _y, z);
    if (sur < z){
        var z_dist = ceil((z - sur) / GRID_W) * GRID_W;
        
        var xx = _x * GRID_W;
        var yy = _y * GRID_W;
        var zz = z - z_dist;
        
        var wl = 0;
        var wt = 0;
        var found = false;
        for (var j=0;j<layer.layers_count;j++){
            if (layer.layers[j, LY_DEPTH] == _depth){
                wl = layer.layers[j, LY_WALL_L] * GRID_W;
                wt = layer.layers[j, LY_WALL_T] * GRID_W;
                found = true;
                j = layer.layers_count;
            }
        }
        
        if (found){
            show_debug_message("x: " + string(xx) + ", y: " + string(yy) + ", z: " + string(zz)) ;
            scr_parse_wall(xx, yy, zz, wl, wt, 0, z_dist / GRID_W, true);
        }
    }
}
