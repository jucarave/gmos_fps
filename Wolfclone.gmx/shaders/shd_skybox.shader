attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    vec4 vPos = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    gl_Position = vPos.xyww;
    
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;

void main()
{
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
}

