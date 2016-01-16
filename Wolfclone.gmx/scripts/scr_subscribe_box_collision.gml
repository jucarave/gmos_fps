/*
 * scr_subscribe_box_collision(x1, y1, z1, x2, y2, z2)
 * 
 * argument[0]: x1 position of the box
 * argument[1]: y1 position of the box
 * argument[2]: z1 position of the box
 * argument[3]: x2 position of the box
 * argument[4]: y2 position of the box
 * argument[5]: z2 position of the box
 */

var x1 = argument[0];
var y1 = argument[1];
var z1 = argument[2];
var x2 = argument[3];
var y2 = argument[4];
var z2 = argument[5];

var c = obj_room_master.solids_count++;
obj_room_master.solids[c, 0] = id;
obj_room_master.solids[c, 1] = x1;
obj_room_master.solids[c, 2] = y1;
obj_room_master.solids[c, 3] = z1;
obj_room_master.solids[c, 4] = x2;
obj_room_master.solids[c, 5] = y2;
obj_room_master.solids[c, 6] = z2;
