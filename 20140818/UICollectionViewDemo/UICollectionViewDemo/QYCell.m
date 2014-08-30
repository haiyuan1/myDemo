//
//  QYCell.m
//  UICollectionViewDemo
//
//  Created by qingyun on 14-8-18.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYCell.h"

@implementation QYCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectZero];
        bgView.backgroundColor = [UIColor yellowColor];
        bgView.alpha = 0.5;
        self.selectedBackgroundView = bgView;
    }
    return self;
}

@end
