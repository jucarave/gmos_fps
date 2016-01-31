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
var z = argument[2];
var left = argument[3];
var top = argument[4];
var _depth = argument[5];
var height = argument[6];
var _solid = argument[7];

var add = true;
var block_l = instance_position(xx - GRID_HW, yy + GRID_HW, obj_block);
if (block_l && block_l.z == z && block_l.height == height){
    if ((block_l.image_xscale == 1 && block_l.image_yscale == 1) || (block_l.image_xscale > 1 && block_l.image_yscale == 1)){
        add = false;
        block_l.image_xscale += 1;
    }
}

if (add){
    var block_t = instance_position(xx + GRID_HW, yy - GRID_HW, obj_block);
    if (block_t && block_t.z == z && block_t.height == height){
        if ((block_t.image_xscale == 1 && block_t.image_yscale == 1) || (block_t.image_yscale > 1 && block_t.image_xscale == 1)){
            add = false;
            block_t.image_yscale += 1;
        }
    }
}

if (add){
    var block = instance_create(xx, yy, obj_block);
    block.z = z;
    block.height = height;
    block.solid = _solid;
}

var walls = scr_get_tile_surrounds(_depth, xx, yy);
var tex = scr_get_wall_texture(left, top);

var wallModel = -1;
for (var i=0;i<obj_walls.walls_count;i++){
    if (obj_walls.walls[i, 0] == tex){
        wallModel = obj_walls.walls[i, 1];
        i = obj_walls.walls_count;
    }
}

if (wallModel == -1){
    wallModel = d3d_model_create();
    d3d_model_primitive_begin(wallModel, pr_trianglelist);
    
    obj_walls.walls[i, 0] = tex;
    obj_walls.walls[i, 1] = wallModel;
    
    obj_walls.walls_count += 1;
}

scr_create_wall(wallModel, GRID_W, xx + GRID_HW, yy + GRID_HW, z + GRID_HW, height, walls[0], walls[1], walls[2], walls[3]);
