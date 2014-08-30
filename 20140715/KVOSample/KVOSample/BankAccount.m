//
//  BankAccount.m
//  KVOSample
//
//  Created by qingyun on 14-7-16.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount

- (id)initWithPerson:(Person *)preson
{
    self = [super init];
    if (self) {
        _person = preson;
        _accountBlance = 20000;
    }
    return self;
}

- (void)changeAccountBlance:(float)newValue
{
    self.accountBlance = newValue;
}

@end
