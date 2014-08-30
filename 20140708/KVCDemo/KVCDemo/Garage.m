//
//  Garage.m
//  KVCDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "Garage.h"

@implementation Garage

- (void)addCar:(Car *)car
{
    if (self.cars == nil) {
        self.cars = [[NSMutableArray alloc] initWithCapacity:4];
    }
    [self.cars addObject:car];
}

- (void)showGarageInfo
{
    NSLog(@"%@", self.name);
    for (Car *car in self.cars) {
        NSLog(@"%@", car);
    }
}

@end
