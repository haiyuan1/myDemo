//
//  QYPerson.h
//  JSONDemo2
//
//  Created by qingyun on 14-7-15.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYPerson : NSObject

@property (nonatomic, retain) NSString *mobilePhoneNumber;
@property (nonatomic, retain) NSString *homePhoneNumber;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, retain) NSString *addrCountry;
@property (nonatomic, retain) NSString *addrProvince;
@property (nonatomic, assign) BOOL isMarried;

@end
