//
//  ShaderProgram.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/2.
//  Copyright © 2018年 EDZ. All rights reserved.
//

//1.顶点数据 ---- 顶点着色器 ---- 图元装配 ----- 几何着色器 ----- 测试与混合 ----- 片段着色器 -----光栅化
#include "ShaderProgram.hpp"
ShaderProgram::ShaderProgram()
{
    mProgram = 0;
}

void ShaderProgram::Init(const char* vs , const char* fs)
{
    int fileSize = 0;
    //1.片段着色器的代码
    char* fragmentShaderCode = loadFileCode(fs, fileSize);
    //2.顶点着色器的代码
    char* vertexShaderCode   = loadFileCode(vs, fileSize);
    //3.创建片段着色器
    GLuint fragmentShader    = createShader(fragmentShaderCode, GL_FRAGMENT_SHADER);
    if (fragmentShader == 0) {
        return ;
    }
    //4.创建顶点着色器
    GLuint vertexShader  =  createShader(vertexShaderCode, GL_VERTEX_SHADER);
    
    if (vertexShader == 0) {
        return ;
    }
    
    //5.使用顶点着色器和片段着色器创建程序
    mProgram =  createProgram(fragmentShader, vertexShader);
    if (mProgram != 0) {
        //glGetAttribLocation获取顶点着色器 attribute修饰的变量名的index。可以通过这个index向顶点着色器传递数据
        mPositionLocation = glGetAttribLocation(mProgram, "position");
        mColorLocation    = glGetAttribLocation(mProgram, "color");
        mTexCoordLocation = glGetAttribLocation(mProgram, "aTexCoord");
        
        mModelMatrixLocation = glGetUniformLocation(mProgram, "ModelMatrix");
        mViewMatrixLocation = glGetUniformLocation(mProgram, "ViewMatrix");
        mProjectionMatrixLocation = glGetUniformLocation(mProgram, "ProjectionMatrix");
        mIT_ModelMatrix = glGetUniformLocation(mProgram, "IT_ModelMatrix");
        mNormalLocation = glGetAttribLocation(mProgram, "normal");
    }
    
    delete fragmentShaderCode ;
    delete vertexShaderCode;
}

void ShaderProgram::Draw(float* vertex,float *M,float *V,float  *P)
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
    
    //2.激活顶点坐标数组
    glEnableVertexAttribArray(mPositionLocation);
    //将顶点坐标传入到着色器中
    glVertexAttribPointer(mPositionLocation, 3, GL_FLOAT, GL_FALSE, 8*sizeof(*vertex), (void*)0);
    //3.激活顶点颜色数组
    glEnableVertexAttribArray(mColorLocation);
    //将顶点颜色传入到着色器中
    glVertexAttribPointer(mColorLocation, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(*vertex), (void*)(sizeof(*vertex)*3));
    //4.激活纹理
    glEnableVertexAttribArray(mTexCoordLocation);
    glVertexAttribPointer(mTexCoordLocation, 2, GL_FLOAT, GL_FALSE, 8 * sizeof(*vertex), (void*)(6 * sizeof(*vertex)));

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


/**
 创建shader

 @param shaderCode shader的代码
 @param shaderType shader类型
 @return 返回shader标识符
 */
GLuint ShaderProgram::createShader(const char *shaderCode, GLenum shaderType)
{
    //1.根据shaderType来创建shader
    GLuint shader =   glCreateShader(shaderType);
    //2.将shader和shader代码绑定
    glShaderSource(shader, 1, &shaderCode, nullptr);
    //3.编译shader
    glCompileShader(shader);
    
    GLint compileResult = GL_TRUE;
    //4.获取shader的编译信息
    glGetShaderiv(shader, GL_COMPILE_STATUS, &compileResult);
    
    if (compileResult ==GL_FALSE) {
        char szLog[1024] = {0};
        GLsizei logLen  = 0;
        glGetShaderInfoLog(shader, 1024, &logLen, szLog);
        printf("Compile Shader fail error log : %s \nshader code :\n%s\n", szLog, shaderCode);
        glDeleteShader(shader);
        shader = 0;
    }
    return shader;
}

/**
 创建程序

 @param fragmentShader 片段shader
 @param vertexShader 顶点shader
 @return 程序的标识符
 */
GLuint ShaderProgram::createProgram(GLuint fragmentShader, GLuint vertexShader)
{
    //1.创建shader程序
    GLuint program = glCreateProgram();
    //2.将片段shader和顶点shader绑定到程序上去
    glAttachShader(program, fragmentShader);
    glAttachShader(program, vertexShader);
    //3.链接程序
    glLinkProgram(program);
    //4.将片段shader和顶点shader 同  程序解除绑定
    glDetachShader(program, fragmentShader);
    glDetachShader(program, vertexShader);
    
    //5.删除顶点shader和片段shader
    glDeleteShader(fragmentShader);
    glDeleteShader(vertexShader);
    
    GLint nResult;
    //6.获取程序结果的信息
    glGetProgramiv(program, GL_LINK_STATUS, &nResult);
    
    if (nResult == GL_FALSE) {
        char log[1024] = {0};
        GLsizei writed = 0;
        glGetProgramInfoLog(program, 1024, &writed, log);
        printf("Create gpu program fail,link error : %s\n", log);
        glDeleteProgram(program);
        program = 0;
    }
    return program;
}




