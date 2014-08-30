//
//  QYViewController.m
//  ScrollViewWithPageControl
//
//  Created by qingyun on 14-7-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "QYLoginViewController.h"

@interface QYViewController () <UIScrollViewDelegate>

@property (nonatomic, retain) UIScrollView *bgScrollView;

@end

@implementation QYViewController
{
    UIPageControl *pageControl;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.bgScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.bgScrollView.backgroundColor = [UIColor orangeColor];
    //分页
    self.bgScrollView.pagingEnabled = YES;
    //方向锁定
    self.bgScrollView.directionalLockEnabled = YES;
    self.bgScrollView.showsHorizontalScrollIndicator = NO;
    self.bgScrollView.showsVerticalScrollIndicator = NO;
    self.bgScrollView.delegate = self;
    self.bgScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    
    for (int i = 0; i < 5; i++) {
        NSString *imagName = [NSString stringWithFormat:@"new_features_%d.jpg", i + 1];
        NSLog(@"%@", imagName);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*(i), 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        imageView.image = [UIImage imageNamed:imagName];
        [self.bgScrollView addSubview:imageView];
    }
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(30, self.view.bounds.size.height - 40, 260, 40)];
    pageControl.numberOfPages = 5;
    pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:self.bgScrollView];
    [self.view addSubview:pageControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ((scrollView.contentOffset.x - self.view.bounds.size.width * 4) > 80) {
        QYLoginViewController *loginView = [[QYLoginViewController alloc] init];
        [self presentViewController:loginView animated:YES completion:nil];
    }
    
    pageControl.currentPage = (scrollView.contentOffset.x / self.view.bounds.size.width);
}

@end
