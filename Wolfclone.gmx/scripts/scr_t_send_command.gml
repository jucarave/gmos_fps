/*
 * scr_t_send_command(str)
 *
 * argument[0]: String command
 */

var str = argument[0];

if (str == "help"){
    // Displays all the available commands
    scr_t_add_to_console('   "help": Displays all the available commands');
    scr_t_add_to_console('   "gravity [on|off]": Activates/Deactivates gravity');
    scr_t_add_to_console('   "player position": Displays the current position of the player');
    scr_t_add_to_console('   "player position $x $y $z": Sets the position of the player to the vars $x, $y and $z');
    scr_t_add_to_console('   "mouselook [on|off]": Activates/Deactivates looking with the mouse');
}else if (string_pos("gravity ", str) == 1){
    // Activates/Deactivates gravity
    var command = string_replace(str, "gravity ", "");
    if (command == "on"){
        global._ZGRAVITY = true;
    }else if (command == "off"){
        global._ZGRAVITY = false;
    }else{
        return scr_t_send_command("Invalid");
    }
}else if (str == "player position"){ // player position
    // Get player position
    var out = " > X: " + string(obj_player.x) + "; Y: " + string(obj_player.y) + "; Z: " + string(obj_player.z);
    scr_t_add_to_console(out);
}else if (string_pos("player position ", str) == 1){ // player position $x $y $z
    // Set player position
    var position = string_replace(str, "player position ", "");
    var coords = scr_string_split(position, ' ', 3);
    
    if (coords[0] != 4){ return scr_t_send_command("Invalid"); }

    if (coords[1] != "x")
        obj_player.x = real(coords[1]);
    if (coords[2] != "y")
        obj_player.y = real(coords[2]);
    if (coords[3] != "z")
        obj_player.z = real(coords[3]);
    
    scr_t_send_command("player position");
}else if (string_pos("mouselook ", str) == 1){ // mouselook [on|off]
    // Activates/Deactivates looking with the mouse
    var command = string_replace(str, "mouselook ", "");
    if (command == "on"){
        global._MLOOK = true;
    }else if (command == "off"){
        global._MLOOK = false;
    }else{
        return scr_t_send_command("Invalid");
    }
}else{
    scr_t_add_to_console(" > Invalid command!");
}
