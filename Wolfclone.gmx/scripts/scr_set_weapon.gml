/*
 * scr_get_weapon(weapon_slot, ammunition)
 *
 * Is called from the instances of the weapons in the map to set their configuration
 *
 * argument[0]: weapon slot constant
 * argument[1]: Ammunition of this pick
 */
 
var weaponSlot = argument[0];

slot = weaponSlot;
model = global._WEAPONS[weaponSlot, WP_MODEL];
tex = global._WEAPONS[weaponSlot, WP_TEXTURE];
ammo = argument[1];
