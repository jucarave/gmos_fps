/*
 * scr_draw_weapon_fp()
 */

if (view_current != 1){ exit; }
  
var _z = z + height + jog;
var weapon = global._SEL_WEAPON;
 
if (global._PL_WEAPONS[weapon] == true){
    var wp_model = global._WEAPONS[weapon, WP_MODEL];
    var wp_tex = global._WEAPONS[weapon, WP_TEXTURE];

    d3d_transform_set_identity();
    d3d_transform_set_translation(16,4,-5);
    d3d_transform_add_rotation_y(z_direction);
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,_z);
    d3d_model_draw(wp_model, 0,0,0, wp_tex);
    // d3d_draw_block(-50,-0.2,1.0,200,0.2,1.25,-1,1,1);
    d3d_transform_set_identity();
}
