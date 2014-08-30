//
//  QYEmployee.m
//  SqliteDemo
//
//  Created by qingyun on 14-8-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYEmployee.h"

@implementation QYEmployee

- (NSString *)description
{
    return [NSString stringWithFormat:@"eID:%d,name:%@,age:%d,address:%@,salary:%f,sex:%@,birthday:%@", self.eID,self.name, self.age, self.address, self.salary, self.sex, self.birthday];
}

@end
