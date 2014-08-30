//
//  QYTouchTestViewController.m
//  TestTouch
//
//  Created by qingyun on 14-7-4.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYTouchTestViewController.h"
#import "QYViewB.h"
#import "QYViewC.h"
#import "QYViewD.h"
#import "QYViewE.h"

@interface QYTouchTestViewController ()

@end

@implementation QYTouchTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    QYViewB *viewB = [[QYViewB alloc] initWithFrame:CGRectMake(20, 20, 280, 150)];
    viewB.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewB];
    [viewB release]; viewB = nil;
    
    QYViewC *viewC = [[QYViewC alloc] initWithFrame:CGRectMake(20, 190, 280, 250)];
    viewC.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewC];
    
    QYViewD *viewD = [[QYViewD alloc] initWithFrame:CGRectMake(20, 10, 240, 115)];
    viewD.backgroundColor = [UIColor purpleColor];
    [viewC addSubview:viewD];
    [viewD release]; viewD = nil;
    
    QYViewE *viewE = [[QYViewE alloc] initWithFrame:CGRectMake(20, 130, 240, 115)];
    viewE.backgroundColor = [UIColor yellowColor];
    [viewC addSubview:viewE];
    [viewE release]; viewE = nil;
    [viewC release]; viewC = nil;
    
}

#if 0
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
}
#endif

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
