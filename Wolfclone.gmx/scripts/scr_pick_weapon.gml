/*
 * scr_pick_weapon(weapon)
 *
 * argument[0]: weapon
 */

var weapon = argument[0];
global._PL_WEAPONS[weapon.slot] = true;
global._PL_AMMO[weapon.slot] += weapon.ammo;
scr_switch_weapon(weapon.slot);

scr_add_message(global._WEAPONS[weapon.slot, WP_NAME] + " picked up");
