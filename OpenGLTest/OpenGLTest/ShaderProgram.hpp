//
//  ShaderProgram.hpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/2.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#ifndef ShaderProgram_hpp
#define ShaderProgram_hpp

#include <stdio.h>
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>
#include <OpenGLES/ES3/gl.h>
#include <OpenGLES/ES3/glext.h>

class ShaderProgram {
    
public:
    void Init();
    void Draw(float* vertex);

    ShaderProgram();
private:
    char*  loadFileCode(const char* fileName ,int &fileSize);
    GLuint createProgram(GLuint fragmentShader , GLuint vertexShader);
    GLuint createShader(const char* shaderCode, GLenum shaderType);
    
private:
    GLuint mProgram;
    
    GLuint mPosition;
    GLuint mColor;
    
    GLuint mPositionLocation;
    GLuint mColorLocation;
    GLuint mColorUniform;
};

#endif /* ShaderProgram_hpp */
