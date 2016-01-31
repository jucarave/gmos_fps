/*
 * scr_add_under_floor_walls(z,  depth)
 *
 * argument[0]: Z position of the floors
 * argument[1]: Depth of the layer
 */
 
var _z = argument[0];
var _depth = argument[1]; 

var grid = obj_room_master.floor_z_grid;
var w = ds_grid_width(grid);
var h = ds_grid_height(grid);

var layer = false;
var len = instance_number(obj_layer_configuration);
for (var i=0;i<len;i++){
    var lay = instance_find(obj_layer_configuration, i);
    if (lay.type == "Floor"){
        layer = lay;
        i = len;
    }
}

for (var _x=0;_x<w;_x++){
    for (var _y=0;_y<h;_y++){
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
                
                if (found)
                    scr_parse_wall(xx, yy, zz, wl, wt, 0, z_dist / GRID_W, true);
            }
        }
    }
}
