//
//  QYCustomView.m
//  QuartzDemo
//
//  Created by qingyun on 14-7-10.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYCustomView.h"

@implementation QYCustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetFillColorWithColor(context, [UIColor darkGrayColor].CGColor);
    CGContextMoveToPoint(context, 30, 30);
    CGContextAddCurveToPoint(context, 30, 30, 100, 100, 300, 400);
    CGContextStrokePath(context);
}

#if 0
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
#endif

@end
