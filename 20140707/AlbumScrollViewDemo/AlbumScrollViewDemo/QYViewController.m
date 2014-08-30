//
//  QYViewController.m
//  AlbumScrollViewDemo
//
//  Created by qingyun on 14-7-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "QYImageScrollView.h"

@interface QYViewController () <UIScrollViewDelegate>

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor darkGrayColor];
    scrollView.directionalLockEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*10, self.view.bounds.size.height);

    for (int i = 0; i < 10; i++) {
        QYImageScrollView *imageScrollView = [[QYImageScrollView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//        imageScrollView.delegate = self;
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i+1];
        imageScrollView.imageView.image = [UIImage imageNamed:imageName];
        imageScrollView.tag = i + 1;
        [scrollView addSubview:imageScrollView];
    }
    
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#if 0
#pragma mark - ScrollView delegate
- (UIView *)viewForZoomingInScrollView:(QYImageScrollView *)scrollView
{
    return scrollView.imageView;
}
#endif

static int preIndex = 0;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int curIndex = scrollView.contentOffset.x / 320 + 1;
    QYImageScrollView *imageScrollView = (QYImageScrollView *)[scrollView viewWithTag:preIndex];
    if (curIndex != preIndex &&imageScrollView.zoomScale != 1.0f) {
        imageScrollView.zoomScale = 1.0f;
    }
    preIndex = curIndex;
}

@end
