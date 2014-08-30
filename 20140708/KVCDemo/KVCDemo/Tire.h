//
//  Tire.h
//  KVCDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tire : NSObject <NSCopying>

@property (nonatomic, assign) NSInteger pressure;
@property (nonatomic, retain) NSString *tireName;

@end
