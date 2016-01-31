/*
 * scr_get_3d_tile_by_walls(walls)
 *
 * argument[0]: walls array
 */
 
var w = argument[0];
var tileId = -1;

if (w[0] && w[1] && w[2] && w[3]){ tileId = WALL_3D; }else
if (w[0] && w[1] && !w[2] && !w[3]){ tileId = WALL_TL; }else
if (!w[0] && w[1] && !w[2] && !w[3]){ tileId = WALL_T; }else
if (!w[0] && w[1] && w[2] && !w[3]){ tileId = WALL_TR; }else
if (!w[0] && !w[1] && w[2] && !w[3]){ tileId = WALL_R; }else
if (!w[0] && !w[1] && w[2] && w[3]){ tileId = WALL_BR; }else
if (!w[0] && !w[1] && !w[2] && w[3]){ tileId = WALL_B; }else
if (w[0] && !w[1] && !w[2] && w[3]){ tileId = WALL_BL; }else
if (w[0] && !w[1] && !w[2] && !w[3]){ tileId = WALL_L; }else
if (w[0] && w[1] && w[2] && !w[3]){ tileId = WALL_LTR; }else
if (w[0] && !w[1] && w[2] && w[3]){ tileId = WALL_LRB; }else
if (w[0] && w[1] && !w[2] && w[3]){ tileId = WALL_LTB; }else
if (!w[0] && w[1] && w[2] && w[3]){ tileId = WALL_TRB; }else
if (!w[0] && w[1] && !w[2] && w[3]){ tileId = WALL_TB; }else
if (w[0] && !w[1] && w[2] && !w[3]){ tileId = WALL_LR; }

if (tileId == -1) return tileId;

return global._WALLS[tileId];
