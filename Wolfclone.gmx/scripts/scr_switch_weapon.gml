/*
 * scr_switch_weapon(weaponIndex)
 *
 * argument[0]: weapon Index
 */
 
var weaponIndex = argument[0];
global._SEL_WEAPON = weaponIndex;

with (obj_hud){
    scr_switch_animation(WP_READY);
}
