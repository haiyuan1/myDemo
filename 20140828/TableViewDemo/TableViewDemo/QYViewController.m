//
//  QYViewController.m
//  TableViewDemo
//
//  Created by qingyun on 14-8-28.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_array = [[NSMutableArray alloc] initWithArray:@[@"zhangsan", @"lisi", @"wangwu", @"zhaoliu", @"tianqi", @"wangdelong"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)animationForTable:(UIButton *)sender {
    
    if (self.array.count == 6) {
        [self.array addObject:@"qianjiu"];
    } else {
        [self.array removeLastObject];
    }
    [self.tableView reloadData];
    
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fillMode = kCAFillModeForwards;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromRight;
    [self.tableView.layer addAnimation:animation forKey:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *indentifier = @"cellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

@end
