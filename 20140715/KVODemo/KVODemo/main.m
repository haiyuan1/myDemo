//
//  main.m
//  KVODemo
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
    
    BankAccount *bankAccount = [[BankAccount alloc] initWithPerson:person];
    [bankAccount addObserver:person forKeyPath:@"accountBlance" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    [bankAccount changeAccountBlance:500];
    [[NSRunLoop currentRunLoop] run];
    return 0;
}

