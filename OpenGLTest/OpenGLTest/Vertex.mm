//
//  Vertex.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/13.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#include "Vertex.hpp"
#import <UIKit/UIKit.h>
#include "until.hpp"

static GLuint g_vbo;
static GLuint g_ebo;
static GLuint g_vao;

static GLuint g_tex1;

Vertex::Vertex()
{

}

void Vertex::Init()
{
    
    glGenVertexArraysOES(1,&g_vao);
    //1.生成新的vbo（顶点缓存对象）
    glGenBuffers(1, &g_vbo);
    glGenBuffers(1, &g_ebo);

    glBindVertexArrayOES(g_vao);

    //2.将顶点缓存对象绑定到顶点数组对象
    glBindBuffer(GL_ARRAY_BUFFER,g_vbo);
    //3.将数据拷贝到缓存对象
    glBufferData(GL_ARRAY_BUFFER,sizeof(m_vetex),m_vetex,GL_STATIC_DRAW);
    //4.0绑定缓存对象将关闭VBO操作
    
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, g_ebo);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(m_index), m_index, GL_STATIC_DRAW);
    
    
    
    glGenTextures(1, &g_tex1);
    glBindTexture(GL_TEXTURE_2D, g_tex1);
    // 为当前绑定的纹理对象设置环绕、过滤方式
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    // 加载并生成纹理
    int width, height;

    char* data =  loadPicture("awesomeface.png", width, height);
    
    if (data)
    {
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, data);
        glGenerateMipmap(GL_TEXTURE_2D);
    }
    else
    {
        printf("Failed to load texture");
    }
    
    
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
