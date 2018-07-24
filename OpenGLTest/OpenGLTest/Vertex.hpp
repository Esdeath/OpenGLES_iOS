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

    
    float  *mIndex;
    int mIndexCount;
public:
    void Init();
    void Bind();
    void UnBind();

    Vertex();
    ~Vertex();

    void SetIndex(int indexCount);
    void SetIndexData(int index,float x);
    
    void SetSize(int vertexCount);
    void SetColor(int index, float r, float g, float b, float a=1.0);
    void SetTexcoord(int index, float x, float y);
    void SetNormal(int index, float x, float y, float z);
    void SetPosition(int index, float x, float y, float z, float w = 1.0f);
    VertexStruct &Get(int index);
    


};

#endif /* Vertex_hpp */
