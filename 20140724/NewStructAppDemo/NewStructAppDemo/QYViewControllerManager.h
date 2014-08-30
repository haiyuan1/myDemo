//
//  QYViewControllerManager.h
//  NewStructAppDemo
//
//  Created by qingyun on 14-7-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, QYViewControllerType)
{
    QYViewControllerTypeUserGuideView,
    QYViewControllerTypeLoginView,
    QYViewControllerTypeMainView
};

@interface QYViewControllerManager : NSObject

+ (void)presentViewControllerWithType:(QYViewControllerType)type;
@end
