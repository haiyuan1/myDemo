//
//  Car.h
//  KVCDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Engine;
@class Tire;

@interface Car : NSObject

@property (nonatomic, copy) Engine *engine;
@property (nonatomic, retain) NSMutableArray *tires;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *make;
@property (nonatomic, assign) int model;
@property (nonatomic, assign) int numberOfDoors;
@property (nonatomic, assign) float mileage;


-(void)setTire:(Tire *)tire atIndex:(NSInteger)index;

@end
