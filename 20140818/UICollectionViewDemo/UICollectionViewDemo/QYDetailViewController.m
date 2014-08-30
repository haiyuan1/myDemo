//
//  QYDetailViewController.m
//  UICollectionViewDemo
//
//  Created by qingyun on 14-8-18.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYDetailViewController.h"

@interface QYDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation QYDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageView.image = self.image;
}

@end
