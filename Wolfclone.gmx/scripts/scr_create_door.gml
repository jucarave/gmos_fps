/*
 * scr_create_door(width, length, height)
 * 
 * argument[0]: width of the box,
 * argument[1]: length of the box,
 * argument[2]: height of the box
 */
 
var w = argument[0] / 2;
var l = argument[1] / 2;
var h = argument[2] / 2;

var model = d3d_model_create();

d3d_model_primitive_begin(model, pr_trianglelist);

// Front face
d3d_model_vertex_texture(model, -w,  l, -h, 0.0, 1.0);
d3d_model_vertex_texture(model, -w,  l,  h, 0.0, 0.0);
d3d_model_vertex_texture(model,  w,  l, -h, 0.5, 1.0);
d3d_model_vertex_texture(model, -w,  l,  h, 0.0, 0.0);
d3d_model_vertex_texture(model,  w,  l,  h, 0.5, 0.0);
d3d_model_vertex_texture(model,  w,  l, -h, 0.5, 1.0);

// Back face
d3d_model_vertex_texture(model, -w, -l, -h, 0.5, 1.0);
d3d_model_vertex_texture(model,  w, -l, -h, 0.0, 1.0);
d3d_model_vertex_texture(model, -w, -l,  h, 0.5, 0.0);
d3d_model_vertex_texture(model, -w, -l,  h, 0.5, 0.0);
d3d_model_vertex_texture(model,  w, -l, -h, 0.0, 1.0);
d3d_model_vertex_texture(model,  w, -l,  h, 0.0, 0.0);

// Left face
d3d_model_vertex_texture(model, -w, -l, -h, 0.50, 1.0);
d3d_model_vertex_texture(model, -w, -l,  h, 0.50, 0.0);
d3d_model_vertex_texture(model, -w,  l, -h, 0.57, 1.0);
d3d_model_vertex_texture(model, -w, -l,  h, 0.50, 0.0);
d3d_model_vertex_texture(model, -w,  l,  h, 0.57, 0.0);
d3d_model_vertex_texture(model, -w,  l, -h, 0.57, 1.0);

// Right face
d3d_model_vertex_texture(model,  w, -l, -h, 0.57, 1.0);
d3d_model_vertex_texture(model,  w,  l, -h, 0.50, 1.0);
d3d_model_vertex_texture(model,  w, -l,  h, 0.57, 0.0);
d3d_model_vertex_texture(model,  w, -l,  h, 0.57, 0.0);
d3d_model_vertex_texture(model,  w,  l, -h, 0.50, 1.0);
d3d_model_vertex_texture(model,  w,  l,  h, 0.50, 0.0);

// Top face
d3d_model_vertex_texture(model, -w,  l,  h, 0.50, 1.0);
d3d_model_vertex_texture(model, -w, -l,  h, 0.50, 0.0);
d3d_model_vertex_texture(model,  w,  l,  h, 0.57, 1.0);
d3d_model_vertex_texture(model, -w, -l,  h, 0.50, 0.0);
d3d_model_vertex_texture(model,  w, -l,  h, 0.57, 0.0);
d3d_model_vertex_texture(model,  w,  l,  h, 0.57, 1.0);

// Bottom face
d3d_model_vertex_texture(model, -w,  l, -h, 0.50, 1.0);
d3d_model_vertex_texture(model,  w,  l, -h, 0.57, 1.0);
d3d_model_vertex_texture(model, -w, -l, -h, 0.50, 0.0);
d3d_model_vertex_texture(model, -w, -l, -h, 0.50, 0.0);
d3d_model_vertex_texture(model,  w,  l, -h, 0.57, 1.0);
d3d_model_vertex_texture(model,  w, -l, -h, 0.57, 0.0);

d3d_model_primitive_end(model);

return model;
