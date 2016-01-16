/*
 * scr_move_to(direction, speed)
 *
 * argument[0]: direction
 * argument[1]: speed;
 */

var dir = argument[0];
var spd = argument[1];

var xTo = cos(degtorad(dir));
var yTo = sin(degtorad(dir));

var size = GRID_HW - 3;

var ofx = size;
var ofy = size;

if (xTo < 0) ofx = -size;
if (yTo < 0) ofy = -size;

var ins = scr_collision_box(x, y-size, z, (x+ofx)+(xTo*6), y+size, z+GRID_HW);
if (!ins){
    x += xTo * spd;
}

var ins = scr_collision_box(x-size, y, z, x+size, (y-ofy)-(yTo*6), z+GRID_HW);
if (!ins){
    y -= yTo * spd;
}
