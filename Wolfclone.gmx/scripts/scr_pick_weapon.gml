/*
 * scr_pick_weapon(weapon)
 *
 * argument[0]: weapon
 */

var weapon = argument[0];
global._PL_WEAPONS[weapon.slot] = true;
scr_switch_weapon(weapon.slot);
