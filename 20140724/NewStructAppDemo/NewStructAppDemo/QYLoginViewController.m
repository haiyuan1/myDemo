//
//  QYLoginViewController.m
//  NewStructAppDemo
//
//  Created by qingyun on 14-7-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYLoginViewController.h"

@interface QYLoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;

@end

@implementation QYLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.userName.delegate = self;
    self.userPassword.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.view.alpha = 0.0f;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.alpha = 1.0f;
    }];
}
- (IBAction)login:(UIButton *)sender {
    [QYViewControllerManager presentViewControllerWithType:QYViewControllerTypeMainView];
}
- (IBAction)hiddenKeyboard:(UITapGestureRecognizer *)sender {
    [self.userName resignFirstResponder];
    [self.userPassword resignFirstResponder];
}

#pragma textField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
