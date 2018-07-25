//
//  ShaderProgram.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/2.
//  Copyright © 2018年 EDZ. All rights reserved.
//

//1.顶点数据 ---- 顶点着色器 ---- 图元装配 ----- 几何着色器 ----- 测试与混合 ----- 片段着色器 -----光栅化
#include "ShaderProgram.hpp"
#include "Vertex.hpp"
ShaderProgram::ShaderProgram()
{
    mProgram = 0;
}

void ShaderProgram::Init(const char* vs , const char* fs)
{

    //1.创建片段着色器
    GLuint fragmentShader    = createShader(fs, GL_FRAGMENT_SHADER);
    if (fragmentShader == 0) {
        printf("Failed To create Fragment shader");
        return ;
    }
    //2.创建顶点着色器
    GLuint vertexShader  =  createShader(vs, GL_VERTEX_SHADER);
    
    if (vertexShader == 0) {
        printf("Failed To create Vertex shader");
        return ;
    }
    //3.使用顶点着色器和片段着色器创建程序
    mProgram =  createProgram(fragmentShader, vertexShader);
    if (mProgram != 0) {
        //glGetAttribLocation获取顶点着色器 attribute修饰的变量名的index。可以通过这个index向顶点着色器传递数据
        mPositionLocation = glGetAttribLocation(mProgram, "position");
        mColorLocation    = glGetAttribLocation(mProgram, "color");
        mTexCoordLocation = glGetAttribLocation(mProgram, "aTexCoord");
        
        mModelMatrixLocation      = glGetUniformLocation(mProgram, "ModelMatrix");
        mViewMatrixLocation       = glGetUniformLocation(mProgram, "ViewMatrix");
        mProjectionMatrixLocation = glGetUniformLocation(mProgram, "ProjectionMatrix");
        mIT_ModelMatrix           = glGetUniformLocation(mProgram, "IT_ModelMatrix");
        mNormalLocation           = glGetAttribLocation(mProgram, "normal");
    }
}

void ShaderProgram::Draw(float *M,float *V,float *P)
{
    //1.使用程序
    glUseProgram(mProgram);
    
    glUniformMatrix4fv(mModelMatrixLocation, 1, GL_FALSE, M);
    glUniformMatrix4fv(mViewMatrixLocation, 1, GL_FALSE, V);
    glUniformMatrix4fv(mProjectionMatrixLocation, 1, GL_FALSE, P);
    
    for (auto iter = mUniformVec4s.begin(); iter != mUniformVec4s.end(); ++iter) {
        glUniform4fv(iter->second->mLocation, 1, iter->second->v);
    }
    
    int iIndex = 0;
    for (auto iter=mUniformTextures.begin();iter!=mUniformTextures.end();++iter){
        glActiveTexture(GL_TEXTURE0 + iIndex);
        glBindTexture(GL_TEXTURE_2D, iter->second->mTexture);
        glUniform1i(iter->second->mLocation, iIndex);
    }

    
    glEnableVertexAttribArray(mPositionLocation);
    glVertexAttribPointer(mPositionLocation, 4, GL_FLOAT, GL_FALSE, sizeof(VertexStruct), 0);
    glEnableVertexAttribArray(mColorLocation);
    glVertexAttribPointer(mColorLocation, 4, GL_FLOAT, GL_FALSE, sizeof(VertexStruct), (void*)(sizeof(float) * 4));
    glEnableVertexAttribArray(mTexCoordLocation);
    glVertexAttribPointer(mTexCoordLocation, 4, GL_FLOAT, GL_FALSE, sizeof(VertexStruct), (void*)(sizeof(float) * 8));
    glEnableVertexAttribArray(mNormalLocation);
    glVertexAttribPointer(mNormalLocation, 4, GL_FLOAT, GL_FALSE, sizeof(VertexStruct), (void*)(sizeof(float) * 12));

}



void ShaderProgram::SetVec4(const char *name, float x, float y, float z, float w)
{
    auto iter = mUniformVec4s.find(name);
    if (iter == mUniformVec4s.end()) {
        GLint location = glGetUniformLocation(mProgram, name);
        if (location != -1) {
            UniformVector4f*v = new UniformVector4f;
            v->v[0] = x;
            v->v[1] = y;
            v->v[2] = z;
            v->v[3] = w;
            v->mLocation = location;
            mUniformVec4s.insert(std::pair<std::string, UniformVector4f*>(name,v));
        }
    } else {
        iter->second->v[0] = x;
        iter->second->v[1] = y;
        iter->second->v[2] = z;
        iter->second->v[3] = w;
    }
  
}

void ShaderProgram::SetTexture(const char *name, const char *imagePath)
{
    auto iter = mUniformTextures.find(name);
    if (iter == mUniformTextures.end()) {
        GLint location = glGetUniformLocation(mProgram, name);
        if (location != -1) {
            UniformTexture*t = new UniformTexture;
            t->mLocation = location;
            t->mTexture = CreateTexture2DFromPicture(imagePath);
            mUniformTextures.insert(std::pair<std::string, UniformTexture*>(name, t));
        }
    }else {
        iter->second->mTexture = CreateTexture2DFromPicture(name);
    }
}






