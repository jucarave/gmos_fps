/*
 * scr_draw_weapon_fp()
 */

if (view_current != 1){ exit; }
  
var _z = z + height + jog;
var weapon = global._SEL_WEAPON;
 
if (global._PL_WEAPONS[weapon] == true){
    var wp_model = global._WEAPONS[weapon, WP_MODEL];
    var wp_tex = global._WEAPONS[weapon, WP_TEXTURE];
    
    var hud = instance_find(obj_hud, 0);
    var key = floor(hud.weapon_key_ind);
    var key2 = key + 1;
    var tween = hud.weapon_key_ind - key;
    
    var wp_index = global._WEAPONS[global._SEL_WEAPON, hud.weapon_anim];
    if (key2 >= wp_index[1]){ 
        if (hud.weapon_loop){
            key2 = wp_index[0];
        }else{
            key2 = wp_index[1] - 1;
        }
    }
    
    var px = scr_mix(global._ANIMATIONS[key, 2], global._ANIMATIONS[key2, 2], tween);
    var py = scr_mix(global._ANIMATIONS[key, 3], global._ANIMATIONS[key2, 3], tween);
    var pz = scr_mix(global._ANIMATIONS[key, 4], global._ANIMATIONS[key2, 4], tween);
    var rx = scr_mix(global._ANIMATIONS[key, 5], global._ANIMATIONS[key2, 5], tween);
    var ry = scr_mix(global._ANIMATIONS[key, 6], global._ANIMATIONS[key2, 6], tween);
    var rz = scr_mix(global._ANIMATIONS[key, 7], global._ANIMATIONS[key2, 7], tween);

    d3d_transform_set_identity();
    
    d3d_transform_set_translation(0,0,0);
    d3d_transform_add_rotation_x(rx);
    d3d_transform_add_rotation_y(ry);
    d3d_transform_add_rotation_z(rz);
    d3d_transform_add_translation(px,py,pz);
    d3d_transform_add_rotation_y(z_direction);
    d3d_transform_add_rotation_z(direction);
    
    d3d_transform_add_translation(x,y,_z);
    d3d_model_draw(wp_model, 0,0,0, wp_tex);
    //d3d_draw_block(-50,-0.2,1.0,200,0.2,1.25,-1,1,1);
    d3d_transform_set_identity();
}
