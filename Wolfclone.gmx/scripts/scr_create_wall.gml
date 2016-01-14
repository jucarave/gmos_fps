/*
 * scr_create_wall(size, left, top, right, bottom)
 *
 * argument[0]: Size of the cube (widht, height, length)
 * argument[1]: Include left wall (-x)
 * arugment[2]: Include top wall (-y)
 * argument[3]: Include right wall (+x)
 * argument[4]: Include bottom wall (+y)
 */

var size = argument[0] / 2;
var lw = argument[1];
var tw = argument[2];
var rw = argument[3];
var bw = argument[4];

var model = d3d_model_create();

d3d_model_primitive_begin(model, pr_trianglelist);

// Front face
if (bw){
    d3d_model_vertex_texture(model, -size,  size, -size, 0, 1);
    d3d_model_vertex_texture(model, -size,  size,  size, 0, 0);
    d3d_model_vertex_texture(model,  size,  size, -size, 1, 1);
    d3d_model_vertex_texture(model, -size,  size,  size, 0, 0);
    d3d_model_vertex_texture(model,  size,  size,  size, 1, 0);
    d3d_model_vertex_texture(model,  size,  size, -size, 1, 1);
}

// Back face
if (tw){
    d3d_model_vertex_texture(model, -size, -size, -size, 1, 1);
    d3d_model_vertex_texture(model,  size, -size, -size, 0, 1);
    d3d_model_vertex_texture(model, -size, -size,  size, 1, 0);
    d3d_model_vertex_texture(model, -size, -size,  size, 1, 0);
    d3d_model_vertex_texture(model,  size, -size, -size, 0, 1);
    d3d_model_vertex_texture(model,  size, -size,  size, 0, 0);
}

// Left face
if (lw){
    d3d_model_vertex_texture(model, -size, -size, -size, 0, 1);
    d3d_model_vertex_texture(model, -size, -size,  size, 0, 0);
    d3d_model_vertex_texture(model, -size,  size, -size, 1, 1);
    d3d_model_vertex_texture(model, -size, -size,  size, 0, 0);
    d3d_model_vertex_texture(model, -size,  size,  size, 1, 0);
    d3d_model_vertex_texture(model, -size,  size, -size, 1, 1);
}

// Right face
if (rw){
    d3d_model_vertex_texture(model,  size, -size, -size, 1, 1);
    d3d_model_vertex_texture(model,  size,  size, -size, 0, 1);
    d3d_model_vertex_texture(model,  size, -size,  size, 1, 0);
    d3d_model_vertex_texture(model,  size, -size,  size, 1, 0);
    d3d_model_vertex_texture(model,  size,  size, -size, 0, 1);
    d3d_model_vertex_texture(model,  size,  size,  size, 0, 0);
}

d3d_model_primitive_end(model);

return model;
