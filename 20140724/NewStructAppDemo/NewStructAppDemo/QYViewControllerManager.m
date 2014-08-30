//
//  QYViewControllerManager.m
//  NewStructAppDemo
//
//  Created by qingyun on 14-7-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewControllerManager.h"
#import "QYLoginViewController.h"
#import "QYUserGuideViewController.h"
#import "QYMainViewController.h"

@implementation QYViewControllerManager

+ (void)presentViewControllerWithType:(QYViewControllerType)type
{
    UIViewController *viewController = [[[self alloc] init] controllerByType:type];
    UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
    mainWindow.rootViewController = viewController;
}

- (UIViewController *)controllerByType:(QYViewControllerType)type
{
    UIViewController *viewController = nil;
    switch (type) {
        case QYViewControllerTypeLoginView:
            viewController = [[QYLoginViewController alloc] init];
            break;
        case QYViewControllerTypeMainView:
            viewController = [[QYMainViewController alloc] init];
            break;
        case QYViewControllerTypeUserGuideView:
            viewController = [[QYUserGuideViewController alloc] init];
            break;
            
        default:
            break;
    }
    return viewController;
}

@end
