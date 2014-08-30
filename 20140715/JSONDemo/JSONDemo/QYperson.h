//
//  QYperson.h
//  JSONDemo
//
//  Created by qingyun on 14-7-15.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYperson : NSObject

@property (nonatomic, retain) NSMutableArray *phones;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, retain) NSDictionary *address;
@property (nonatomic, assign) NSString *married;

@end
