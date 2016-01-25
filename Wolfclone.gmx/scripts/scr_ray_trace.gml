/*
 * scr_ray_trace(x1,y1,z1,direction,z_direction)
 *
 * argument[0]: X Origin of the ray
 * argument[1]: Y Origin of the ray
 * argument[2]: z Origin of the ray
 * argument[3]: Direction (z rotation) of the ray
 * argument[4]: Direction (y rotation) of the ray
 * argument[5]: Distance of the ray
 */
 
var x1 = argument[0];
var y1 = argument[1];
var z1 = argument[2];
var dir = degtorad(argument[3]);
var z_dir = degtorad(argument[4]);
var r_dis = argument[5];

var x2 = x1 + cos(dir) * cos(z_dir) * r_dis;
var y2 = y1 - sin(dir) * cos(z_dir) * r_dis;
var z2 = z1 + sin(z_dir) * r_dis;

var ret;
var hit = false;

var min_dis = 2;

for (var i=1;i<obj_room_master.solids_count;i++){
    var s_x1 = obj_room_master.solids[i, 1];
    var s_y1 = obj_room_master.solids[i, 2];
    var s_x2 = obj_room_master.solids[i, 4];
    var s_y2 = obj_room_master.solids[i, 5];
    
    var line_col = scr_collision_line_box(i, x1, y1, z1, x2, y2, z2);
    if (line_col[0] != -1){
        var _x = x1 + (x2-x1) * line_col[0];
        var _y = y1 + (y2-y1) * line_col[0];
        var _z = z1 + (z2-z1) * line_col[0];
        
        var dis = line_col[0];
        if (dis < min_dis){
            min_dis = dis;
            hit = true;
            ret[0] = obj_room_master.solids[i, 0];
            ret[1] = _x;
            ret[2] = _y;
            ret[3] = _z;
        }
    }
}

if (hit == false){
    ret[0] = -1;
    
    return ret;
}

return ret;
