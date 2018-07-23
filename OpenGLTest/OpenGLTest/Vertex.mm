//
//  Vertex.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/13.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#include "Vertex.hpp"
#include "until.hpp"

static GLuint g_vao;


Vertex::Vertex()
{

}

void Vertex::Init()
{
    glGenVertexArraysOES(1, &g_vao);
    glBindVertexArrayOES(g_vao);

    CreateBufferObject(GL_ARRAY_BUFFER, sizeof(m_vetex), GL_STATIC_DRAW,m_vetex);
    CreateBufferObject(GL_ELEMENT_ARRAY_BUFFER, sizeof(m_index), GL_STATIC_DRAW,m_index);

    glBindVertexArrayOES(0);
}

void Vertex::Bind()
{
    glBindVertexArrayOES(g_vao);
}

void Vertex::UnBind()
{
    glBindVertexArrayOES(0);
}
