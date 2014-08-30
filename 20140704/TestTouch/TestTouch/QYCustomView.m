//
//  QYCustomView.m
//  TestTouch
//
//  Created by qingyun on 14-7-4.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYCustomView.h"

#define  HOR_LENTH     20
#define VOR_LENTH      40

@implementation QYCustomView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
}
    return self;
}

#if 1
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
#if 0
//    NSLog(@"%s", __func__);
    UITouch *touch = [touches anyObject];
    if (touch.tapCount == 2) {
        [self doubleClicked:touch];
    } else if (touch.tapCount == 1) {
//        [self singleClicked:touch];
        [self performSelector:@selector(singleClicked:) withObject:nil afterDelay:0.5];
        }
#endif
    UITouch *firstTouch = [touches anyObject];
    self.startPoint = [firstTouch locationInView:self];
}

- (void)singleClicked:(UITouch *)touch
{
    NSLog(@"单击事件");
}

- (void)doubleClicked:(UITouch *)touch
{
    NSLog(@"双击事件");
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(singleClicked:) object:nil];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%s", __func__);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%s", __func__);
    UITouch *endTouch = [touches anyObject];
    self.endPoint = [endTouch locationInView:self];
    if ((fabsl(self.endPoint.x - self.startPoint.x) >= HOR_LENTH) && ((fabsl(self.endPoint.y - self.startPoint.y) <= VOR_LENTH))) {
        NSLog(@"横扫事件");
        if ((self.endPoint.x - self.startPoint.x) > 0) {
            NSLog(@"向右横扫");
        } else if ((self.endPoint.x - self.startPoint.x) < 0) {
            NSLog(@"向左横扫");
        }
    }
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
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
