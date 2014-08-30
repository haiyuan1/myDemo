//
//  QYMainViewController.m
//  AppStructDemo
//
//  Created by qingyun on 14-7-23.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYMainViewController.h"
#import "QYChatViewController.h"
#import "QYContactViewController.h"
#import "QYFindViewController.h"
#import "QYAboutMeViewController.h"

@interface QYMainViewController ()

@end

@implementation QYMainViewController

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
    
    QYChatViewController *chatViewCtrl = [[QYChatViewController alloc] init];
    UINavigationController *navChat = [[UINavigationController alloc] initWithRootViewController:chatViewCtrl];
    
    QYContactViewController *contactViewCtrl = [[QYContactViewController alloc] init];
    UINavigationController *navContact = [[UINavigationController alloc] initWithRootViewController:contactViewCtrl];
    
    QYFindViewController *findViewCtrl = [[QYFindViewController alloc] init];
    UINavigationController *navFind = [[UINavigationController alloc] initWithRootViewController:findViewCtrl];
    QYAboutMeViewController *aboutMeViewCtrl = [[QYAboutMeViewController alloc] init];
    UINavigationController *navAboutMe = [[UINavigationController alloc] initWithRootViewController:aboutMeViewCtrl];
    
    self.viewControllers = @[navChat, navContact, navFind, navAboutMe];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
