//
//  ggl.h
//  OpenGLTest
//
//  Created by EDZ on 2018/7/21.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#ifndef ggl_h
#define ggl_h

#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>
#include <OpenGLES/ES3/gl.h>
#include <OpenGLES/ES3/glext.h>
#import <UIKit/UIKit.h>

#include <stdio.h>
#include <math.h>
#include <string.h>
#include <string>
#include <sstream>
#include <vector>
#include <functional>
#include <map>
#include <unordered_map>
#include "Glm/glm.hpp"
#include "Glm/ext.hpp"
using namespace std;

typedef struct {
    GLfloat Position[4];//位置
    GLfloat Normal[4];//法线
    GLfloat Color[4];//颜色
    GLfloat Texcoord[4];//纹理
} VertexStruct;

#endif /* ggl_h */
