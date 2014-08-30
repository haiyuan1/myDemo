//
//  HYCustomCollectionViewCell.m
//  HYCollectionViewDemo
//
//  Created by qingyun on 14-8-19.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "HYCustomCollectionViewCell.h"

@implementation HYCustomCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
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
