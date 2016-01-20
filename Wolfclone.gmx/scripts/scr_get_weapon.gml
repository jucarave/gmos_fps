/*
 * scr_get_weapon(weaponSlot)
 *
 * argument[0]: weapon slot constant
 */
 
var weaponSlot = argument[0];

slot = weaponSlot;
model = global._WEAPONS[weaponSlot, WP_MODEL];
tex = global._WEAPONS[weaponSlot, WP_TEXTURE];
