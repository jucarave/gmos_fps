/*
 * scr_get_input_direction()
 */

var hor = (keyboard_check(ord('D')) - keyboard_check(ord('A')));
var ver = (keyboard_check(ord('W')) - keyboard_check(ord('S')));

var dir = -1;

if (hor != 0 || ver != 0){ dir = direction; }
if (ver < 0){ dir += 180; }
if (hor > 0){ dir = direction - 90; }
else if (hor < 0){ dir = direction + 90; }

if (hor != 0){
    if (ver > 0 && hor > 0) dir = direction - 45; else
    if (ver > 0 && hor < 0) dir = direction + 45; else
    if (ver < 0 && hor > 0) dir = direction - 135; else
    if (ver < 0 && hor < 0) dir = direction + 135;
}

return dir;
