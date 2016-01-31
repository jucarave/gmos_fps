/*
 * scr_build_bullet_holes()
 *
 */
 
var vertices, tex_coords;

if (bullet_holes != -1){
    d3d_model_destroy(bullet_holes);
}

bullet_holes = d3d_model_create();

d3d_model_primitive_begin(bullet_holes, pr_trianglelist);

for (var i=0;i<decals_num;i++){
    var _x = decals[i, 0];
    var _y = decals[i, 1];
    var _z = decals[i, 2];
    var dir = decals[i, 3];
    var side = decals[i, 4];
    var s = 0.8;

    var gx = floor(_x / GRID_W) * GRID_W;
    var gy = floor(_y / GRID_W) * GRID_W;
    
    var ins_x_off = 0;
    var ins_y_off = 0;
    
    if (dir == 0 && side == 1){ ins_y_off = GRID_W; }
    if (dir == 1 && side == 1){ ins_x_off = GRID_W; }
    
    var block = scr_collision_box(gx-ins_x_off-0.5, gy-ins_y_off-0.5, _z-0.5, gx-ins_x_off+0.5, gy-ins_y_off+0.5, _z+0.5, false);
    var min_z = (block.z);
    var max_z = min_z + (block.height * GRID_W);
    
    var off = -0.1;
    if (side == 1) off = 0.1;
    
    var z1 = max(_z - s, min_z);
    var z2 = min(_z + s, max_z);
    var ty1 = (_z+s - z2) / (s * 2);
    var ty2 = (_z+s - z1) / (s * 2);
        
    if (dir == 0){
        var x1 = _x + s;
        var x2 = _x - s;
        
        var blockL = scr_collision_box(x1, _y-1, z1, x2, _y+1, z2, block);
        if (!blockL){
            x1 = min(x1, gx+GRID_W);
            x2 = max(x2, gx);
        }
        
        var tx1 = (_x+s - x1) / (s * 2);
        var tx2 = (_x+s - x2) / (s * 2);
        
        if (side == 1){
            var h = x2;
            x2 = x1;
            x1 = h;
            
            h = tx2;
            tx2 = tx1;
            tx1 = h;
        }
        
        d3d_model_vertex_texture(bullet_holes, x1, _y+off, z1, tx1, ty2);
        d3d_model_vertex_texture(bullet_holes, x1, _y+off, z2, tx1, ty1);
        d3d_model_vertex_texture(bullet_holes, x2, _y+off, z1, tx2, ty2);
        d3d_model_vertex_texture(bullet_holes, x1, _y+off, z2, tx1, ty1);
        d3d_model_vertex_texture(bullet_holes, x2, _y+off, z2, tx2, ty1);
        d3d_model_vertex_texture(bullet_holes, x2, _y+off, z1, tx2, ty2);
    }else if (dir == 1){
        var y1 = _y - s;
        var y2 = _y + s;
        
        var blockL = scr_collision_box(_x-1, y1, z1, _x+1, y2, z2, block);
        if (!blockL){
            y1 = max(y1, gy);
            y2 = min(y2, gy+GRID_W);
        }
        
        var tx1 = (y1 - (_y-s)) / (s * 2);
        var tx2 = (y2 - (_y-s)) / (s * 2);
        
        if (side == 1){
            var h = y2;
            y2 = y1;
            y1 = h;
            
            h = tx2;
            tx2 = tx1;
            tx1 = h;
        }
        
        
        d3d_model_vertex_texture(bullet_holes, _x+off, y1, z1, tx1, ty2);
        d3d_model_vertex_texture(bullet_holes, _x+off, y1, z2, tx1, ty1);
        d3d_model_vertex_texture(bullet_holes, _x+off, y2, z1, tx2, ty2);
        d3d_model_vertex_texture(bullet_holes, _x+off, y1, z2, tx1, ty1);
        d3d_model_vertex_texture(bullet_holes, _x+off, y2, z2, tx2, ty1);
        d3d_model_vertex_texture(bullet_holes, _x+off, y2, z1, tx2, ty2);
    }
}

d3d_model_primitive_end(bullet_holes);
