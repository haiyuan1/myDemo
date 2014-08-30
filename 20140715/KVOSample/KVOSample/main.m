//
//  main.m
//  KVOSample
//
//  Created by qingyun on 14-7-16.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "BankAccount.h"

int main(int argc, const char * argv[])
{
    Person *person = [[Person alloc] init];
    person.name = @"zhangsan";
    
    BankAccount *account = [[BankAccount alloc] initWithPerson:person];
    
    [account addObserver:person forKeyPath:@"accountBlance" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionPrior context:nil];
    [account changeAccountBlance:700];
    [account changeAccountBlance:10000];
    
    [[NSRunLoop currentRunLoop] run];
    
    return 0;
}

