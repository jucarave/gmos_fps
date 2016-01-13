/*
 * scr_create_floor(size)
 *
 * argument[0]: size
 */
 
var size = argument[0] / 2;

var model = d3d_model_create();

d3d_model_primitive_begin(model, pr_trianglelist);

d3d_model_vertex_texture(model, -size,  size, 0, 0, 1);
d3d_model_vertex_texture(model, -size, -size, 0, 0, 0);
d3d_model_vertex_texture(model,  size,  size, 0, 1, 1);
d3d_model_vertex_texture(model, -size, -size, 0, 0, 0);
d3d_model_vertex_texture(model,  size, -size, 0, 1, 0);
d3d_model_vertex_texture(model,  size,  size, 0, 1, 1);

d3d_model_primitive_end(model);

return model;
