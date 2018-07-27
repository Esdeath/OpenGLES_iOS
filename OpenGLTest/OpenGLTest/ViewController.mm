//
//  ViewController.m
//  OpenGLTest
//
//  Created by EDZ on 2018/7/2.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#import "ViewController.h"
#import "Triangles.hpp"
@interface ViewController ()<GLKViewDelegate>
@property (nonatomic,strong) EAGLContext* content;
@end

@implementation ViewController

Triangles triangles;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建OpenGLES2 的设备上下文
    EAGLContext* content;
    
    content = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES3];
    if (!content) {
        content = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    }
    self.content = content;
    
    GLKView* view = (GLKView*)self.view;
    view.delegate = self;
    view.context  = content;
    
    // 你的OpenGL上下文有一个缓冲区，它用以存储将在屏幕中显示的颜色。你可以使用其属性来设置缓冲区中每个像素的颜色格式。
    // 缺省值是GLKViewDrawableColorFormatRGBA8888，即缓冲区的每个像素的最小组成部分(-个像素有四个元素组成 RGBA)使用8个bit(如R使用8个bit)（所以每个像素4个字节 既 4*8 个bit）。这非常好，因为它给了你提供了最广泛的颜色范围，让你的app看起来更好。
    // 但是如果你的app允许更小范围的颜色，你可以设置为GLKViewDrawableColorFormatRGB565，从而使你的app消耗更少的资源（内存和处理时间）。
    
    view.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    
    // drawableDepthFormat
    //OpenGL上下文还可以（可选地）有另一个缓冲区，称为深度缓冲区。这帮助我们确保更接近观察者的对象显示在远一些的对象的前面（意思就是离观察者近一些的对象会挡住在它后面的对象）。
    // 其缺省的工作方式是：OpenGL把接近观察者的对象的所有像素存储到深度缓冲区，当开始绘制一个像素时，它（OpenGL）首先检查深度缓冲区，看是否已经绘制了更接近观察者的什么东西，如果是则忽略它（要绘制的像素，就是说，在绘制一个像素之前，看看前面有没有挡着它的东西，如果有那就不用绘制了）。否则，把它增加到深度缓冲区和颜色缓冲区。
    // 你可以设置这个属性，以选择深度缓冲区的格式。缺省值是GLKViewDrawableDepthFormatNone，意味着完全没有深度缓冲区。
    // 但是如果你要使用这个属性（一般用于3D游戏），你应该选择GLKViewDrawableDepthFormat16或GLKViewDrawableDepthFormat24。这里的差别是使用GLKViewDrawableDepthFormat16将消耗更少的资源，但是当对象非常接近彼此时，你可能存在渲染问题（）。
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    
    //设置上下文为当前上下文
    [EAGLContext setCurrentContext:content];
    

    triangles.Init();
}



- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    //1.设置用来清除颜色
    glClearColor(0.0, 0.0, 0.0, 1.0);
    //2.清除颜色缓存和深度缓存
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    triangles.Draw();
}


@end
