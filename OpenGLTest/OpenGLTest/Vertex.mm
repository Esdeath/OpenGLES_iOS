//
//  Vertex.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/13.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#include "Vertex.hpp"

static GLuint g_vbo;
static GLuint g_ebo;
static GLuint g_vao;

Vertex::Vertex()
{

}

void Vertex::Init()
{
    glGenVertexArraysOES(1, &g_vao);
    glBindVertexArrayOES(g_vao);

    //1.生成新的vbo（顶点缓存对象）
    glGenBuffers(1, &g_vbo);
    //2.将顶点缓存对象绑定到顶点数组对象
    glBindBuffer(GL_ARRAY_BUFFER,g_vbo);
    //3.将数据拷贝到缓存对象
    glBufferData(GL_ARRAY_BUFFER,sizeof(m_vetex),m_vetex,GL_STATIC_DRAW);
    //4.0绑定缓存对象将关闭VBO操作
    //glBindBuffer(GL_ARRAY_BUFFER,0);
    
    glGenBuffers(1, &g_ebo);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, g_ebo);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(m_index), m_index, GL_STATIC_DRAW);
   // glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
    

    glBindVertexArrayOES(0);
}

void Vertex::Bind()
{
    
    glBindVertexArrayOES(g_vao);
    // 为顶点数组绑定VBO
   // glBindBuffer(GL_ARRAY_BUFFER, g_vbo);
   // glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, g_ebo);
   // glBufferData(GL_ARRAY_BUFFER, sizeof(m_vetex), m_vetex, GL_STATIC_DRAW);
}

void Vertex::UnBind()
{
    glBindVertexArrayOES(0);
    

//    glDeleteVertexArraysOES(1, &g_vao);
//    glDeleteBuffers(1, &g_vbo);
//    glDeleteBuffers(1, &g_ebo);
   // glBindVertexArrayOES(g_vao);
    //0绑定缓存对象将关闭VBO操作
   // glBindBuffer(GL_ARRAY_BUFFER, 0);
   // glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
}
