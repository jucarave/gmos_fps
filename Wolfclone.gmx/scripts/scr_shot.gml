/*
 * scr_shot()
 *
 */
 
if (!global._PL_WEAPONS[global._SEL_WEAPON]) exit;

with (hud){
    scr_switch_animation(WP_FIRE);
    state = WP_SM_FIRE;
}

var hit = scr_ray_trace(x,y,z+height+jog,direction,z_direction,200);
if (hit[0] != -1){
    var ins = hit[0];
    if (ins.object_index == obj_block){
        var _z = hit[3];
        if (_z > ins.z - GRID_HW && _z < ins.z + GRID_HW + ((ins.height - 1) * GRID_W)){
            var bullet = instance_create(hit[1],hit[2],obj_bullet);
            bullet.z = hit[3];
        }
    }
}

/*var bullet = instance_create(x,y,obj_bullet);
bullet.z = z + height + jog;
bullet.direction = direction;
bullet.z_direction = z_direction;*/

/*var wp_socket = global._WEAPONS[global._SEL_WEAPON, WP_SOCKET];
var _x = wp_socket[0] + 16;
var _y = wp_socket[1] + 4;
var _z = wp_socket[2] - 5;

var matrix = matrix_build(x, y, z+height+jog, 0, z_direction, direction, 1, 1 , 1);

var sx = _x * matrix[0] + _y * matrix[4] + _z * matrix[8] + matrix[12];
var sy = _x * matrix[1] + _y * matrix[5] + _z * matrix[9] + matrix[13];
var sz = _x * matrix[2] + _y * matrix[6] + _z * matrix[10] + matrix[14];

var bullet = instance_create(sx,sy,obj_bullet);
bullet.z = sz;
bullet.direction = direction;
bullet.z_direction = z_direction;*/
