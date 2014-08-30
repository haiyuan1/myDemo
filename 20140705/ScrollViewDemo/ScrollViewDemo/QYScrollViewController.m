//
//  QYScrollViewController.m
//  ScrollViewDemo
//
//  Created by qingyun on 14-7-5.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYScrollViewController.h"

@interface QYScrollViewController () <UIScrollViewDelegate>

@property (nonatomic, retain) UIScrollView *scrollView;

@end

@implementation QYScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.backgroundColor = [UIColor orangeColor];
    self.scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
    
    self.scrollView.contentSize = CGSizeMake(160*4, 480*8);
    self.scrollView.contentOffset = CGPointMake(50, 50);
    
    self.scrollView.scrollsToTop = YES;
    self.scrollView.bounces = NO;
    self.scrollView.bouncesZoom = YES;
    self.scrollView.pagingEnabled = YES;
    
    self.scrollView.directionalLockEnabled = YES;
    
    self.scrollView.contentInset = UIEdgeInsetsMake(160, 100, 160, 200);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.text = @"testLabel";
    label.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:label];
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
