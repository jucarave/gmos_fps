/*
 * scr_create_wall(model, size, x, y, z, height, left, top, right, bottom)
 *
 * argument[0]: Model to add the vertices
 * argument[1]: Size of the cube (widht, height, length)
 * argument[2]: X position of the wall
 * argument[3]: Y position of the wall
 * argument[4]: Z Position of the wall
 * argument[5]: Height of the wall
 * argument[5]: Include left wall (-x)
 * arugment[6]: Include top wall (-y)
 * argument[7]: Include right wall (+x)
 * argument[8]: Include bottom wall (+y)
 */

var model = argument[0];
var size = argument[1] / 2;
var _x = argument[2];
var _y = argument[3];
var _z = argument[4];
var h = (argument[5] - 1) * argument[1];
var lw = argument[6];
var tw = argument[7];
var rw = argument[8];
var bw = argument[9];

var ty = argument[5];

// Front face
if (bw){
    d3d_model_vertex_texture(model, _x-size, _y+size, _z-size,   0, ty);
    d3d_model_vertex_texture(model, _x-size, _y+size, _z+size+h, 0, 0);
    d3d_model_vertex_texture(model, _x+size, _y+size, _z-size,   1, ty);
    d3d_model_vertex_texture(model, _x-size, _y+size, _z+size+h, 0, 0);
    d3d_model_vertex_texture(model, _x+size, _y+size, _z+size+h, 1, 0);
    d3d_model_vertex_texture(model, _x+size, _y+size, _z-size,   1, ty);
}

// Back face
if (tw){
    d3d_model_vertex_texture(model, _x-size, _y-size, _z-size,   1, ty);
    d3d_model_vertex_texture(model, _x+size, _y-size, _z-size,   0, ty);
    d3d_model_vertex_texture(model, _x-size, _y-size, _z+size+h, 1, 0);
    d3d_model_vertex_texture(model, _x-size, _y-size, _z+size+h, 1, 0);
    d3d_model_vertex_texture(model, _x+size, _y-size, _z-size,   0, ty);
    d3d_model_vertex_texture(model, _x+size, _y-size, _z+size+h, 0, 0);
}

// Left face
if (lw){
    d3d_model_vertex_texture(model, _x-size, _y-size, _z-size,   0, ty);
    d3d_model_vertex_texture(model, _x-size, _y-size, _z+size+h, 0, 0);
    d3d_model_vertex_texture(model, _x-size, _y+size, _z-size,   1, ty);
    d3d_model_vertex_texture(model, _x-size, _y-size, _z+size+h, 0, 0);
    d3d_model_vertex_texture(model, _x-size, _y+size, _z+size+h, 1, 0);
    d3d_model_vertex_texture(model, _x-size, _y+size, _z-size,   1, ty);
}

// Right face
if (rw){
    d3d_model_vertex_texture(model, _x+size, _y-size, _z-size,   1, ty);
    d3d_model_vertex_texture(model, _x+size, _y+size, _z-size,   0, ty);
    d3d_model_vertex_texture(model, _x+size, _y-size, _z+size+h, 1, 0);
    d3d_model_vertex_texture(model, _x+size, _y-size, _z+size+h, 1, 0);
    d3d_model_vertex_texture(model, _x+size, _y+size, _z-size,   0, ty);
    d3d_model_vertex_texture(model, _x+size, _y+size, _z+size+h, 0, 0);
}
