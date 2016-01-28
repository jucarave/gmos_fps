/*
 * scr_get_model_animations(animations, animIndex)
 *
 * argument[0]: Animations Array
 * argument[1]: animation index to search
 */
 
var animations = argument[0];
var animIndex = argument[1];
var aCount = array_height_2d(animations)

var ret;
ret[0] = 255;
ret[1] = 0;

for (var i=0;i<aCount;i++){
    if (animations[i, 0] == animIndex){
        ret[0] = min(ret[0], i);
        ret[1] = max(ret[1], i);
    }
}

ret[1] += 1;

return ret;
