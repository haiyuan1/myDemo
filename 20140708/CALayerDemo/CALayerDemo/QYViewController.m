//
//  QYViewController.m
//  CALayerDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "QYCustomLayer.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (void)showImageView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 57, 57)];
    imageView.image = [UIImage imageNamed:@"Icon"];
    
    imageView.layer.shadowColor = [UIColor blueColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(10, 10);
    imageView.layer.shadowOpacity = 0.2f;
    
    imageView.layer.borderColor = [UIColor greenColor].CGColor;
    imageView.layer.borderWidth = 0.5f;
    
    imageView.layer.cornerRadius = 20.0;
    imageView.layer.masksToBounds = YES;
    
    imageView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
    
    [self.view addSubview:imageView];
}

- (void)showCustomLayer
{
    CALayer *customLayer = [CALayer layer];
    customLayer.backgroundColor = [UIColor blueColor].CGColor;
    customLayer.bounds = CGRectMake(0, 0, 200, 200);
    customLayer.position = CGPointMake(0, 0);
    
    customLayer.anchorPoint = CGPointMake(0.5, 0.5);
    
    [self.view.layer addSublayer:customLayer];
    
}

- (void)showImageContentWithLayer
{
    CALayer *customLayer = [CALayer layer];
    customLayer.contents = (NSData *)[UIImage imageNamed:@"Icon"].CGImage;
    customLayer.bounds = CGRectMake(0, 0, 57, 57);
    customLayer.position = CGPointMake(104, 104);
    customLayer.cornerRadius = 20.0f;
    customLayer.masksToBounds = YES;
    customLayer.opacity = 0.5;
    customLayer.opaque = YES;
    
    [self.view.layer addSublayer:customLayer];
}

- (void)showPositionUseAnchorpoint
{
    CALayer *customLayer = [CALayer layer];
    customLayer.bounds = CGRectMake(0, 0, 104, 104);
    customLayer.position = CGPointMake(0+52, 0+52);
    customLayer.backgroundColor = [UIColor blueColor].CGColor;
    customLayer.cornerRadius = 10.0f;
    
    customLayer.anchorPoint = CGPointMake(0, 0);
    customLayer.anchorPoint = CGPointMake(1, 0);
    customLayer.anchorPoint = CGPointMake(0, 1);
    customLayer.anchorPoint = CGPointMake(1, 1);
    customLayer.anchorPoint = CGPointMake(0.5, 0.5);
    
    [self.view.layer addSublayer:customLayer];
}

- (void)showCustomLayers
{
    QYCustomLayer *customLayer = [QYCustomLayer layer];
    [customLayer setNeedsDisplay];
    customLayer.bounds = CGRectMake(0, 0, 300, 300);
    customLayer.position = CGPointMake(20, 20);
    customLayer.anchorPoint = CGPointMake(0, 0);
    
    [self.view.layer addSublayer:customLayer];
}

- (void)showLayerDelegate
{
    CALayer *customLayer = [CALayer layer];
    customLayer.bounds = CGRectMake(0, 0, 300, 300);
    customLayer.position = CGPointMake(160, 160);
    [customLayer setNeedsDisplay];
    customLayer.delegate = self;
    
    [self.view.layer addSublayer:customLayer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    [self showImageView];
//    [self showCustomLayer];
    [self showPositionUseAnchorpoint];
//    [self showImageContentWithLayer];
    
//    [self showCustomLayers];
//    [self showLayerDelegate];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(ctx, 2);
    CGContextStrokeRect(ctx, CGRectMake(0, 0, 20, 20));
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
