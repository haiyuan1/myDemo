//
//  QYViewController.m
//  SQLiteDQLDemo
//
//  Created by qingyun on 14-8-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import <sqlite3.h>
#import "QYEmployee.h"

@interface QYViewController ()

@property (nonatomic, retain) NSMutableArray *employee;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _employee = [[NSMutableArray alloc] initWithCapacity:7];
	sqlite3 *qingyunDb = NULL;
    NSString *dbFileName = [[NSBundle mainBundle] pathForResource:@"qingyuntest" ofType:@"sqlite"];
    NSLog(@"fileDbName is %@", dbFileName);
    
    int result = sqlite3_open([dbFileName UTF8String], &qingyunDb);
    if (result != SQLITE_OK) {
        NSLog(@"Open dbfile %@ failure.", dbFileName);
        return;
    }
    NSString *selectSql = @"select * from company";
    
    sqlite3_stmt *stmt = NULL;
    sqlite3_prepare_v2(qingyunDb, [selectSql UTF8String], -1, &stmt, NULL);
    result = sqlite3_step(stmt);
    
    while (result == SQLITE_ROW) {
        QYEmployee *emp = [[QYEmployee alloc] init];
        emp.eID = sqlite3_column_int(stmt, 0);
        emp.name = [NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 1)];
        emp.age = sqlite3_column_int(stmt, 2);
        emp.address = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 3)];
        emp.salary = sqlite3_column_double(stmt, 4);
//        NSLog(@"%@", emp);
        [self.employee addObject:emp];
        result = sqlite3_step(stmt);
    }
    sqlite3_finalize(stmt);
    sqlite3_close(qingyunDb);
    NSLog(@"%@", _employee);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
