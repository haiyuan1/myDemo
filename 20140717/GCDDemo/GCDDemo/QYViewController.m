//
//  QYViewController.m
//  GCDDemo
//
//  Created by qingyun one 14-7-17.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
/*
- (NSString *)fetchSomeThingFromServer
{
    [NSThread sleepForTimeInterval:1];
    return @"Hello";
}

- (NSString *)calculateFirstResult:(NSString *)string
{
    [NSThread sleepForTimeInterval:2];
    return [NSString stringWithFormat:@"Number of chars is %d", string.length];
}

- (NSString *)calculateSecondResult:(NSString *)string
{
    [NSThread sleepForTimeInterval:3];
    return [string stringByReplacingOccurrencesOfString:@"e" withString:@"E"];
}

- (IBAction)progressHandle:(UIButton *)sender {
    NSDate *startTime = [NSDate date];
    [self.activity startAnimating];
    NSString *result = [self fetchSomeThingFromServer];
    NSString *secondResult = [self calculateFirstResult:result];
    NSString *thirdResult = [self calculateSecondResult:secondResult];
    
    NSLog(@"first result %@", result);
    NSLog(@"second result %@", secondResult);
    NSLog(@"last result %@", thirdResult);
    
    NSDate *endTime = [NSDate date];
    NSLog(@"the total time %f", [endTime timeIntervalSinceDate:startTime]);
    
}
*/

- (NSString *)fetchSomeThingFromServer
{
    [NSThread sleepForTimeInterval:1];
    return @"Hi there";
}

- (NSString *)progressString:(NSString *)data
{
    [NSThread sleepForTimeInterval:2];
    return [data uppercaseString];
}

- (NSString *)calculateFirstResult:(NSString *)data
{
    [NSThread sleepForTimeInterval:3];
    return [NSString stringWithFormat:@"Number of chars:%d", data.length];
}

- (NSString *)calculateSecondResult:(NSString *)data
{
    [NSThread sleepForTimeInterval:4];
    return [data stringByReplacingOccurrencesOfString:@"E" withString:@"e"];
}

- (void)showResult:(NSString *)first Second:(NSString *)second
{
    NSLog(@"First:%@, Second:%@",first, second);
}
- (IBAction)progressData:(UIButton *)sender {
    
    NSDate *startTime = [NSDate date];
    [self.activity startAnimating];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSString *result = [self fetchSomeThingFromServer];
        NSString *progressData = [self progressString:result];
        
        dispatch_group_t group = dispatch_group_create();
        __block NSString *firstResult;
        __block NSString *secondResult;
        
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            firstResult = [self calculateFirstResult:progressData];
        });
        
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            secondResult = [self calculateSecondResult:progressData];
        });
        
        dispatch_group_notify(group, queue, ^{
            [self showResult:firstResult Second:secondResult];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.activity stopAnimating];
            });
            NSLog(@"Completed finish %f seconds", [[NSDate date] timeIntervalSinceDate:startTime]);
        });
    });
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
