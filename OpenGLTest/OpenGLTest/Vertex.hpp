//
//  Vertex.hpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/13.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#ifndef Vertex_hpp
#define Vertex_hpp

#include <stdio.h>
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>
#include <vector>


typedef struct {
    GLfloat Positon[3];//位置
    GLfloat Normal[3];//法线
    GLfloat Color[4];//颜色
    GLfloat TexCoord[2];//纹理
} VertexStruct;

using namespace std;

class Vertex {
    
private:
public:
    void Init();
    void Bind();
    void UnBind();
    
    Vertex();
public:
    //需要绘制的顶点数据
     float m_vetex[18] = {
        0.0,    0.5f,  0.0,  1.0,  0.0,   0.0, // x, y, z, r, g, b,每一行存储一个点的信息，位置和颜色
        -1.0f, -0.5f,  0.0,  0.0,  1.0,   0.0, //
        1.0f,  -1.0f,  0.0,  0.0,  0.0,   1.0, //
    };
    
    GLuint m_index[3] = {
        0,1,2,
    };

};

#endif /* Vertex_hpp */
