//
//  QYCustomView.m
//  QuartzView
//
//  Created by qingyun on 14-7-10.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYCustomView.h"

@interface QYCustomView ()

@property (nonatomic, retain) UIImage *image;
@end

@implementation QYCustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"picture.gif"];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
#if 0
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, 20, 300);
    CGContextAddLineToPoint(context, 200, 300);
    CGContextAddLineToPoint(context, 200, 20);
    CGContextAddLineToPoint(context, 20, 22.5);
    
//    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextFillPath(context);
//    CGRect rect1 = {20, 20, 200, 300};
//    CGContextFillRect(context, rect1);
    
}
#endif

#if 0
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 150);
    CGContextAddLineToPoint(context, 100, 200);
    CGContextAddLineToPoint(context, 50, 150);
    CGContextAddLineToPoint(context, 100, 100);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillPath(context);
}
#endif

#if 0
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGRect rectangle = {60, 170, 200, 80};
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillRect(context, rectangle);
}
#endif

#if 0
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 150);
    CGContextAddLineToPoint(context, 100, 200);
    CGContextAddLineToPoint(context, 50, 150);
    CGContextAddLineToPoint(context, 100, 100);
    
    CGContextStrokePath(context);
}
#endif

#if 0
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 10);
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGRect rt = {50, 60, 200, 200};
    
    [self.image drawInRect:rt];
    
}
#endif

#if 0
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    
    CGRect ret = {50, 60, 220, 100};
    CGContextAddEllipseInRect(context, ret);
    CGContextDrawPath(context, kCGPathEOFill);
}
#endif

#if 0
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    
    CGContextSetStrokeColorWithColor(context, [UIColor purpleColor].CGColor);
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddArcToPoint(context, 100, 200, 300, 200, 100);
    CGContextStrokePath(context);
}
#endif

#if 0
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextMoveToPoint(context, 10, 400);
    CGContextAddCurveToPoint(context, 145, 100, 145, 100, 300, 400);
    
    CGContextStrokePath(context);
}
#endif

#if 0
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor darkTextColor].CGColor);
    
    CGContextMoveToPoint(context, 10, 300);
    CGContextAddQuadCurveToPoint(context, 160, 0, 310, 300);
    CGContextStrokePath(context);
    
}
#endif

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGFloat dashArray[] = {2, 6, 4, 2};
    
    CGContextSetLineDash(context, 3, dashArray, 4);
    CGContextMoveToPoint(context, 10, 300);
    CGContextAddQuadCurveToPoint(context, 160, 10, 310, 300);
    CGContextStrokePath(context);
}

@end
