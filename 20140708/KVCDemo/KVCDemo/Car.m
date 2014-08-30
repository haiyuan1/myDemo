//
//  Car.m
//  KVCDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "Car.h"
#import "Tire.h"
#import "Engine.h"

@implementation Car

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@,a %d %@ %.1f and %d doors and %ld tires engine.horsePower %ld engineName %@", self.name, self.model, self.make, self.mileage, self.numberOfDoors, self.tires.count, self.engine.horsePower, self.engine.engineName];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.tires = [[NSMutableArray alloc] initWithCapacity:4];
    }
    return self;
}

- (void)setTire:(Tire *)tire atIndex:(NSInteger)index
{
    self.tires[index] = tire;
}

@end
