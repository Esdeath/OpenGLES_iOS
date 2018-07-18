//
//  Triangles.hpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/13.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#ifndef Triangles_hpp
#define Triangles_hpp

#include <stdio.h>
#include "Vertex.hpp"
#include "ShaderProgram.hpp"

class Triangles {

private:
    Vertex *m_vertex;
    ShaderProgram *m_shaderProgram;
public:
    void Init();
    void Draw();
    
    Triangles();
    ~Triangles();
};

#endif /* Triangles_hpp */
