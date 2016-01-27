/*
 * scr_add_message(message)
 *
 * argument[0]: message to add
 */

var message = argument[0];
var life = 60;

var hud = instance_find(obj_hud, 0);

for (var i=0;i<5;i++){
    if (hud.messages[i, 1] == 0){
        hud.messages[i, 0] = message;
        hud.messages[i, 1] = life;
        return true;
    }
}

hud.messages = scr_splice_messages(hud.messages, 0);

return scr_add_message(message);
