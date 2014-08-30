//
//  QYperson.m
//  JSONDemo
//
//  Created by qingyun on 14-7-15.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYperson.h"

@implementation QYperson

- (NSString *)description
{
    return [NSString stringWithFormat:@"phones:%@, name:%@, age:%d, address:%@, married:%@", self.phones, self.name, self.age, self.address, self.married];
}

@end
