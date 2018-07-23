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

#import "until.hpp"
#import "ggl.h"

struct UniformVector4f{
    GLint mLocation;
    float v[4];
    UniformVector4f() {
        mLocation = -1;
        memset(v,0,sizeof(float)*4);
    }
};

struct UniformTexture{
    GLint mLocation;
    GLuint mTexture;
    UniformTexture() {
        mLocation = -1;
        mTexture = 0;
    }
};

class ShaderProgram {
    
public:
    void Init(const char* vs , const char* fs);
    void Draw(float* vertex,float *M,float *V,float *P);
    
    void SetVec4(const char* name,float x, float y,float z, float w);
    void SetTexture(const char* name, const char* imagePath);

    ShaderProgram();
    
private:
    GLuint createProgram(GLuint fragmentShader , GLuint vertexShader);
    GLuint createShader(const char* shaderCode, GLenum shaderType);
    
private:
    GLuint mProgram;
    
    GLuint mPosition;
    GLuint mColor;
    GLuint mTexcoord;
    GLuint mNormal;
    
    GLuint mPositionLocation;
    GLuint mColorLocation;
    GLuint mTexCoordLocation;
    GLuint mNormalLocation;
    
    GLint mModelMatrixLocation, mViewMatrixLocation, mProjectionMatrixLocation,mIT_ModelMatrix;

    unordered_map<string, UniformVector4f*> mUniformVec4s;
    unordered_map<string, UniformTexture*>  mUniformTextures;
    
    

};

#endif /* ShaderProgram_hpp */
