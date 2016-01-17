/*
 * scr_parse_wall(x, y, z, tl, tt, depth, height, solid)
 *
 * argument[0]: X position of the block
 * argument[1]: Y Position of the block
 * argument[2]: Z position of the base of the block
 * argument[3]: Tile left position of the texture
 * argument[4]: Tile top position of the texture
 * argument[5]: Depth of the tile
 * argument[6]: Height in units
 * argument[7]: Is the wall solid
 */
 
var xx = argument[0];
var yy = argument[1];
var z = argument[2] + GRID_HW;
var left = argument[3];
var top = argument[4];
var _depth = argument[5];
var height = argument[6];
var _solid = argument[7];

var walls = scr_get_tile_surrounds(_depth, xx, yy);

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
