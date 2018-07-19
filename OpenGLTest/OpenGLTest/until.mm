//
//  until.cpp
//  OpenGLTest
//
//  Created by EDZ on 2018/7/19.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#include "until.hpp"
#import <UIKit/UIKit.h>
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

char*  loadPicture(const char* strPath,int &width,int &height)
{
    NSString* strPaths = [NSString stringWithUTF8String:strPath];
    UIImage *img = [UIImage imageNamed:strPaths];
    // 将图片数据以RGBA的格式导出到textureData中
    CGImageRef imageRef = [img CGImage];
    width = (int)CGImageGetWidth(imageRef);
    height = (int)CGImageGetHeight(imageRef);
    
    char *textureData = (char *)malloc(width * height * 4);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    
    CGContextRef context = CGBitmapContextCreate(textureData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    return textureData;
}
