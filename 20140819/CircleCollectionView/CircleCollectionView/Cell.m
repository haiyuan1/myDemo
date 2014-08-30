//
//  Cell.m
//  CircleCollectionView
//
//  Created by qingyun on 14-8-19.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "Cell.h"
#import <QuartzCore/QuartzCore.h>

@implementation Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 0.0;
        self.contentView.layer.borderWidth = 1.0;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.contentView.backgroundColor = [UIColor magentaColor];
    }
    return self;
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
