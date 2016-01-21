/*
 * scr_mix(x, y, a)
 *
 * argument[0]: Start point of the mix
 * argument[1]: Destination point of the mix
 * argument[2]: Progress of the mix
 */
 
var _x = argument[0];
var _y = argument[1];
var _a = argument[2];

return _x * (1 - _a) + _y * _a;
