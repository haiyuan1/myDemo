//
//  QYViewController.m
//  testToolBarDemo
//
//  Created by qingyun on 14-8-1.
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
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 44, 320, 44)];
    NSMutableArray *buttons = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0 + 40*i, 0, 40, 30)];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:button];
        [buttons addObject:btn];
    }
    [toolBar setItems:buttons];
    [self.view addSubview:toolBar];
    
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
