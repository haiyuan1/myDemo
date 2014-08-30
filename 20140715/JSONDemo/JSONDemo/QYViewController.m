//
//  QYViewController.m
//  JSONDemo
//
//  Created by qingyun on 14-7-15.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "QYperson.h"

@interface QYViewController ()

@property (nonatomic, retain) QYperson *person;
@property (nonatomic, retain) NSMutableArray *persons;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSURL *personUrl = [[NSBundle mainBundle] URLForResource:@"person" withExtension:@"json"];
//    NSLog(@"%@", personUrl);
    NSData *jsonData = [NSData dataWithContentsOfURL:personUrl];
    
    NSError *error = nil;
    _persons = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (error != nil) {
        NSLog(@"Error:%@", error);
    }
    for (NSDictionary *dicPers in _persons) {
        _person = [[QYperson alloc] init];
        NSMutableArray *phones = [dicPers objectForKey:@"phone"];
        _person.phones = phones;
        NSString *name = [dicPers objectForKey:@"name"];
        _person.name = name;
        NSInteger age = [[dicPers objectForKey:@"age"] intValue];
        _person.age = age;
        NSDictionary *address = [dicPers objectForKey:@"address"];
        _person.address = address;
        BOOL married = [[dicPers objectForKey:@"married"] boolValue];
        if (married) {
            _person.married = @"YES";
        } else {
            _person.married = @"NO";
        }
        _persons = [[NSMutableArray alloc] initWithCapacity:4];
        [self.persons addObject:_person];
        NSLog(@"%@", self.persons);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
