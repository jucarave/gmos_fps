/*
 * scr_parse_tiles();
 */

var len = instance_number(obj_layer_configuration);
var layers;

for (var i=0;i<len;i+=1){
    layers[i] = instance_find(obj_layer_configuration, i);
}


for (var xx=0;xx<room_width;xx+=32){
    for (var yy=0;yy<room_height;yy+=32){
        // Read layer configurations
        for (var i=0;i<len;i+=1){
            var layer = layers[i];
            
            for (var k=0;k<layer.layers_count;k++){
                var tile = tile_layer_find(layer.layers[k, LY_DEPTH], xx, yy);
                if (tile != -1){
                    switch (layer.type){
                        case "Wall":
                            scr_parse_wall(tile, xx, yy, layer.layers[k, LY_Z], layer.layers[k, LY_DEPTH], layer.layers[k, LY_HEIGHT], layer.layers[k, LY_SOLID]);
                            break;
                        
                        case "Floor":
                            scr_parse_floor(tile, xx, yy, layer.layers[k, LY_Z]);
                            break;
                        
                        case "Ceil":
                            scr_parse_ceil(tile, xx, yy, layer.layers[k, LY_Z]);
                            break;
                    }
                }
            }
        }
    }
}

// Delete 2D Layers
for (var i=0;i<len;i+=1){
    var layer = layers[i];
    for (var j=0;j<layer.layers_count;j++){
        tile_layer_delete(layer.layers[j, LY_DEPTH]);
    }
}
