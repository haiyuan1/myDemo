//
//  QYTestViewController.m
//  testBlockDemo
//
//  Created by qingyun on 14-8-27.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYTestViewController.h"

@interface QYTestViewController ()

@end

@implementation QYTestViewController

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
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 200, 120, 80);
    button.titleLabel.text = @"返回";
    button.titleLabel.textColor = [UIColor blueColor];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(backVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backVC:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:NULL];
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
