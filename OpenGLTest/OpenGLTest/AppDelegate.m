//
//  AppDelegate.m
//  OpenGLTest
//
//  Created by EDZ on 2018/7/2.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWindow* windows = [[UIWindow alloc]init];
    windows.rootViewController = [[ViewController alloc]init];
    [windows makeKeyAndVisible];
    self.window = windows;

    return YES;
}



@end
