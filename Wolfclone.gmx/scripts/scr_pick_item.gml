/*
 * scr_pick_item(item)
 *
 * argument[0]: Item I'm colliding with
 */
 
var item = argument[0];

if (item.z + 3 < z) exit;
if (item.z > z + height) exit;

switch (item.type){
    case IT_WEAPON:
        scr_pick_weapon(item);
        break;
}

with (item){ instance_destroy(); }
