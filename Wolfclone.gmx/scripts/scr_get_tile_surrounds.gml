/*
 * scr_get_tile_surrounds(depth, x, y);
 *
 * argument[0]: Depth of the tileset
 * argument[1]: x position of the tile
 * argument[2]: y position of the tile
 */

var ret;

var _depth = argument[0];
var _x = argument[1];
var _y = argument[2];

ret[0] = false;
ret[1] = false;
ret[2] = false;
ret[3] = false;

if (_x > 0){
    var tile = tile_layer_find(_depth, _x - GRID_W, _y);
    if (tile == -1) ret[0] = true;
}

if (_y > 0){
    var tile = tile_layer_find(_depth, _x, _y - GRID_W);
    if (tile == -1) ret[1] = true;
}

if (_x < room_width - GRID_W){
    var tile = tile_layer_find(_depth, _x + GRID_W, _y);
    if (tile == -1) ret[2] = true;
}

if (_y < room_height - GRID_W){
    var tile = tile_layer_find(_depth, _x, _y + GRID_W);
    if (tile == -1) ret[3] = true;
}

return ret;
