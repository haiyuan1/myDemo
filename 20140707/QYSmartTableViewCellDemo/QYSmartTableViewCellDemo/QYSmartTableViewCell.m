//
//  QYSmartTableViewCell.m
//  QYSmartTableViewCellDemo
//
//  Created by qingyun on 14-7-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYSmartTableViewCell.h"

@implementation QYSmartTableViewCell

+(id)cellForTableViewWithIdentifier:(UITableView *)tableView withCellStyle:(UITableViewCellStyle)style
{
    NSString *cellID = [self identifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[self alloc] initWithIdentifier:cellID withCellStyle:style];
    }
    return cell;
}

+(NSString *)identifier
{
    return NSStringFromClass([self class]);
}


- (id)initWithIdentifier:(NSString *)cellID withCellStyle:(UITableViewCellStyle)style
{
    return [self initWithStyle:style reuseIdentifier:cellID];
}

@end
