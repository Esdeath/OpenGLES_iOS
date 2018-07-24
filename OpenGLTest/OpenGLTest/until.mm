//
//  until.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/19.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#include "until.hpp"
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

GLuint CreateTexture2D(unsigned char*pixelData, int width, int height, GLenum type);

/**
 加载文件数据
 
 @param fileName 文件名
 @param fileSize 文件大小
 @return 数据内容
 */
char* loadFileCode(const char* fileName ,int &fileSize)
{
    char* fileContent=nullptr;
    fileSize=0;
    NSString *nsPath=[[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:fileName] ofType:nil];
    NSData*data=[NSData dataWithContentsOfFile:nsPath];
    if([data length]>0){
        fileSize=(int)[data length];
        fileContent=new  char[fileSize+1];
        memcpy(fileContent, [data bytes], fileSize);
        fileContent[fileSize]='\0';
    }
    return fileContent;
}



GLuint CreateBufferObject(GLenum bufferType, GLsizeiptr size, GLenum usage, void*data /* = nullptr */){
    GLuint object;
    //1.生成新的vbo（顶点缓存对象）
    glGenBuffers(1, &object);
    //2.将顶点缓存对象绑定到顶点数组对象
    glBindBuffer(bufferType, object);
    //3.将数据拷贝到缓存对象
    glBufferData(bufferType, size, data, usage);
    glBindBuffer(bufferType, 0);
    return object;
}


GLuint CreateTexture2D(unsigned char*pixelData, int width, int height, GLenum type) {
    GLuint texture;
    glGenTextures(1, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

    glTexImage2D(GL_TEXTURE_2D, 0, type, width, height, 0, type, GL_UNSIGNED_BYTE, pixelData);
    glGenerateMipmap(GL_TEXTURE_2D);
    return texture;
}


GLuint CreateTexture2DFromPicture(const char *imgFilePath) {
    
    int width, height, nrChannels;
    NSString *nsPath=[[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:imgFilePath] ofType:nil];
    char* strPath = (char*)[nsPath UTF8String];
    unsigned char *pixelData = stbi_load(strPath, &width, &height, &nrChannels, 0);
    GLuint texture = CreateTexture2D((unsigned char*)pixelData, width, height, GL_RGB);

    return texture;
}

/**
 创建程序
 
 @param fragmentShader 片段shader
 @param vertexShader 顶点shader
 @return 程序的标识符
 */
GLuint createProgram(GLuint fragmentShader, GLuint vertexShader)
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



/**
 创建shader
 
 @param shaderName shader的代码
 @param shaderType shader类型
 @return 返回shader标识符
 */
GLuint createShader(const char *shaderName, GLenum shaderType)
{
    //1.根据shaderType来创建shader
    GLuint shader =   glCreateShader(shaderType);
    if (shader == 0){
        printf("glCreateShader fail\n");
        return 0;
    }
    int fileSize = 0;
    const char* shaderCode = loadFileCode(shaderName, fileSize);
    if (shaderCode == nullptr){
        printf("load shader code from file : %s fail\n", shaderCode);
        glDeleteShader(shader);
        delete shaderCode;
        return 0;
    }
    
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
    delete shaderCode;
    return shader;
}

