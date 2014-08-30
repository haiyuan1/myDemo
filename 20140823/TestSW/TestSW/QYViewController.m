//
//  QYViewController.m
//  TestSW
//
//  Created by qingyun on 14-8-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

#import "QYRearViewController.h"
#import "QYFrontViewController.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	QYRearViewController *rearVC = [[QYRearViewController alloc] init];
    [self addChildViewController:rearVC];
    [self.view addSubview:rearVC.view];
    rearVC.view.frame = CGRectMake(10, 10, 320, 460);
    
    QYFrontViewController *frontVC = [[QYFrontViewController alloc] init];
    [self addChildViewController:frontVC];
    [self.view addSubview:frontVC.view];
    frontVC.view.frame = CGRectMake(250, 10, 320, 460);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
