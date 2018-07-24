//
//  until.hpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/19.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#ifndef until_hpp
#define until_hpp

#include <stdio.h>
#include "ggl.h"
char*  loadFileCode(const char* fileName ,int &fileSize);

GLuint CreateBufferObject(GLenum bufferType, GLsizeiptr size, GLenum usage, void*data = nullptr);

GLuint CreateTexture2DFromPicture(const char *imgFilePath) ;

GLuint createProgram(GLuint fragmentShader , GLuint vertexShader);
GLuint createShader(const char* shaderCode, GLenum shaderType);

#endif /* until_hpp */
