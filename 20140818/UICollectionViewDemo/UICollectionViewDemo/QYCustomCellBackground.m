//
//  QYCustomCellBackground.m
//  UICollectionViewDemo
//
//  Created by qingyun on 14-8-18.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYCustomCellBackground.h"

@implementation QYCustomCellBackground

- (void)drawRect:(CGRect)rect
{
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    CGContextSaveGState(aRef);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5.0f];
    [bezierPath setLineWidth:5.0f];
    [[UIColor blackColor] setStroke];
    
    UIColor *fillColor = [UIColor colorWithRed:0.529 green:0.808 blue:0.922 alpha:1];
    [fillColor setFill];
    [bezierPath stroke];
    [bezierPath fill];
    CGContextRestoreGState(aRef);
}

@end
