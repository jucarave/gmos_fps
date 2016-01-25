/*
 * scr_collision_line_box(solidIndex, x1, y1, z1, x2, y2, z2)
 *
 * argument[0]: Subscribed solid box index
 * argument[1]: Line x1 position
 * argument[2]: Line y1 position
 * argument[3]: Line z1 position
 * argument[4]: Line x2 position
 * argument[5]: Line y2 position
 * argument[6]: Line z2 position
 */
 
var ind = argument[0];
var x1 = argument[1];
var y1 = argument[2];
var z1 = argument[3];
var x2 = argument[4];
var y2 = argument[5];
var z2 = argument[6];
 
var s_x1 = obj_room_master.solids[ind, 1];
var s_y1 = obj_room_master.solids[ind, 2];
var s_z1 = obj_room_master.solids[ind, 3];
var s_x2 = obj_room_master.solids[ind, 4];
var s_y2 = obj_room_master.solids[ind, 5];
var s_z2 = obj_room_master.solids[ind, 6];

var ins = obj_room_master.solids[ind, 0];
var f_low = 0;
var f_high = 1;

var ret;
ret[0] = -1;
ret[1] = -1;

if (x2 == x1 && (x2 >= s_x2 || x2 < s_x1)){ return ret; }
if (y2 == y1 && (y2 >= s_y2 || y2 < s_y1)){ return ret; }
if (z2 == z1 && (z2 >= s_z2 || z2 < s_z1)){ return ret; }
if (!ins.solid){ return ret; }

if (x2 > x1){
    f_low = max(f_low, (s_x1 - x1)/(x2 - x1));
    f_high = min(f_high, (s_x2 - x1)/(x2 - x1));
}else if (x1 > x2){
    f_low = max(f_low, (x1 - s_x2)/(x1 - x2));
    f_high = min(f_high, (x1 - s_x1)/(x1 - x2));
}

if (y2 > y1){
    f_low = max(f_low, (s_y1 - y1)/(y2 - y1));
    f_high = min(f_high, (s_y2 - y1)/(y2 - y1));
}else if (y1 > y2){
    f_low = max(f_low, (y1 - s_y2)/(y1 - y2));
    f_high = min(f_high, (y1 - s_y1)/(y1 - y2));
}

if (z2 > z1){
    f_low = max(f_low, (s_z1 - z1)/(z2 - z1));
    f_high = min(f_high, (s_z2 - z1)/(z2 - z1));
}else if (z1 > z2){
    f_low = max(f_low, (z1 - s_z2)/(z1 - z2));
    f_high = min(f_high, (z1 - s_z1)/(z1 - z2));
}

if (f_high < f_low){ return ret; }

ret[0] = f_low;
ret[1] = f_high;

return ret;
