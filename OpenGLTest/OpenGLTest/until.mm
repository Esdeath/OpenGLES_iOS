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




