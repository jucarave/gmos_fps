/*
 * scr_load_obj_model(filename, modelIndex)
 *
 * argument[0]: filename of the 3D model (in .obj)
 * argument[1]: Index to store the animation
 */
 
var filename = argument[0];
var modelIndex = argument[1];

if (!file_exists(filename)){
    return -1;
}

var vertices, texCoords, faces;
var vCount = 0, tCount = 0, fCount = 0, aCount = array_height_2d(global._ANIMATIONS) - 1;

var file = file_text_open_read(filename);
while (!file_text_eof(file)){
    var line = file_text_readln(file);
    var comment = (string_char_at(line, 0) == "#");
    
    if (line != "" && !comment){
        var args = scr_string_split(line, " ", 8);
    
        if (args[1] == "v"){
            vertices[vCount, 0] = real(args[2]);
            vertices[vCount, 1] = real(args[3]);
            vertices[vCount, 2] = real(args[4]);
            vCount += 1;
        }else if (args[1] == "vt"){
            texCoords[tCount, 0] = real(args[2]);
            texCoords[tCount, 1] = 1 - real(args[3]);
            tCount += 1;
        }else if (args[1] == "f"){
            faces[fCount, 0] = args[2];
            faces[fCount, 1] = args[3];
            faces[fCount, 2] = args[4];
            fCount += 1;
        }else if (args[1] == "at"){
            global._ANIMATIONS[aCount, 0] = modelIndex;
            global._ANIMATIONS[aCount, 1] = real(args[2]);
            global._ANIMATIONS[aCount, 2] = real(args[3]);
            global._ANIMATIONS[aCount, 3] = real(args[4]);
            global._ANIMATIONS[aCount, 4] = real(args[5]);
            global._ANIMATIONS[aCount, 5] = real(args[6]);
            global._ANIMATIONS[aCount, 6] = real(args[7]);
            global._ANIMATIONS[aCount, 7] = real(args[8]);
            aCount += 1;
        }
    }
}

file_text_close(file);

var model = d3d_model_create();

d3d_model_primitive_begin(model, pr_trianglelist);

for (var i=0;i<fCount;i++){
    var par1 = scr_string_split(faces[i, 0], "/", 2);
    var par2 = scr_string_split(faces[i, 1], "/", 2);
    var par3 = scr_string_split(faces[i, 2], "/", 2);
    
    var ver1 = real(par1[1]) - 1;
    var ver2 = real(par2[1]) - 1;
    var ver3 = real(par3[1]) - 1;
    
    var tex1 = real(par1[2]) - 1;
    var tex2 = real(par2[2]) - 1;
    var tex3 = real(par3[2]) - 1;
    
    d3d_model_vertex_texture(model, vertices[ver1, 0], vertices[ver1, 1], vertices[ver1, 2], texCoords[tex1, 0], texCoords[tex1, 1]);
    d3d_model_vertex_texture(model, vertices[ver2, 0], vertices[ver2, 1], vertices[ver2, 2], texCoords[tex2, 0], texCoords[tex2, 1]);
    d3d_model_vertex_texture(model, vertices[ver3, 0], vertices[ver3, 1], vertices[ver3, 2], texCoords[tex3, 0], texCoords[tex3, 1]);
}

d3d_model_primitive_end(model);

return model;
