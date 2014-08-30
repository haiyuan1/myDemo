//
//  QYCustomLayer.m
//  CALayerDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYCustomLayer.h"

@implementation QYCustomLayer

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextSetRGBFillColor(ctx, 0, 1, 1, 1);
    CGContextMoveToPoint(ctx, 20, 20);
    CGContextAddLineToPoint(ctx, 200, 200);
    CGContextAddLineToPoint(ctx, 20, 200);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}

@end
