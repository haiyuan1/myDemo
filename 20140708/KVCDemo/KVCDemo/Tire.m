//
//  Tire.m
//  KVCDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "Tire.h"

@implementation Tire

- (id)copyWithZone:(NSZone *)zone
{
    Tire *cpTire = [[self class] allocWithZone:zone];
    cpTire.pressure = self.pressure;
    cpTire.tireName = self.tireName;
    return cpTire;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Tire name is %@, pressure is %ld", self.tireName, self.pressure];
}

@end
