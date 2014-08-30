//
//  QYViewController.m
//  QuartzView
//
//  Created by qingyun on 14-7-10.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "QYCustomView.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	QYCustomView *quartzView = [[QYCustomView alloc] initWithFrame:self.view.bounds];
    quartzView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:quartzView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
