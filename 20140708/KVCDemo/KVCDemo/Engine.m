//
//  Engine.m
//  KVCDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "Engine.h"

@implementation Engine

- (id)copyWithZone:(NSZone *)zone
{
    Engine *cpEngine = [[self class] allocWithZone:zone];
    cpEngine.horsePower = self.horsePower;
    cpEngine.engineName = self.engineName;
    return cpEngine;
}

@end
