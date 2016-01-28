/*
 * fix_position(x, y)
 *
 * x: Posición X del cañon
 * y: Posición Y del cañon
 */

var cx = argument[0];
var cy = argument[1];

var ret; 

var deg = degtorad(direction);
var _cos = cos(deg);
var _sin = sin(deg);

ret[0] = x + cx * _cos + cy * _sin;
ret[1] = y + cy * _cos - cx * _sin;

return ret;
