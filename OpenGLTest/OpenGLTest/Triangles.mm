//
//  Triangles.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/13.
//  Copyright © 2018年 EDZ. All rights reserved.
//729967085

/*
  A
 */

#include "Triangles.hpp"


void Triangles::Init()
{
    
    m_vertex->Init(36, 36);

    m_vertex->SetPosition(0, -0.5f, -0.5f, -0.5f);m_vertex->SetTexcoord(0, 0.0f, 0.0f);//1
    m_vertex->SetPosition(1, 0.5f, -0.5f, -0.5f) ; m_vertex->SetTexcoord(1, 1.0f, 0.0f);//2
    m_vertex->SetPosition(2, 0.5f,  0.5f, -0.5f);m_vertex->SetTexcoord(2, 1.0f, 1.0f);//3
    m_vertex->SetPosition(3, 0.5f,  0.5f, -0.5f);m_vertex->SetTexcoord(3, 1.0f, 1.0f);//4
    m_vertex->SetPosition(4, -0.5f,  0.5f, -0.5f);m_vertex->SetTexcoord(4, 0.0f, 1.0f);//5
    m_vertex->SetPosition(5, -0.5f, -0.5f, -0.5f);m_vertex->SetTexcoord(5, 0.0f, 0.0f);//6
    
    m_vertex->SetPosition(6, -0.5f, -0.5f,  0.5f);m_vertex->SetTexcoord(6, 0.0f, 0.0f);//7
    m_vertex->SetPosition(7, 0.5f, -0.5f,  0.5f);m_vertex->SetTexcoord(7, 1.0f, 0.0f);//8
    m_vertex->SetPosition(8, 0.5f,  0.5f,  0.5f);m_vertex->SetTexcoord(8, 1.0f, 1.0f);//9
    m_vertex->SetPosition(9, 0.5f,  0.5f,  0.5f);m_vertex->SetTexcoord(9, 1.0f, 1.0f);//10
    m_vertex->SetPosition(10, -0.5f,  0.5f,  0.5f);m_vertex->SetTexcoord(10, 0.0f, 1.0f);//11
    m_vertex->SetPosition(11, -0.5f, -0.5f,  0.5f);m_vertex->SetTexcoord(11, 0.0f, 0.0f);//12
    
    m_vertex->SetPosition(12, -0.5f, 0.5f, 0.5f);m_vertex->SetTexcoord(12, 1.0f, 0.0f);//13
    m_vertex->SetPosition(13, -0.5f, 0.5f, -0.5f);m_vertex->SetTexcoord(13, 1.0f, 1.0f);//14
    m_vertex->SetPosition(14, -0.5f, -0.5f, -0.5f);m_vertex->SetTexcoord(14, 0.0f, 1.0f);//15
    m_vertex->SetPosition(15, -0.5f, -0.5f, -0.5f);m_vertex->SetTexcoord(15, 0.0f, 1.0f);//16
    m_vertex->SetPosition(16, -0.5f, -0.5f, 0.5f);m_vertex->SetTexcoord(16, 0.0f, 0.0f);//17
    m_vertex->SetPosition(17, -0.5f, 0.5f, 0.5f);m_vertex->SetTexcoord(17, 1.0f, 0.0f);//18
    
    m_vertex->SetPosition(18, 0.5f, 0.5f, 0.5f);m_vertex->SetTexcoord(18, 1.0f, 0.0f);//19
    m_vertex->SetPosition(19, 0.5f, 0.5f, -0.5f);m_vertex->SetTexcoord(19, 1.0f, 1.0f);//20
    m_vertex->SetPosition(20, 0.5f, -0.5f, -0.5f);m_vertex->SetTexcoord(20, 0.0f, 1.0f);//21
    m_vertex->SetPosition(21, 0.5f, -0.5f, -0.5f);m_vertex->SetTexcoord(21, 0.0f, 1.0f);//22
    m_vertex->SetPosition(22, 0.5f, -0.5f, 0.5f);m_vertex->SetTexcoord(22, 0.0f, 0.0f);//23
    m_vertex->SetPosition(23, 0.5f, 0.5f, 0.5f);m_vertex->SetTexcoord(23, 1.0f, 0.0f);//24
    
    m_vertex->SetPosition(24, -0.5f, -0.5f, -0.5f);m_vertex->SetTexcoord(24, 0.0f, 1.0f);//25
    m_vertex->SetPosition(25, 0.5f, -0.5f, -0.5f);m_vertex->SetTexcoord(25, 1.0f, 1.0f);//26
    m_vertex->SetPosition(26, 0.5f, -0.5f, 0.5f);m_vertex->SetTexcoord(26, 1.0f, 0.0f);//27
    m_vertex->SetPosition(27, 0.5f, -0.5f, 0.5f);m_vertex->SetTexcoord(27, 1.0f, 0.0f);//28
    m_vertex->SetPosition(28, -0.5f, -0.5f, 0.5f);m_vertex->SetTexcoord(28, 0.0f, 0.0f);//29
    m_vertex->SetPosition(29, -0.5f, -0.5f, -0.5f);m_vertex->SetTexcoord(29, 0.0f, 1.0f);//30
    
    m_vertex->SetPosition(30, -0.5f, 0.5f, -0.5f);m_vertex->SetTexcoord(30, 0.0f, 1.0f);//31
    m_vertex->SetPosition(31, 0.5f, 0.5f, -0.5f);m_vertex->SetTexcoord(31, 1.0f, 1.0f);//32
    m_vertex->SetPosition(32, 0.5f, 0.5f, 0.5f);m_vertex->SetTexcoord(32, 1.0f, 0.0f);//33
    m_vertex->SetPosition(33, 0.5f, 0.5f, 0.5f);m_vertex->SetTexcoord(33, 1.0f, 0.0f);//34
    m_vertex->SetPosition(34, -0.5f, 0.5f, 0.5f);m_vertex->SetTexcoord(34, 0.0f, 0.0f);//35
    m_vertex->SetPosition(35, -0.5f, 0.5f, -0.5f);m_vertex->SetTexcoord(35, 0.0f, 1.0f);//36

    
    //前面
    m_vertex->SetIndexData(0, 0);
    m_vertex->SetIndexData(1, 1);
    m_vertex->SetIndexData(2, 2);
    
    m_vertex->SetIndexData(3, 3);
    m_vertex->SetIndexData(4, 4);
    m_vertex->SetIndexData(5, 5);
    
    //后面
    m_vertex->SetIndexData(6, 6);
    m_vertex->SetIndexData(7, 7);
    m_vertex->SetIndexData(8, 8);

    m_vertex->SetIndexData(9, 9);
    m_vertex->SetIndexData(10, 10);
    m_vertex->SetIndexData(11, 11);
    
    
    //上面
    m_vertex->SetIndexData(12, 12);
    m_vertex->SetIndexData(13, 13);
    m_vertex->SetIndexData(14, 14);
    
    m_vertex->SetIndexData(15, 15);
    m_vertex->SetIndexData(16, 16);
    m_vertex->SetIndexData(17, 17);
    
    //下面
    m_vertex->SetIndexData(18, 18);
    m_vertex->SetIndexData(19, 19);
    m_vertex->SetIndexData(20, 20);
    
    m_vertex->SetIndexData(21, 21);
    m_vertex->SetIndexData(22, 22);
    m_vertex->SetIndexData(23, 23);
    
    //左面
    m_vertex->SetIndexData(24, 24);
    m_vertex->SetIndexData(25, 25);
    m_vertex->SetIndexData(26, 26);
    
    m_vertex->SetIndexData(27, 27);
    m_vertex->SetIndexData(28, 28);
    m_vertex->SetIndexData(29, 29);
    
    //右面
    m_vertex->SetIndexData(30, 30);
    m_vertex->SetIndexData(31, 31);
    m_vertex->SetIndexData(32, 32);
    
    m_vertex->SetIndexData(33, 33);
    m_vertex->SetIndexData(34, 34);
    m_vertex->SetIndexData(35, 35);
    


    m_shaderProgram->Init("vertexShader.glsl", "fragmentShader.glsl");
    m_shaderProgram->SetTexture("texture2", "container.jpg");
    m_shaderProgram->SetTexture("texture1", "test.bmp");

}



void Triangles::Draw()
{
    glEnable(GL_DEPTH_TEST);
    m_vertex->Bind();
    
    glm::mat4 view;
    glm::vec3 cameraPos         = glm::vec3(0.0f,0.0f,600.0f );
    glm::vec3 cameraLookPos     = glm::vec3(0.0f,0.0f,0.0f);
    glm::vec3 cameraUpDirection = glm::vec3(0.0f,1.0f,0.0f);

    view = glm::lookAt(cameraPos, cameraLookPos, cameraUpDirection);

    glm::mat4 projection;
    projection = glm::perspective(glm::radians(45.0f),float(SCREEN_WIDTH)/float(SCREEN_HEIGHT),400.0f,-400.0f);


    glm::vec3 cubePositions[] = {
        glm::vec3( 0.0f,  0.0f,  0.0f),
        glm::vec3( 2.0f,  5.0f, -15.0f),
        glm::vec3(-1.5f, -2.2f, -2.5f),
        glm::vec3(-3.8f, -2.0f, -12.3f),
        glm::vec3( 2.4f, -0.4f, -3.5f),
        glm::vec3(-1.7f,  3.0f, -7.5f),
        glm::vec3( 1.3f, -2.0f, -2.5f),
        glm::vec3( 1.5f,  2.0f, -2.5f),
        glm::vec3( 1.5f,  0.2f, -1.5f),
        glm::vec3(-1.3f,  1.0f, -1.5f)
    };
    
    static float j = 0.0;
    for (unsigned int i = 0; i < 10; i++)
    {
        glm::mat4 model;
        model = glm::translate(model, cubePositions[i]);
        float angle = 20.0f * i;
        model = glm::rotate(model, glm::radians(angle + (j+=20)), glm::vec3(1.0f, 0.3f, 0.5f));
        
        
        m_shaderProgram->Draw(glm::value_ptr(model),glm::value_ptr(view),glm::value_ptr(projection));
        //这儿必须是GL_UNSIGNED_INT
        glDrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_INT , 0);
    }
    
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

