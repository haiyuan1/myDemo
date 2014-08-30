//
//  QYViewController.m
//  AnimationDemo
//
//  Created by qingyun on 14-7-10.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)doAnimation:(UIButton *)sender {
    CABasicAnimation *animationOne = [[self class] opacityForever_Animation:1.0f];
    [self.blueView.layer addAnimation:animationOne forKey:nil];
    
    CABasicAnimation *animationTwo = [[self class] moveX:1.0f X:[NSNumber numberWithFloat:200.0f]];
    [self.blueView.layer addAnimation:animationTwo forKey:nil];
    
    CABasicAnimation *animationThree = [[self class] moveY:1.0f Y:[NSNumber numberWithFloat:200]];
    [self.blueView.layer addAnimation:animationThree forKey:nil];
    
    CABasicAnimation *animationFour = [[self class] scale:[NSNumber numberWithFloat:5.0f] orgin:[NSNumber numberWithFloat:0.1f] durTimes:3.0f Rep:4.0f];
//    self.blueView.layer.anchorPoint = CGPointMake(0, 0);
    animationFour.repeatCount = FLT_MAX;
    [self.blueView.layer addAnimation:animationFour forKey:nil];
    
    CABasicAnimation *animationFive = [[self class] movepoint:CGPointMake(200, 200)];
    [self.blueView.layer addAnimation:animationFive forKey:nil];
    
    CABasicAnimation *animationSix = [[self class] rotation:3.0f degree:M_PI_4 direction:1 repeatCount:FLT_MAX];
    [self.blueView.layer addAnimation:animationSix forKey:nil];
    
    CAAnimationGroup *animations = [[self class] groupAnimation:@[animationOne, animationTwo, animationThree, animationFour, animationFive, animationSix] durTimes:4 Rep:FLT_MAX];
    [self.blueView.layer addAnimation:animations forKey:nil];
    
}

+(CABasicAnimation *)opacityForever_Animation:(float)time
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

+ (CABasicAnimation *)moveX:(float)time X:(NSNumber *)x
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.toValue = x;
    animation.duration = time;
    animation.removedOnCompletion = NO;
    animation.repeatCount = FLT_MAX;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

+ (CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.toValue = y;
    animation.duration = time;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = FLT_MAX;
    animation.autoreverses = YES;
    return animation;
}

+ (CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = orginMultiple;
    animation.toValue = Multiple;
    animation.duration = time;
    animation.autoreverses = YES;
    animation.repeatCount = repeatTimes;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

+ (CABasicAnimation *)movepoint:(CGPoint)point
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    animation.toValue = [NSValue valueWithCGPoint:point];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = YES;
    animation.repeatCount = FLT_MAX;
    
    return animation;
}

+ (CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount
{
    CATransform3D rotationTransform = CATransform3DMakeRotation(degree, 0, 0, direction);
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration = dur;
    animation.repeatCount = repeatCount;
    animation.removedOnCompletion = NO;
    animation.autoreverses = NO;
    animation.cumulative = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    
    return animation;
}

+ (CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes
{
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.animations = animationAry;
    animation.duration = time;
    animation.repeatCount = repeatTimes;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}
#if 0
+ (CAKeyframeAnimation *)keyFrameAnimation:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes
{
    CAKeyframeAnimation *animation = []
}
#endif

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
