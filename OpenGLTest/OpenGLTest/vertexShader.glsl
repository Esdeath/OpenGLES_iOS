
attribute vec4 position;
attribute vec4 color;
attribute vec2 aTexCoord;

uniform  mat4 ModelMatrix;
uniform  mat4 ViewMatrix;
uniform  mat4 ProjectionMatrix;

varying vec4  a_Color;
varying vec2  TexCoord;



void main()
{
    gl_Position = ProjectionMatrix * ViewMatrix * ModelMatrix * position;

    a_Color = color;    
    TexCoord = vec2(aTexCoord.x,aTexCoord.y);
}
