//
//  Garage.m
//  KVCSample
//
//  Created by zhangsf on 14-5-8.
//  Copyright (c) 2014年 zhangsf. All rights reserved.
//

#import "Garage.h"
@implementation Garage
@synthesize name;
@synthesize cars;//具体实现set和get方法， 是由系统生成， 在生成的时候， 会考虑内存问题

- (void) addCar: (Car *) car
{
    if (cars == nil)
    {
        cars = [[NSMutableArray alloc] init];
    }
    [cars addObject: car];
} // addCar

- (void) dealloc
{
    [name release];
    [cars release];
    [super dealloc];
} // dealloc

- (void) print
{
    NSLog (@"%@:", name);
    for (Car *car in cars)
    {
        NSLog (@" %@", car);
    }
} // print

@end // Car