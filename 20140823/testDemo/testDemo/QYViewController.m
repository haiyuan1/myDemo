//
//  QYViewController.m
//  testDemo
//
//  Created by qingyun on 14-8-23.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()

@property (nonatomic, strong) NSMutableArray *array;

@property (nonatomic, strong) NSMutableArray *arrayWithCell;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.array = [NSMutableArray arrayWithObjects:@0, @0, @0, @0, @0, nil];
    self.arrayWithCell = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [self.array[section] integerValue];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",[self.arrayWithCell[indexPath.row] integerValue]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    bgView.backgroundColor = [UIColor clearColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [button setTitle:@"section" forState:UIControlStateNormal];
    [button setTitle:@"section" forState:UIControlStateHighlighted];
    [button setSelected:NO];
    button.tag = section;
    [button addTarget:self action:@selector(doSomeThing:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor darkGrayColor]];
    [bgView addSubview:button];
    return bgView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.01)];
    return view;
}

- (void)doSomeThing:(UIButton *)button
{
    NSInteger count = [self.array[button.tag] integerValue];
    if (count == 0) {
        [self.array replaceObjectAtIndex:button.tag withObject:@3];
    } else {
        [self.array replaceObjectAtIndex:button.tag withObject:@0];
    }
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
