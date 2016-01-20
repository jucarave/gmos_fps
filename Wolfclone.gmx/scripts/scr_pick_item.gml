/*
 * scr_pick_item(item)
 *
 * argument[0]: Item I'm colliding with
 */
 
var item = argument[0];

switch (item.type){
    case IT_WEAPON:
        scr_pick_weapon(item);
        break;
}

with (item){ instance_destroy(); }
