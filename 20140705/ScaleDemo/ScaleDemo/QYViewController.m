//
//  QYViewController.m
//  ScaleDemo
//
//  Created by qingyun on 14-7-5.
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
	
    QYCustomView *bgView = [[QYCustomView alloc] initWithFrame:self.view.bounds];
    bgView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:bgView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
