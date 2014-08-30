//
//  QYCustomMKAnnotationView.m
//  MapDemo
//
//  Created by qingyun on 14-7-16.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYCustomMKAnnotationView.h"

@implementation QYCustomMKAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon_nav_start"];
        
        UIImageView *leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon"]];
        leftImageView.frame = CGRectMake(0, 0, 40, 40);
        self.leftCalloutAccessoryView = leftImageView;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        self.rightCalloutAccessoryView = button;
        self.canShowCallout = YES;
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
