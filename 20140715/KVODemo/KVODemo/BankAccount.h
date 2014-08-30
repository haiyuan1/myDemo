//
//  BankAccount.h
//  KVODemo
//
//  Created by qingyun on 14-7-16.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface BankAccount : NSObject

@property (nonatomic, retain) Person *person;
@property (nonatomic, assign) float accountBlance;

- (id)initWithPerson:(Person *)person;

- (void)changeAccountBlance:(float)newValue;

@end
