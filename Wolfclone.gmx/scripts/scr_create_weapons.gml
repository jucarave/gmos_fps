/*
 * scr_create_weapons()
 */
 
global._WEAPONS[WP_HGUN, WP_NAME] = "A19H4";
global._WEAPONS[WP_HGUN, WP_SLOT] = 0;
global._WEAPONS[WP_HGUN, WP_MODEL] = global._HANDGUN;
global._WEAPONS[WP_HGUN, WP_TEXTURE] = global._TEXTURES[TEX_HANDGUN];
global._WEAPONS[WP_HGUN, WP_IDDLE] = scr_get_model_animations(WP_HGUN, 0);
global._WEAPONS[WP_HGUN, WP_READY] = scr_get_model_animations(WP_HGUN, 1);
