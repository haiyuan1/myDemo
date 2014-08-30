//
//  QYBook.m
//  HYXMLParserDemo
//
//  Created by qingyun on 14-7-14.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYBook.h"

@implementation QYBook

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@, %@, %@, %@, %.2f", self.category, self.bookName, self.language, self.author, self.year, self.price];
}

@end
