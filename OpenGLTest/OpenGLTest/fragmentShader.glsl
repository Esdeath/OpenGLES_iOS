
varying lowp vec4 a_Color;
varying lowp vec2  TexCoord;

uniform lowp sampler2D texture1;
uniform lowp sampler2D texture2;

void main()
{
    gl_FragColor = mix(texture2D(texture1, TexCoord), texture2D(texture2, TexCoord), 0.2);
    
}
