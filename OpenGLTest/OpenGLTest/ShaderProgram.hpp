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
    
    
    void setBool(const std::string &name, bool value) const
    {
        glUniform1i(glGetUniformLocation(mProgram, name.c_str()), (int)value);
    }
    void setInt(const std::string &name, int value) const
    {
        glUniform1i(glGetUniformLocation(mProgram, name.c_str()), value);
    }
    void setFloat(const std::string &name, float value) const
    {
        glUniform1f(glGetUniformLocation(mProgram, name.c_str()), value);
    }

    void setVec2(const std::string &name, const glm::vec2 &value) const
    {
        glUniform2fv(glGetUniformLocation(mProgram, name.c_str()), 1, &value[0]);
    }
    void setVec2(const std::string &name, float x, float y) const
    {
        glUniform2f(glGetUniformLocation(mProgram, name.c_str()), x, y);
    }
    void setVec3(const std::string &name, const glm::vec3 &value) const
    {
        glUniform3fv(glGetUniformLocation(mProgram, name.c_str()), 1, &value[0]);
    }
    void setVec3(const std::string &name, float x, float y, float z) const
    {
        glUniform3f(glGetUniformLocation(mProgram, name.c_str()), x, y, z);
    }

    void setVec4(const std::string &name, const glm::vec4 &value) const
    {
        glUniform4fv(glGetUniformLocation(mProgram, name.c_str()), 1, &value[0]);
    }
    void setVec4(const std::string &name, float x, float y, float z, float w)
    {
        glUniform4f(glGetUniformLocation(mProgram, name.c_str()), x, y, z, w);
    }
    void setMat2(const std::string &name, const glm::mat2 &mat) const
    {
        glUniformMatrix2fv(glGetUniformLocation(mProgram, name.c_str()), 1, GL_FALSE, &mat[0][0]);
    }
    void setMat3(const std::string &name, const glm::mat3 &mat) const
    {
        glUniformMatrix3fv(glGetUniformLocation(mProgram, name.c_str()), 1, GL_FALSE, &mat[0][0]);
    }
    
    void setMat4(const std::string &name, const glm::mat4 &mat) const
    {
        glUniformMatrix4fv(glGetUniformLocation(mProgram, name.c_str()), 1, GL_FALSE, &mat[0][0]);
    }
    
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
