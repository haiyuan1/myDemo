//
//  QYViewController.m
//  GestureRecongnizerDemo
//
//  Created by qingyun on 14-7-5.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import <AFNetworking.h>
#import <FMDB.h>
#import <JSONKit.h>
#import <FXBlurView.h>
#import <XMLDictionary.h>

@interface QYViewController ()

@property (nonatomic, retain) UIViewController *viewA;
@property (nonatomic, retain) UIView *viewDemo;

@end

@implementation QYViewController

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
#if 0
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    UITapGestureRecognizer *doubleGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleGestureReconizer:)];
    doubleGestureRecognizer.numberOfTouchesRequired = 1;
    doubleGestureRecognizer.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleGestureRecognizer];
    [tapGestureRecognizer requireGestureRecognizerToFail:doubleGestureRecognizer];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinchAction:)];
    [self.view addGestureRecognizer:pinch];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGestureAction:)];
        [self.view addGestureRecognizer:panGesture];
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onRotationAction:)];
    rotationGesture.rotation = 20.0;
    [self.view addGestureRecognizer:rotationGesture];
#endif
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeGestureAction:)];
//    swipeGesture.numberOfTouchesRequired = 1;
    swipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeGesture];
    
    UIScreenEdgePanGestureRecognizer *screenEdgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(onScreenEdgePanGesture:)];
    screenEdgePanGesture.edges = UIRectEdgeLeft;
    screenEdgePanGesture.enabled = YES;
    [self.view addGestureRecognizer:screenEdgePanGesture];
    
    UISwipeGestureRecognizer *swipeGesture2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureTapped:)];
    swipeGesture2.numberOfTouchesRequired = 1;
    swipeGesture2.direction = UISwipeGestureRecognizerDirectionDown;
    [self.viewA.view addGestureRecognizer:swipeGesture2];

    
//    [pinch requireGestureRecognizerToFail:swipeGesture];
}

- (void)onScreenEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)sender
{
    self.viewDemo = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x + 20, self.view.bounds.origin.y + 20, self.view.bounds.size.width - 40, self.view.bounds.size.height - 100)];
    self.viewDemo.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.viewDemo];
    
    UIScreenEdgePanGestureRecognizer *screenEdgeGesturePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(onTapped:)];
    screenEdgeGesturePan.edges = UIRectEdgeRight;
    screenEdgeGesturePan.enabled = YES;
    [self.viewDemo addGestureRecognizer:screenEdgeGesturePan];
}

- (void)onTapped:(UIScreenEdgePanGestureRecognizer *)sender
{
    [self.viewDemo removeFromSuperview];
}

- (void)tapGestureRecognizer:(UITapGestureRecognizer *)sender
{
    NSLog(@"单击事件");
}

- (void)doubleGestureReconizer:(UITapGestureRecognizer *)sender
{
    NSLog(@"双击事件");
}

- (void)onPinchAction:(UIPinchGestureRecognizer *)sender
{
    NSLog(@"%.2f", sender.scale);
    NSLog(@"缩放");
}

- (void)onPanGestureAction:(UIPanGestureRecognizer *)sender
{
    NSLog(@"拖拽");
}

- (void)onRotationAction:(UIRotationGestureRecognizer *)sender
{
    NSLog(@"旋转");
}

- (void)onSwipeGestureAction:(UISwipeGestureRecognizer *)sender
{
    
    NSLog(@"%s", __func__);
    _viewA = [[UIViewController alloc] init];
    _viewA.view.backgroundColor = [UIColor purpleColor];
    [self presentViewController:_viewA animated:YES completion:^{
        
    }];
#if 0
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 300, 120, 50);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 101;
    [_viewA.view addSubview:btn];
#endif
}

- (void)onButtonTapped:(UIButton *)sender
{
    
    [_viewA dismissViewControllerAnimated:YES completion:^{

    }];
}

- (void)swipeGestureTapped:(UISwipeGestureRecognizer *)sender
{
    [_viewA dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
