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
    
    var off = -0.1;
    if (side == 1) off = 0.1;
        
    if (dir == 0){
        d3d_model_vertex_texture(bullet_holes, _x+1, _y+off, _z-1, 0, 1);
        d3d_model_vertex_texture(bullet_holes, _x+1, _y+off, _z+1, 0, 0);
        d3d_model_vertex_texture(bullet_holes, _x-1, _y+off, _z-1, 1, 1);
        d3d_model_vertex_texture(bullet_holes, _x+1, _y+off, _z+1, 0, 0);
        d3d_model_vertex_texture(bullet_holes, _x-1, _y+off, _z+1, 1, 0);
        d3d_model_vertex_texture(bullet_holes, _x-1, _y+off, _z-1, 1, 1);
    }else if (dir == 1){
        d3d_model_vertex_texture(bullet_holes, _x+off, _y-1, _z-1, 0, 1);
        d3d_model_vertex_texture(bullet_holes, _x+off, _y-1, _z+1, 0, 0);
        d3d_model_vertex_texture(bullet_holes, _x+off, _y+1, _z-1, 1, 1);
        d3d_model_vertex_texture(bullet_holes, _x+off, _y-1, _z+1, 0, 0);
        d3d_model_vertex_texture(bullet_holes, _x+off, _y+1, _z+1, 1, 0);
        d3d_model_vertex_texture(bullet_holes, _x+off, _y+1, _z-1, 1, 1);
    }
}

d3d_model_primitive_end(bullet_holes);
