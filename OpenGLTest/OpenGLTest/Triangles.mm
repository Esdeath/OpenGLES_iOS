//
//  Triangles.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/13.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#include "Triangles.hpp"


void Triangles::Init()
{
    m_vertex->Init();
    m_shaderProgram->Init();
}

void Triangles::Draw()
{
    m_vertex->Bind();
    
    m_shaderProgram->Draw(m_vertex->m_vetex);
    
   // glDrawArrays(GL_TRIANGLES, 0, 3);
    glDrawElements(GL_TRIANGLES, 3, GL_UNSIGNED_INT, 0);
    m_vertex->UnBind();
}

Triangles::Triangles()
{
    m_vertex = new Vertex();
    m_shaderProgram = new ShaderProgram();
}

Triangles::~Triangles()
{
    delete m_vertex;
    delete m_shaderProgram;
}
