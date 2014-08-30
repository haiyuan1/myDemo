//
//  QYViewController.m
//  QuartzDemo
//
//  Created by qingyun on 14-7-10.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "QYCustomView.h"

@interface QYViewController ()

@property (nonatomic, retain) QYCustomView *greenView;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.greenView = [[QYCustomView alloc] initWithFrame:CGRectMake(30, 100, 50, 50)];
    self.greenView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.greenView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(30, 300, 100, 30)];
    [button setTitle:@"动画" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doAnimation:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:button];
}

- (void)doAnimation:(UIButton *)sender
{
    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, CGRectMake(0, 0, 300, 400));
    CGPathMoveToPoint(path, NULL, 30, 30);
    
       CGPathAddCurveToPoint(path, NULL, 30, 30, 100, 100, 300, 400);
    
    CAKeyframeAnimation *animation = [[self class] keyframeAnimation:path durTimes:2.0f Rep:CGFLOAT_MAX];
    [self.greenView.layer addAnimation:animation forKey:nil];
}

+ (CAKeyframeAnimation *)keyframeAnimation:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.path = path;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.autoreverses = NO;
    animation.duration = time;
    animation.repeatCount = repeatTimes;
    
    return animation;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
