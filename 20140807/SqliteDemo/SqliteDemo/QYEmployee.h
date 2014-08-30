//
//  QYEmployee.h
//  SqliteDemo
//
//  Created by qingyun on 14-8-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYEmployee : NSObject

@property (nonatomic, assign) int eID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, assign) double salary;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, retain) NSString *birthday;

@end
