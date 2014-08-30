//
//  QYGuideViewController.m
//  AppStructDemo
//
//  Created by qingyun on 14-7-23.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYGuideViewController.h"
#import "QYLoginViewController.h"

@interface QYGuideViewController () <UIScrollViewDelegate>

@property (nonatomic, retain) UIScrollView *scrollView;

@end

@implementation QYGuideViewController

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
    [self preferredStatusBarStyle];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height);
    for (int i = 0; i < 5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"new_features_%d.jpg", i+1];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*i, self.view.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height)];
        imageView.image = [UIImage imageNamed:imageName];
        [self.scrollView addSubview:imageView];
    }
    [self.view addSubview:self.scrollView];
}
#if 0
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
#endif
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x - self.view.bounds.size.width*4 > 100) {
        QYLoginViewController *loginViewCtrl = [[QYLoginViewController alloc] init];
        [self.navigationController pushViewController:loginViewCtrl animated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
