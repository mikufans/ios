//
//  AppDelegate.m
//  helloios
//
//  Created by WL-DZ-PGDN-007 on 14-11-13.
//  Copyright (c) 2014年 Mac-Yang. All rights reserved.
//

#import "AppDelegate.h"
#import "plus.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    plus *p = [[plus alloc]init];
    self.window.rootViewController = p;
    
//    
//    firstController *first = [[firstController alloc] init];
//    first.title = @"first view";
//    
//    secondController * second = [[secondController alloc]init];
//    second.title = @"second title";
//    
//    UITabBarItem *firstitem = [[UITabBarItem alloc] initWithTitle:@"first" image:nil tag:1];
//    first.tabBarItem = firstitem;//why
//    
//    UITabBarItem *seconditem = [[UITabBarItem alloc] initWithTitle:@"second" image:nil tag:2];
//    
//    [seconditem setBadgeValue:@"2"];//加了图片可能就在右上角了
//    second.tabBarItem = seconditem;//why 控制器装载控制器 组件添加到控制器上
//    
//    self.tb = [[UITabBarController alloc] init];
//    //self.tb.delegate = self;
//    self.tb.viewControllers = [NSArray arrayWithObjects:first,second, nil];
//    
//    self.window.rootViewController = self.tb;
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
