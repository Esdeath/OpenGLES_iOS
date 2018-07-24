//
//  TriData.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/24.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#include "TriData.hpp"

TriData::TriData()
{
    float vetex[32] = {
        //positions          //colors           //texture coords
        0.5f,   0.5f, 0.0f,   1.0f, 0.0f, 0.0f,   1.0f, 1.0f, // top right
        0.5f,  -0.5f, 0.0f,   0.0f, 1.0f, 0.0f,   1.0f, 0.0f, // bottom right
        -0.5f, -0.5f, 0.0f,   0.0f, 0.0f, 1.0f,   0.0f, 0.0f, // bottom left
        -0.5f,  0.5f, 0.0f,   1.0f, 1.0f, 0.0f,   0.0f, 1.0f  // top left
    };
    memset(m_vetex, 0, sizeof(m_vetex));
    memcpy(m_vetex, vetex, sizeof(vetex));
    
    float index[6] = {
        0, 1, 3, // first triangle
        1, 2, 3  // second triangle
    };
    memset(m_index, 0, sizeof(m_index));
    memcpy(m_index, index, sizeof(index));
}
