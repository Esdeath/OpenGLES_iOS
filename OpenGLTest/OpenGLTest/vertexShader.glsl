
attribute vec3 position;
attribute vec3 color;
attribute vec2 aTexCoord;

varying vec3  a_Color;
varying vec2  TexCoord;

void main()
{
    gl_Position = vec4(position,1.0);

    a_Color = color;    
    TexCoord = vec2(aTexCoord.x,aTexCoord.y);
}
