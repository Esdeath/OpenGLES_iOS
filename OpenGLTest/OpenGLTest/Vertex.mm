//
//  Vertex.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/13.
//  Copyright © 2018年 EDZ. All rights reserved.
//995743

#include "Vertex.hpp"
#include "until.hpp"

static GLuint g_vbo;
static GLuint g_ebo;


Vertex::Vertex()
{
 
}

Vertex::~Vertex()
{
    if (mVertexes) {
        delete [] mVertexes;
    }
    if (mIndex) {
        delete [] mIndex;
    }
}

void Vertex::Init(int vertexCount , int indexCount)
{
    
    mIndexCount = indexCount;
    mIndex      = new int[indexCount];
    memset(mIndex, 0, sizeof(int)*mIndexCount);
    
    mVertexCount = vertexCount;
    mVertexes = new VertexStruct[mVertexCount];
    memset(mVertexes, 0, sizeof(VertexStruct)*mVertexCount);
    
    g_vbo = CreateBufferObject(GL_ARRAY_BUFFER, sizeof(VertexStruct)*mVertexCount, GL_STATIC_DRAW,nullptr);
    g_ebo = CreateBufferObject(GL_ELEMENT_ARRAY_BUFFER, sizeof(int)*mIndexCount, GL_STATIC_DRAW,nullptr);

}

void Vertex::Bind()
{
    glBindBuffer(GL_ARRAY_BUFFER, g_vbo);
    glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(VertexStruct)*mVertexCount, mVertexes);

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER , g_ebo);
    glBufferSubData(GL_ELEMENT_ARRAY_BUFFER, 0, sizeof(int)*mIndexCount, mIndex);
}

void Vertex::UnBind()
{
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
}


void Vertex::SetIndexData(int index, int x)
{
    if (index >= mIndexCount) {
        printf("index beyond to mIndexCount ");
        return ;
    }
    mIndex[index] = x;
}

void Vertex::SetPosition(int index, float x, float y, float z, float w) {
    
    if (index >= mVertexCount) {
        printf("index beyond to mVertexCount ");
        return ;
    }

    mVertexes[index].Position[0] = x;
    mVertexes[index].Position[1] = y;
    mVertexes[index].Position[2] = z;
    mVertexes[index].Position[3] = w;
}


void Vertex::SetColor(int index, float r, float g, float b, float a) {
    
    if (index >= mVertexCount) {
        printf("index beyond to mVertexCount ");
        return ;
    }
    
    mVertexes[index].Color[0] = r;
    mVertexes[index].Color[1] = g;
    mVertexes[index].Color[2] = b;
    mVertexes[index].Color[3] = a;
}

void Vertex::SetTexcoord(int index, float x, float y) {
    if (index >= mVertexCount) {
        printf("index beyond to mVertexCount ");
        return ;
    }
    
    mVertexes[index].Texcoord[0] = x;
    mVertexes[index].Texcoord[1] = y;
}

void Vertex::SetNormal(int index, float x, float y, float z) {
    if (index >= mVertexCount) {
        printf("index beyond to mVertexCount ");
        return ;
    }
    
    mVertexes[index].Normal[0] = x;
    mVertexes[index].Normal[1] = y;
    mVertexes[index].Normal[2] = z;
    mVertexes[index].Normal[3] = 1.0;
}

VertexStruct&Vertex::Get(int index) {
    return mVertexes[index];
}
