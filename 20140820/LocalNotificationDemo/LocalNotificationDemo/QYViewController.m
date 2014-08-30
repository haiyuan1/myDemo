//
//  QYViewController.m
//  LocalNotificationDemo
//
//  Created by qingyun on 14-8-20.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *now = [NSDate date];
    NSDate *fireDate = [NSDate dateWithTimeInterval:8.0f sinceDate:now];
    localNotification.fireDate = fireDate;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.alertBody = @"峰兄龙兄";
    localNotification.alertAction = @"龙兄";
//    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.soundName = @"msgcome.wav";
    localNotification.applicationIconBadgeNumber = 2;
    localNotification.userInfo = @{@"name": @"王德龙"};
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
