//
//  QYSmartTableViewCell.h
//  QYSmartTableViewCellDemo
//
//  Created by qingyun on 14-7-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYSmartTableViewCell : UITableViewCell

+(id)cellForTableViewWithIdentifier:(UITableView *)tableView withCellStyle:(UITableViewCellStyle)style;

+(NSString *)identifier;

- (id)initWithIdentifier:(NSString *)cellID withCellStyle:(UITableViewCellStyle)style;

@end
