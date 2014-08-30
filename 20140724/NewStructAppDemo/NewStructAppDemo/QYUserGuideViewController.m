//
//  QYUserGuideViewController.m
//  NewStructAppDemo
//
//  Created by qingyun on 14-7-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYUserGuideViewController.h"

@interface QYUserGuideViewController () <UIScrollViewDelegate>

@property (nonatomic, retain) UIScrollView *scrollView;

@end

@implementation QYUserGuideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//- (IBAction)presentLoginView:(UIButton *)sender {
//    [QYViewControllerManager presentViewControllerWithType:QYViewControllerTypeLoginView];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.directionalLockEnabled = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height);
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*i, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height)];
        NSString *imageName = [NSString stringWithFormat:@"new_features_%d.jpg", i+1];
        imageView.image = [UIImage imageNamed:imageName];
        [self.scrollView addSubview:imageView];
    }
    [self.view addSubview:self.scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ((self.scrollView.contentOffset.x - self.view.bounds.size.width*4) > 100) {
        [QYViewControllerManager presentViewControllerWithType:QYViewControllerTypeLoginView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
