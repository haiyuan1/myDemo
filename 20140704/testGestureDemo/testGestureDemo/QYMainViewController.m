//
//  QYMainViewController.m
//  testGestureDemo
//
//  Created by qingyun on 14-7-4.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYMainViewController.h"
#import "QYMoveView.h"

@interface QYMainViewController ()

@end

@implementation QYMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    QYMoveView *view = [[QYMoveView alloc] initWithFrame:self.view.bounds];
//    view.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:view];
    
    _moveView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 30, 30)];
    _moveView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_moveView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    _moveView = [[QYMoveView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    _moveView.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:_moveView];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *tch = [touches anyObject];
    CGPoint currentPoint = [tch locationInView:self.view];
    
    _moveView.center = currentPoint;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
