
attribute vec4 position;
attribute vec4 color;
varying vec4  a_Color;
void main()
{
    a_Color = color;
    gl_Position = position;
}
