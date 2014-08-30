//
//  QYLoginViewController.m
//  AppStructDemo
//
//  Created by qingyun on 14-7-23.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYLoginViewController.h"
#import "QYGuideViewController.h"
#import "QYAppDelegate.h"

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
    self.view.backgroundColor = [UIColor orangeColor];
    self.userName.delegate = self;
    self.userPassword.delegate = self;
}
- (IBAction)loginMainView:(UIButton *)sender {
    if ([self.userName.text isEqualToString:@"qingyun"] && [self.userPassword.text isEqualToString:@"qingyun"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败" message:@"用户名或密码错误" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil, nil];
        [alertView show];
    }
}
- (IBAction)showGuideView:(UIButton *)sender {
    QYAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    QYGuideViewController *guideView = [[QYGuideViewController alloc] init];
    [delegate.nav pushViewController:guideView animated:YES];
}
- (IBAction)hiddenKeyboard:(UITapGestureRecognizer *)sender {
    [self.userName resignFirstResponder];
    [self.userPassword resignFirstResponder];
}
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
