//
//  Triangles.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/13.
//  Copyright © 2018年 EDZ. All rights reserved.
//729967085

#include "Triangles.hpp"


void Triangles::Init()
{
    
    m_vertex->Init(4, 6);

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
    
    m_vertex->SetIndexData(0, 0);
    m_vertex->SetIndexData(1, 1);
    m_vertex->SetIndexData(2, 3);
    m_vertex->SetIndexData(3, 1);
    m_vertex->SetIndexData(4, 2);
    m_vertex->SetIndexData(5, 3);

    m_shaderProgram->Init("vertexShader.glsl", "fragmentShader.glsl");
    m_shaderProgram->SetTexture("texture1", "wall.jpg");
}



void Triangles::Draw()
{
    glEnable(GL_DEPTH_TEST);
    m_vertex->Bind();
    
    glm::mat4 model;
    model = glm::rotate(model, glm::radians(0.0f), glm::vec3(1.0f,0.0f,0.0f));
    
    glm::mat4 view;
    
    static int i = 0;
    i++;
    
    glm::vec3 cameraPos = glm::vec3(0.0f , 0.0f, 90.0f + i);
    glm::vec3 cameraLookPos = glm::vec3(0.0f,0.0f,0.0f);
    glm::vec3 cameraUpDirection = glm::vec3(0.0f,1.0f,0.0f);

    view = glm::lookAt(cameraPos, cameraLookPos, cameraUpDirection);

    glm::mat4 projection;
    projection = glm::perspective(glm::radians(45.0f),1.3f,0.1f,-100.0f);

    m_shaderProgram->Draw(glm::value_ptr(model),glm::value_ptr(view),glm::value_ptr(projection));
    //这儿必须是GL_UNSIGNED_INT
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT , 0);
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
