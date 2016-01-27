/*
 * scr_splice_messages(array, index)
 *
 * argument[0]: array to work with
 * argument[1]: index to splice
 */
 
var array = argument[0];
var index = argument[1];
var length = array_height_2d(array);

for (var i=index;i<length-1;i++){
    array[i, 0] = array[i+1, 0];
    array[i, 1] = array[i+1, 1];
}

array[i, 0] = "";
array[i, 1] = 0;

return array;
