//
//  QYCustomView.m
//  ScaleDemo
//
//  Created by qingyun on 14-7-5.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYCustomView.h"

@implementation QYCustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.multipleTouchEnabled = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (touches.count < 2) {
        return;
    }
    NSArray *allObjects = [touches allObjects];
    UITouch *firstTouch = allObjects[0];
    UITouch *secondTouch = allObjects[1];
    
    CGPoint preFirstTouchPoint = [firstTouch previousLocationInView:self];
    CGPoint curFirstTouchPoint = [firstTouch locationInView:self];
    
    CGPoint preSecondTouchPoint = [secondTouch previousLocationInView:self];
    CGPoint curSecondTouchPoint = [secondTouch locationInView:self];
    
    CGFloat startDistance = sqrtf((powf(preSecondTouchPoint.x - preFirstTouchPoint.x, 2) +
                                   powf(preSecondTouchPoint.y - preFirstTouchPoint.y, 2)));
    CGFloat endDistance = sqrtf((powf(curSecondTouchPoint.x - curFirstTouchPoint.x, 2) +
                                 powf(curSecondTouchPoint.y - curFirstTouchPoint.y, 2)));
    
    if ((endDistance - startDistance) > 0) {
        NSLog(@"放大");
    } else {
        NSLog(@"缩小");
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
