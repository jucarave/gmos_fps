/*
 * scr_create_weapons()
 */
 
global._WEAPONS[WP_HGUN, WP_NAME] = "A19H4";
global._WEAPONS[WP_HGUN, WP_SLOT] = 0;
global._WEAPONS[WP_HGUN, WP_MODEL] = global._HANDGUN[0];
global._WEAPONS[WP_HGUN, WP_ANIMATION] = global._HANDGUN[1];
global._WEAPONS[WP_HGUN, WP_SOCKET] = global._HANDGUN[2];
global._WEAPONS[WP_HGUN, WP_TEXTURE] = global._TEXTURES[TEX_HANDGUN];
global._WEAPONS[WP_HGUN, WP_IDDLE] = scr_get_model_animations(global._HANDGUN[1], 0);
global._WEAPONS[WP_HGUN, WP_READY] = scr_get_model_animations(global._HANDGUN[1], 1);
global._WEAPONS[WP_HGUN, WP_FIRE] = scr_get_model_animations(global._HANDGUN[1], 2);
