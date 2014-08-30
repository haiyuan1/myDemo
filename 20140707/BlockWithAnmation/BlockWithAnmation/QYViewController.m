//
//  QYViewController.m
//  BlockWithAnmation
//
//  Created by qingyun on 14-7-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonTapped:(UIButton *)sender {
    CGPoint center = self.blueView.center;
    [UIView transitionWithView:self.blueView duration:2.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.blueView.center = CGPointMake(center.x + 200, center.y + 200);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3.0f animations:^{
            self.blueView.center = center;
        }];
    }];
}
- (IBAction)antherButtonAction:(UIButton *)sender {
    
    [UIView transitionFromView:self.antherView toView:self.blueView duration:3 options:UIViewAnimationOptionCurveEaseInOut completion:^(BOOL finished) {
        self.antherView.center = self.blueView.center;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
