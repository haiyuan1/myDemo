//
//  QYBook.m
//  DomXMLDemo
//
//  Created by qingyun on 14-7-14.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYBook.h"

@implementation QYBook

- (NSString *)description
{
    return [NSString stringWithFormat:@"category:%@,bookName:%@,author:%@,Price:%f,Year:%@", self.category,self.bookName,self.author,self.price,self.year];
}

@end
