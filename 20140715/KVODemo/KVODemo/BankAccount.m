//
//  BankAccount.m
//  KVODemo
//
//  Created by qingyun on 14-7-16.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount

-(id)initWithPerson:(Person *)person
{
    self = [super init];
    if (self) {
        _person = person;
        _accountBlance = 20000;
    }
    return self;
}

- (void)changeAccountBlance:(float)newValue
{
    self.accountBlance = newValue;
}

@end
