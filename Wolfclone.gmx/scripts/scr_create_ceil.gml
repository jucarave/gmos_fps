/*
 * scr_create_ceil(model, size, x, y, z)
 *
 * argument[0]: Model to set the vertices
 * argument[1]: size
 * argument[2]: X position of the tile
 * argument[3]: Y position of the tile
 * argument[4]: Z position of the tile
 */

var model = argument[0]; 
var size = argument[1] / 2;
var _x = argument[2];
var _y = argument[3];
var _z = argument[4];

d3d_model_vertex_texture(model, _x-size, _y-size, _z, 0, 1);
d3d_model_vertex_texture(model, _x-size, _y+size, _z, 0, 0);
d3d_model_vertex_texture(model, _x+size, _y-size, _z, 1, 1);
d3d_model_vertex_texture(model, _x-size, _y+size, _z, 0, 0);
d3d_model_vertex_texture(model, _x+size, _y+size, _z, 1, 0);
d3d_model_vertex_texture(model, _x+size, _y-size, _z, 1, 1);
