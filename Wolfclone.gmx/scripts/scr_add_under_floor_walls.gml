/*
 * scr_add_under_floor_walls()
 */
 
var layer = false;
var len = instance_number(obj_layer_configuration);
for (var i=0;i<len;i++){
    var lay = instance_find(obj_layer_configuration, i);
    if (lay.type == "Floor"){
        layer = lay;
        i = len;
    }
}

var len = obj_floors.floors_count;
var _x, _y, _z;
for (var i=1;i<len;i++){
    _x = obj_floors.floors[i, 0];
    _y = obj_floors.floors[i, 1];
    _z = obj_floors.floors[i, 2];
    _depth = obj_floors.floors[i, 4];
    
    if (_z > 0){
        var sur = scr_get_next_lower_floor(floor(_x / GRID_W), floor(_y / GRID_W), _z);
        if (sur < _z){
            var wl = 0;
            var wt = 0;
            for (var j=0;j<layer.layers_count;j++){
                if (layer.layers[j, LY_DEPTH] == _depth){
                    wl = layer.layers[j, LY_WALL_L] * GRID_W;
                    wt = layer.layers[j, LY_WALL_T] * GRID_W;
                    j = layer.layers_count;
                }
            }
        
            var z_dist = ceil((_z - sur) / GRID_W) * GRID_W;
        
            var xx = _x - GRID_HW;
            var yy = _y - GRID_HW;
            var zz = _z - z_dist;
            scr_parse_wall(xx, yy, zz, wl, wt, 0, z_dist / GRID_W, true)
        }
    }
}
