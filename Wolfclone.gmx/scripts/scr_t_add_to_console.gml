/*
 * scr_t_add_to_console(string)
 *
 * argument[0]: String to add to the console
 */
 
var str = argument[0];

ds_list_add(obj_hud_debug.console, str);
if (ds_list_size(obj_hud_debug.console) > 15){ ds_list_delete(obj_hud_debug.console, 0); }
