//
//  Person.m
//  KVOSample
//
//  Created by qingyun on 14-7-16.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    float newValue = [[change valueForKeyPath:NSKeyValueChangeNewKey] floatValue];
    float oldValue = [[change valueForKeyPath:NSKeyValueChangeOldKey] floatValue];
    
    NSLog(@"尊敬的客户您好,您的当前消费金额为%.2f,账户余额为%.2f", newValue, oldValue - newValue);
}

@end
