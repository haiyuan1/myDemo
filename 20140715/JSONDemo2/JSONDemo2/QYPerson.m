//
//  QYPerson.m
//  JSONDemo2
//
//  Created by qingyun on 14-7-15.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYPerson.h"

@implementation QYPerson

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@, mobilePhone:%@, homePhone:%@, age:%d, addrCountry:%@, addrProvice:%@, married:%@", self.name, self.mobilePhoneNumber, self.homePhoneNumber, self.age, self.addrCountry, self.addrProvince, (self.isMarried ? @"YES" : @"NO")];
}

@end
