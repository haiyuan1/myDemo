//
//  HYViewControllerManager.m
//  HYWeiBoDemo
//
//  Created by qingyun on 14-7-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "HYViewControllerManager.h"
#import "HYUserGuideViewController.h"
#import "HYLoginViewController.h"
#import "HYMainViewController.h"


@implementation HYViewControllerManager

+ (void)presentViewControllerWithType:(HYViewControllerType)type
{
    UIViewController *retViewController = [[[self alloc] init] controllerByType:type];
    AppDelegate.window.rootViewController = retViewController;
}

- (UIViewController *)controllerByType:(HYViewControllerType)type
{
    UIViewController *retViewController = nil;
    switch (type) {
        case HYViewControllerTypeUserGuideView:
            retViewController = [[HYUserGuideViewController alloc] init];
            break;
        case HYViewControllerTypeLoginView:
            retViewController = [[HYLoginViewController alloc] init];
            break;
        case HYViewControllerTypeMainView:
            retViewController = [[HYMainViewController alloc] init];
            break;
        default:
            break;
    }
    return retViewController;
}

@end
