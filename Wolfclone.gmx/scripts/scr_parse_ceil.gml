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

var tex = scr_get_ceil_texture(left, top);
var ceilModel = -1;

for (var i=0;i<obj_floors.ceils_count;i++){
    if (obj_floors.ceils[i, 0] == tex){
        ceilModel = obj_floors.ceils[i, 1];
    }
}

if (ceilModel == -1){
    ceilModel = d3d_model_create();
    d3d_model_primitive_begin(ceilModel, pr_trianglelist);

    obj_floors.ceils[obj_floors.ceils_count, 0] = tex;
    obj_floors.ceils[obj_floors.ceils_count, 1] = ceilModel;
    
    obj_floors.ceils_count += 1;
}

scr_create_ceil(ceilModel, GRID_W, xx + GRID_HW, yy + GRID_HW, z);

ds_grid_set(obj_room_master.ceil_z_grid, xx / GRID_W, yy / GRID_W, z);
