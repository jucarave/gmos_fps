/*
 * scr_create_skybox()
 * 
 */
 
var s = 2.0;

var ret;
var count = 0;

// Front face
var model = d3d_model_create();
d3d_model_primitive_begin(model, pr_trianglelist);
d3d_model_vertex_texture(model, -s,  s, -s, 0.0, 1.0);
d3d_model_vertex_texture(model,  s,  s, -s, 1.0, 1.0);
d3d_model_vertex_texture(model, -s,  s,  s, 0.0, 0.0);
d3d_model_vertex_texture(model, -s,  s,  s, 0.0, 0.0);
d3d_model_vertex_texture(model,  s,  s, -s, 1.0, 1.0);
d3d_model_vertex_texture(model,  s,  s,  s, 1.0, 0.0);
d3d_model_primitive_end(model);
ret[count++] = model;

// Back face
var model = d3d_model_create();
d3d_model_primitive_begin(model, pr_trianglelist);
d3d_model_vertex_texture(model, -s, -s, -s, 1.0, 1.0);
d3d_model_vertex_texture(model, -s, -s,  s, 1.0, 0.0);
d3d_model_vertex_texture(model,  s, -s, -s, 0.0, 1.0);
d3d_model_vertex_texture(model, -s, -s,  s, 1.0, 0.0);
d3d_model_vertex_texture(model,  s, -s,  s, 0.0, 0.0);
d3d_model_vertex_texture(model,  s, -s, -s, 0.0, 1.0);
d3d_model_primitive_end(model);
ret[count++] = model;

// Left face
var model = d3d_model_create();
d3d_model_primitive_begin(model, pr_trianglelist);
d3d_model_vertex_texture(model, -s, -s, -s, 0.0, 1.0);
d3d_model_vertex_texture(model, -s,  s, -s, 1.0, 1.0);
d3d_model_vertex_texture(model, -s, -s,  s, 0.0, 0.0);
d3d_model_vertex_texture(model, -s, -s,  s, 0.0, 0.0);
d3d_model_vertex_texture(model, -s,  s, -s, 1.0, 1.0);
d3d_model_vertex_texture(model, -s,  s,  s, 1.0, 0.0);
d3d_model_primitive_end(model);
ret[count++] = model;

// Right face
var model = d3d_model_create();
d3d_model_primitive_begin(model, pr_trianglelist);
d3d_model_vertex_texture(model,  s, -s, -s, 1.0, 1.0);
d3d_model_vertex_texture(model,  s, -s,  s, 1.0, 0.0);
d3d_model_vertex_texture(model,  s,  s, -s, 0.0, 1.0);
d3d_model_vertex_texture(model,  s, -s,  s, 1.0, 0.0);
d3d_model_vertex_texture(model,  s,  s,  s, 0.0, 0.0);
d3d_model_vertex_texture(model,  s,  s, -s, 0.0, 1.0);
d3d_model_primitive_end(model);
ret[count++] = model;

// Top face
var model = d3d_model_create();
d3d_model_primitive_begin(model, pr_trianglelist);
d3d_model_vertex_texture(model, -s,  s,  s, 0.0, 1.0);
d3d_model_vertex_texture(model,  s,  s,  s, 1.0, 1.0);
d3d_model_vertex_texture(model, -s, -s,  s, 0.0, 0.0);
d3d_model_vertex_texture(model, -s, -s,  s, 0.0, 0.0);
d3d_model_vertex_texture(model,  s,  s,  s, 1.0, 1.0);
d3d_model_vertex_texture(model,  s, -s,  s, 1.0, 0.0);
d3d_model_primitive_end(model);
ret[count++] = model;

// Bottom face
var model = d3d_model_create();
d3d_model_primitive_begin(model, pr_trianglelist);
d3d_model_vertex_texture(model, -s,  s, -s, 0.0, 1.0);
d3d_model_vertex_texture(model, -s, -s, -s, 0.0, 0.0);
d3d_model_vertex_texture(model,  s,  s, -s, 1.0, 1.0);
d3d_model_vertex_texture(model, -s, -s, -s, 0.0, 0.0);
d3d_model_vertex_texture(model,  s, -s, -s, 1.0, 0.0);
d3d_model_vertex_texture(model,  s,  s, -s, 1.0, 1.0);
d3d_model_primitive_end(model);
ret[count++] = model;

return ret;
