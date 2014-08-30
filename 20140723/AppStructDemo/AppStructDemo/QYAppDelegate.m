//
//  QYAppDelegate.m
//  AppStructDemo
//
//  Created by qingyun on 14-7-23.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYAppDelegate.h"
#import "QYMainViewController.h"
#import "QYGuideViewController.h"
#import "QYLoginViewController.h"

@implementation QYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunched"];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunched"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    QYMainViewController *mainViewCtrl = [[QYMainViewController alloc] init];
    self.nav = [[UINavigationController alloc] initWithRootViewController:mainViewCtrl];
    self.nav.navigationBarHidden = YES;
    self.window.rootViewController = self.nav;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunched"]) {
        QYGuideViewController *guideViewCtrl = [[QYGuideViewController alloc] init];
        [self.nav pushViewController:guideViewCtrl animated:YES];
    } else {
        QYLoginViewController *loginViewCtrl = [[QYLoginViewController alloc] init];
        [self.nav pushViewController:loginViewCtrl animated:YES];
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
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
