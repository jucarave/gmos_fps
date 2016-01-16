/*
 * scr_t_send_command(str)
 *
 * argument[0]: String command
 */

var str = argument[0];

if (str == "help"){
    // Displays all the available commands
    scr_t_add_to_console('   "help": Displays all the available commands');
    scr_t_add_to_console('   "player position": Displays the current position of the player');
    scr_t_add_to_console('   "player position $x $y $z": Sets the position of the player to the vars $x, $y and $z');
}else if (str == "player position"){
    // Get player position
    var out = " > X: " + string(obj_player.x) + "; Y: " + string(obj_player.y) + "; Z: " + string(obj_player.z);
    scr_t_add_to_console(out);
}else if (string_pos("player position ", str) == 1){
    // Set player position
    var position = string_replace(str, "player position ", "");
    var coords = scr_string_split(position, ' ', 3);
    
    if (coords[0] != 4){ return scr_t_send_command("Invalid"); }

    obj_player.x = real(coords[1]);
    obj_player.y = real(coords[2]);
    obj_player.z = real(coords[3]);
    
    scr_t_send_command("player position");
}else{
    scr_t_add_to_console(" > Invalid command!");
}
