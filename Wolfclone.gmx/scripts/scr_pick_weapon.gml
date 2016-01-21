/*
 * scr_pick_weapon(weapon)
 *
 * argument[0]: weapon
 */

var weapon = argument[0];

global._PL_WEAPONS[weapon.slot] = true;

obj_hud.weapon_anim = ANIM_WP_LOAD;
obj_hud.weapon_key_ind = 0;
