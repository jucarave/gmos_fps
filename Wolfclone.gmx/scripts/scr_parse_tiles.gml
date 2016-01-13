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
            
            var tile = tile_layer_find(layer.layer_id, xx, yy);
            if (tile != -1){
                switch (layer.type){
                    case "Wall":
                        scr_parse_wall(tile, xx, yy, layer.z, layer.height, layer.solid);
                        break;
                    
                    case "Floor":
                        scr_parse_floor(tile, xx, yy, layer.z);
                        break;
                    
                    case "Ceil":
                        scr_parse_ceil(tile, xx, yy, layer.z);
                        break;
                }
            }
        }
    }
}

// Delete 2D Layers
for (var i=0;i<len;i+=1){
    var layer = layers[i];
    tile_layer_delete(layer.layer_id)
}
