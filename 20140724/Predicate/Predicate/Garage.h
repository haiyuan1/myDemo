//
//  Garage.h
//  KVCSample
//
//  Created by zhangsf on 14-5-8.
//  Copyright (c) 2014年 zhangsf. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Car;
@interface Garage : NSObject
{
    NSString *name;
    NSMutableArray *cars;
}
@property (readwrite, copy) NSString *name;
@property (nonatomic, copy) NSMutableArray *cars; //声明了set和get方法
- (void) addCar: (Car *) car;
- (void) print;
@end // Garage
