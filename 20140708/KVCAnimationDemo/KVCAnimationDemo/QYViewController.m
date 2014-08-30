//
//  QYViewController.m
//  KVCAnimationDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}
- (IBAction)setAnimation:(UIButton *)sender {
 //直线移动
#if 0
    _animationView.layer.position = CGPointMake(30, 30);
    _animationView.layer.anchorPoint = CGPointMake(0, 0);
    CGPoint startPoint = CGPointMake(30, 30);
    CGPoint endPoint = CGPointMake(200, 300);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setFromValue:[NSValue valueWithCGPoint:startPoint]];
    [animation setToValue:[NSValue valueWithCGPoint:endPoint]];
    [animation setDuration:0.1f];
    animation.autoreverses = YES;
    animation.repeatCount=6;
    [_animationView.layer setPosition:startPoint];
    [_animationView.layer addAnimation:animation forKey:nil];
#endif
    
    _animationView.layer.position = CGPointMake(100, 100);
    _animationView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    _animationView.layer.bounds = CGRectMake(0, 0, 100, 100);
    
//    [_animationView.layer transform];
#if 0
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pulse.duration = 0.01 + (rand() % 10)*0.000001;
    pulse.repeatCount = 100000;
    pulse.autoreverses = YES;
    pulse.fromValue = [NSNumber numberWithFloat:1];
    pulse.toValue = [NSNumber numberWithFloat:2];
    
    [_animationView.layer addAnimation:pulse forKey:nil];
#endif
#if 0
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animation.duration = 1.0f;
    animation.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 30, 30)];
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    animation.byValue = [NSValue valueWithCGRect:_animationView.bounds];
//    animation.toValue = (id)[UIColor redColor].CGColor;
//    animation.fromValue = (id)[UIColor blackColor].CGColor;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.repeatCount = 1;
    animation.autoreverses = YES;
    
    
    [self.animationView.layer addAnimation:animation forKey:nil];
#endif
#if 0
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    anim.duration = 1.f;
    anim.fromValue = [NSNumber numberWithFloat:0.f];
    anim.toValue = [NSNumber numberWithFloat:100.f];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.repeatCount = CGFLOAT_MAX;
    anim.autoreverses = YES;
    
    [_animationView.layer addAnimation:anim forKey:nil];
#endif
    
    CABasicAnimation *animation = [[self class] opacityForever_Animation:1.0f];
    [_animationView.layer addAnimation:animation forKey:nil];
    
}

+(CABasicAnimation *)opacityForever_Animation:(float)time //永久闪烁的动画

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    
  animation.fromValue=[NSNumber numberWithFloat:1.0];
    
  animation.toValue=[NSNumber numberWithFloat:0.0];
    
  animation.autoreverses=YES;
    
  animation.duration=time;
    
  animation.repeatCount=FLT_MAX;
    
  animation.removedOnCompletion=NO;
    
  animation.fillMode=kCAFillModeForwards;
 
  return animation;
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
