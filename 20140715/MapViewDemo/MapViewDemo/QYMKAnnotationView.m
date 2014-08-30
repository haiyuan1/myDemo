//
//  QYMKAnnotationView.m
//  MapViewDemo
//
//  Created by qingyun on 14-7-16.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYMKAnnotationView.h"
#import "QYViewController.h"

@implementation QYMKAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon_nav_start"];
        UIImageView *leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon"]];
        leftImageView.frame = CGRectMake(0, 0, 40, 40);
        self.leftCalloutAccessoryView = leftImageView;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [button addTarget:self.delegate action:@selector(onButton) forControlEvents:UIControlEventTouchUpInside];
        self.rightCalloutAccessoryView = button;
        self.canShowCallout = YES;
    }
    return self;
}
#if 0

- (void)onButton
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Test" message:@"customAnnotation" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    [alertView show];
}

#endif
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
