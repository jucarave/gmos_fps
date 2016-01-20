/*
 * scr_draw_weapon_fp()
 */
 
var _z = z + height + jog;
var weapon = global._SEL_WEAPON;
 
if (global._PL_WEAPONS[weapon] == true){
    var wp_model = global._WEAPONS[weapon, WP_MODEL];
    var wp_tex = global._WEAPONS[weapon, WP_TEXTURE];

    shader_set(shd_hud);
    d3d_transform_set_identity();
    d3d_transform_set_translation(12,4,-4);
    d3d_transform_add_rotation_y(z_direction);
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,_z);
    d3d_model_draw(wp_model, 0,0,0, wp_tex);
    d3d_transform_set_identity();
    shader_reset();
}
