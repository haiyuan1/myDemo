//
//  QYViewController.m
//  ScrollViewWithZoom
//
//  Created by qingyun on 14-7-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController () <UIScrollViewDelegate>

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor orangeColor];
    
    scrollView.minimumZoomScale = 0.5f;
    scrollView.maximumZoomScale = 3.0f;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height * 2);
    
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"new_features_3.jpg"];
    imageView.tag = 111;
    [self.view addSubview:scrollView];
    [scrollView addSubview:imageView];
    
    UIImageView *antherImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    antherImageView.image = [UIImage imageNamed:@"new_features_2.jpg"];
    antherImageView.tag = 112;
    [scrollView addSubview:antherImageView];
}

#pragma mark - scrollView delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x > 280) {
        return [scrollView viewWithTag:111];
    } else {
        return [scrollView viewWithTag:112];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
