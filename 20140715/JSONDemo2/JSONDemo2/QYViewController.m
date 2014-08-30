//
//  QYViewController.m
//  JSONDemo2
//
//  Created by qingyun on 14-7-15.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "JSONKit.h"
#import "QYPerson.h"

@interface QYViewController ()

@property (nonatomic, retain) QYPerson *person;

@end

typedef enum {
    moblePhoneNumber = 0,
    homePhoneNumber
} phones;

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSURL *jsonURL = [[NSBundle mainBundle] URLForResource:@"person" withExtension:@"json"];
    
    NSError *error = nil;
    NSString *strJson = [NSString stringWithContentsOfURL:jsonURL encoding:NSUTF8StringEncoding error:&error];
    if (error != nil) {
        NSLog(@"%@", error);
    }
    NSMutableArray *nameList = [strJson objectFromJSONString];
    for (NSDictionary *dicPerson in nameList) {
//        NSLog(@"%@", dicPerson);
        _person = [[QYPerson alloc] init];
        _person.name = [dicPerson objectForKey:@"name"];
        _person.mobilePhoneNumber = [dicPerson objectForKey:@"phone"][moblePhoneNumber];
        _person.homePhoneNumber = dicPerson[@"phone"][homePhoneNumber];
        _person.age = [dicPerson[@"age"]integerValue];
        _person.addrCountry = dicPerson[@"address"][@"country"];
        _person.addrProvince = dicPerson[@"address"][@"province"];
        _person.isMarried = [dicPerson[@"married"]boolValue];
        
            NSLog(@"%@", _person);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
