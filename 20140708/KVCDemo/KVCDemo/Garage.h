//
//  Garage.h
//  KVCDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;

@interface Garage : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSMutableArray *cars;

- (void) addCar:(Car *)car;
- (void) showGarageInfo;

@end
