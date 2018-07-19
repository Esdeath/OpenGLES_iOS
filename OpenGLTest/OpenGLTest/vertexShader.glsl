
attribute vec4 position;
attribute vec4 color;
attribute vec2 aTexCoord;

varying vec4  a_Color;
varying vec2  TexCoord;
void main()
{
    a_Color = color;
    
    TexCoord = vec2(aTexCoord.x,aTexCoord.y);
    
    gl_Position = position;
}
