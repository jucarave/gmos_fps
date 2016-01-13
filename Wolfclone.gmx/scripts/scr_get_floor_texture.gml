/*
 * scr_get_floor_texture(x, y)
 *
 * argument[0]: x position of the tile
 * argument[1]: y position of the tile
 */
 
var _x = argument[0];
var _y = argument[1];

var ind = TEX_FLOOR_EMPTY;

if (_x == 32 && _y ==  0){ ind = TEX_F_001; }else
if (_x ==  0 && _y == 32){ ind = TEX_F_002; }else
if (_x == 32 && _y == 32){ ind = TEX_F_003; }

return global._TEXTURES[ind];
