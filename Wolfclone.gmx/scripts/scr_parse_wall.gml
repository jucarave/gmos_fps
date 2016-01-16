/*
 * scr_parse_wall(tile, x, y, z, height, solid)
 *
 * argument[0]: Tile in a wall layer
 * argument[1]: X position of the block
 * argument[2]: Y Position of the block
 * argument[3]: Z position of the base of the block
 * argument[4]: Height in units
 * argument[5]: Is the wall solid
 */
 
var tile = argument[0];
var xx = argument[1];
var yy = argument[2];
var z = argument[3] + GRID_HW;
var height = argument[4];
var _solid = argument[5];

var left = tile_get_left(tile);
var top = tile_get_top(tile);

var walls = scr_get_tile_surrounds(1000000, xx, yy);

var block = instance_create(xx + GRID_HW, yy + GRID_HW, obj_block);
block.block = scr_get_3d_tile_by_walls(walls);
block.z = z;
block.height = height;
block.solid = _solid;
block.tex = scr_get_wall_texture(left, top);

with (block){
    var w = GRID_HW;
    var h = GRID_W * (height - 1);
    scr_subscribe_box_collision(x-w,y-w,z-w,x+w,y+w,z+w+h);
}
