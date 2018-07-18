//
//  MyOpenGLView.m
//  MyApp
//
//  Created by EDZ on 2018/6/27.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#import "MyOpenGLView.h"
#include "scene.hpp"
@implementation MyOpenGLView

-(void)prepareOpenGL{
    [super prepareOpenGL];
    scene_init();
    [NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(renderOneFrame) userInfo:nil repeats:YES];
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    scene_draw();
    glFlush();
}
-(void)renderOneFrame{
    [self setNeedsDisplay:YES];
}
@end
