/*
 * scr_collision_box(x1, y1, z1, x2, y2, z2, notId)
 *
 * argument[0]: x1 position of the box
 * argument[1]: y1 position of the box
 * argument[2]: z1 position of the box
 * argument[3]: x2 position of the box
 * argument[4]: y2 position of the box
 * argument[5]: z2 position of the box
 * argument[6]: Id of box to not perform check
 */
 
var x1 = argument[0];
var y1 = argument[1];
var z1 = argument[2];
var x2 = argument[3];
var y2 = argument[4];
var z2 = argument[5];
var notId = argument[6];

if (x2 < x1){ var xh = x2; x2 = x1; x1 = xh; }
if (y2 < y1){ var yh = y2; y2 = y1; y1 = yh; }
if (z2 < z1){ var zh = z2; z2 = z1; z1 = zh; }

for (var i=1;i<obj_room_master.solids_count;i++){
    var s_id = obj_room_master.solids[i, 0];
    if (s_id == notId){ continue; }
    if (notId != false && s_id.object_index != notId.object_index){ continue; }
    
    var s_x1 = obj_room_master.solids[i, 1];
    var s_y1 = obj_room_master.solids[i, 2];
    var s_z1 = obj_room_master.solids[i, 3];
    var s_x2 = obj_room_master.solids[i, 4];
    var s_y2 = obj_room_master.solids[i, 5];
    var s_z2 = obj_room_master.solids[i, 6];
    
    if (!s_id.solid) continue;
    if (x2 < s_x1) continue;
    if (x1 >= s_x2) continue;
    if (y2 < s_y1) continue;
    if (y1 >= s_y2) continue;
    if (z2 < s_z1) continue;
    if (z1 >= s_z2 - 5) continue;
    
    return s_id;
}

return false;
