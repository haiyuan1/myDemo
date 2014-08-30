//
//  Engine.h
//  KVCDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Engine : NSObject <NSCopying>

@property (nonatomic, assign) NSInteger horsePower;
@property (nonatomic, retain) NSString *engineName;

@end
