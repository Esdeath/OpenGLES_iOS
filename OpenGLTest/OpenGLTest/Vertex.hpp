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
#include "ggl.h"


class Vertex {
    
private:
    VertexStruct *mVertexes;
    int mVertexCount;

    float vetex[32] = {
        //positions          //colors           //texture coords
        0.5f,   0.5f, 0.0f,   1.0f, 0.0f, 0.0f,   1.0f, 1.0f, // top right
        0.5f,  -0.5f, 0.0f,   0.0f, 1.0f, 0.0f,   1.0f, 0.0f, // bottom right
        -0.5f, -0.5f, 0.0f,   0.0f, 0.0f, 1.0f,   0.0f, 0.0f, // bottom left
        -0.5f,  0.5f, 0.0f,   1.0f, 1.0f, 0.0f,   0.0f, 1.0f  // top left
    };
    GLuint index[6] = {
        0, 1, 3, // first triangle
        1, 2, 3  // second triangle
    };
    int  *mIndex;
    int  mIndexCount;
public:
    void Init(int vertexCount , int indexCount);
    void Bind();
    void UnBind();

    Vertex();
    ~Vertex();

    void SetIndexData(int index,int x);
    
    void SetColor(int index, float r, float g, float b, float a=1.0);
    void SetTexcoord(int index, float x, float y);
    void SetNormal(int index, float x, float y, float z);
    void SetPosition(int index, float x, float y, float z, float w = 1.0f);
    VertexStruct &Get(int index);
};

#endif /* Vertex_hpp */
