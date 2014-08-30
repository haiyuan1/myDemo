//
//  QYImageScrollView.m
//  AlbumScrollViewDemo
//
//  Created by qingyun on 14-7-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYImageScrollView.h"

@implementation QYImageScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.minimumZoomScale = 0.5f;
        self.maximumZoomScale = 2.5f;
        self.delegate = self;
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.userInteractionEnabled = YES;
        _imageView.multipleTouchEnabled = YES;
        [self addSubview:_imageView];
    }
    return self;
}

- (UIView *)viewForZoomingInScrollView:(QYImageScrollView *)scrollView
{
    return _imageView;
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
