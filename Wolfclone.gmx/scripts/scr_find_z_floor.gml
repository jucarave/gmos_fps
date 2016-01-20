/*
 * scr_find_z_floor()
 */

var pairs; 
var size = 8;

pairs[0, 0] = floor((x-size) / GRID_W);
pairs[0, 1] = floor((y-size) / GRID_W);

pairs[1, 0] = floor((x+size) / GRID_W);
pairs[1, 1] = floor((y-size) / GRID_W);

pairs[2, 0] = floor((x-size) / GRID_W);
pairs[2, 1] = floor((y+size) / GRID_W);

pairs[3, 0] = floor((x+size) / GRID_W);
pairs[3, 1] = floor((y+size) / GRID_W);

var ret = 0;
for (var i=0;i<4;i++){
    var zt = ds_grid_get(obj_room_master.floor_z_grid, pairs[i, 0], pairs[i, 1]);
    if ((zt - z <= 5 && zt >= z) || (zt < z)){
        ret = max(ret, zt);
    }
}

return ret;
