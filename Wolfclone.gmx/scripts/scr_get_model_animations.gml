/*
 * scr_get_model_animations(modelIndex, animIndex)
 *
 * argument[0]: model index to search animations
 * argument[1]: animation index to search
 */
 
var modelIndex = argument[0];
var animIndex = argument[1];
var aCount = array_height_2d(global._ANIMATIONS)

var ret;
ret[0] = 255;
ret[1] = 0;

for (var i=0;i<aCount;i++){
    if (global._ANIMATIONS[i, 0] == modelIndex && global._ANIMATIONS[i, 1] == animIndex){
        ret[0] = min(ret[0], i);
        ret[1] = max(ret[1], i);
    }
}

ret[1] += 1;

return ret;
