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
    m_shaderProgram->Init("vertexShader.glsl", "fragmentShader.glsl");
    m_shaderProgram->SetTexture("texture1", "wall.jpg");
}

void Triangles::Draw()
{
    m_vertex->Bind();
    m_shaderProgram->Draw(m_vertex->m_vetex,nullptr,nullptr,nullptr);
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
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
