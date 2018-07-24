//
//  Triangles.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/13.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#include "Triangles.hpp"

/*
 
 
 TriData::TriData()
 {
 float vetex[32] = {
 //positions          //colors           //texture coords
 0.5f,   0.5f, 0.0f,   1.0f, 0.0f, 0.0f,   1.0f, 1.0f, // top right
 0.5f,  -0.5f, 0.0f,   0.0f, 1.0f, 0.0f,   1.0f, 0.0f, // bottom right
 -0.5f, -0.5f, 0.0f,   0.0f, 0.0f, 1.0f,   0.0f, 0.0f, // bottom left
 -0.5f,  0.5f, 0.0f,   1.0f, 1.0f, 0.0f,   0.0f, 1.0f  // top left
 };
 memset(m_vetex, 0, sizeof(m_vetex));
 memcpy(m_vetex, vetex, sizeof(vetex));
 
 float index[6] = {
 0, 1, 3, // first triangle
 1, 2, 3  // second triangle
 };
 memset(m_index, 0, sizeof(m_index));
 memcpy(m_index, index, sizeof(index));
 }

 */

void Triangles::Init()
{
    
    m_vertex->SetSize(4);
    
    m_vertex->SetPosition(0, 0.5f, 0.5f, 0.0f);
    m_vertex->SetColor(0, 1.0f, 0.0f, 0.0f);
    m_vertex->SetTexcoord(0, 1.0f, 1.0f);
    
    m_vertex->SetPosition(1, 0.5f, -0.5f, 0.0f);
    m_vertex->SetColor(1, 0.0f, 1.0f, 0.0f);
    m_vertex->SetTexcoord(1, 1.0f, 0.0f);
    
    m_vertex->SetPosition(2, -0.5f, -0.5f, 0.0f);
    m_vertex->SetColor(2, 0.0f, 0.0f, 1.0f);
    m_vertex->SetTexcoord(2, 0.0f, 0.0f);
    
    m_vertex->SetPosition(3, -0.5f, 0.5f, 0.0f);
    m_vertex->SetColor(3, 1.0f, 1.0f, 0.0f);
    m_vertex->SetTexcoord(3, 0.0f, 1.0f);
    
    m_vertex->SetIndex(6);
    m_vertex->SetIndexData(0, 0);
    m_vertex->SetIndexData(1, 1);
    m_vertex->SetIndexData(2, 3);
    m_vertex->SetIndexData(3, 1);
    m_vertex->SetIndexData(4, 2);
    m_vertex->SetIndexData(5, 3);

    m_vertex->Init();

    
    m_shaderProgram->Init("vertexShader.glsl", "fragmentShader.glsl");
    m_shaderProgram->SetTexture("texture1", "wall.jpg");
}

void Triangles::Draw()
{
    m_vertex->Bind();
    m_shaderProgram->Draw(nullptr,nullptr,nullptr);
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
