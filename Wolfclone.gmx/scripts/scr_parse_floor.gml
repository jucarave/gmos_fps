/*
 * scr_parse_floor(tile, x, y, z, depth)
 *
 * argument[0]: Tile in a floor layer
 * argument[1]: X position of the floor
 * argument[2]: Y Position of the floor
 * argument[3]: Z position of the floor
 * argument[4]: Depth of the current layer
 */
 
var tile = argument[0];
var xx = argument[1];
var yy = argument[2];
var z = argument[3];
var _depth = argument[4];

var left = tile_get_left(tile);
var top = tile_get_top(tile);

var tex = scr_get_floor_texture(left, top);
var floorModel = -1;

for (var i=0;i<obj_floors.floors_count;i++){
    if (obj_floors.floors[i, 0] == tex){
        floorModel = obj_floors.floors[i, 1];
        i = obj_floors.floors_count;
    }
}

if (floorModel == -1){
    floorModel = d3d_model_create();
    d3d_model_primitive_begin(floorModel, pr_trianglelist);
    
    obj_floors.floors[obj_floors.floors_count, 0] = tex;
    obj_floors.floors[obj_floors.floors_count, 1] = floorModel;
    
    obj_floors.floors_count += 1;
}

scr_create_floor(floorModel, GRID_W, xx + GRID_HW, yy + GRID_HW, z);

ds_grid_set(obj_room_master.floor_z_grid, xx / GRID_W, yy / GRID_W, z);
