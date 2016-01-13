var model = d3d_model_create();

d3d_model_primitive_begin(model, pr_trianglelist);

// Front face
d3d_model_vertex_texture(model, -16,  16, -16, 0, 1);
d3d_model_vertex_texture(model, -16,  16,  16, 0, 0);
d3d_model_vertex_texture(model,  16,  16, -16, 1, 1);
d3d_model_vertex_texture(model, -16,  16,  16, 0, 0);
d3d_model_vertex_texture(model,  16,  16,  16, 1, 0);
d3d_model_vertex_texture(model,  16,  16, -16, 1, 1);

// Back face
d3d_model_vertex_texture(model, -16, -16, -16, 1, 1);
d3d_model_vertex_texture(model,  16, -16, -16, 0, 1);
d3d_model_vertex_texture(model, -16, -16,  16, 1, 0);
d3d_model_vertex_texture(model, -16, -16,  16, 1, 0);
d3d_model_vertex_texture(model,  16, -16, -16, 0, 1);
d3d_model_vertex_texture(model,  16, -16,  16, 0, 0);

// Left face
d3d_model_vertex_texture(model, -16, -16, -16, 0, 1);
d3d_model_vertex_texture(model, -16, -16,  16, 0, 0);
d3d_model_vertex_texture(model, -16,  16, -16, 1, 1);
d3d_model_vertex_texture(model, -16, -16,  16, 0, 0);
d3d_model_vertex_texture(model, -16,  16,  16, 1, 0);
d3d_model_vertex_texture(model, -16,  16, -16, 1, 1);

// Right face
d3d_model_vertex_texture(model,  16, -16, -16, 1, 1);
d3d_model_vertex_texture(model,  16,  16, -16, 0, 1);
d3d_model_vertex_texture(model,  16, -16,  16, 1, 0);
d3d_model_vertex_texture(model,  16, -16,  16, 1, 0);
d3d_model_vertex_texture(model,  16,  16, -16, 0, 1);
d3d_model_vertex_texture(model,  16,  16,  16, 0, 0);

d3d_model_primitive_end(model);

return model;
