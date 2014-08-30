//
//  QYViewController.m
//  SqliteDemo
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
	sqlite3 *sqliteTest = NULL;
    NSString *sqliteDbName = [[NSBundle mainBundle] pathForResource:@"sqlitetest" ofType:@"sqlite"];
    NSLog(@"databases name :%@", sqliteDbName);
    int result = sqlite3_open([sqliteDbName UTF8String], &sqliteTest);
    if (result != SQLITE_OK) {
        NSLog(@"Open DataBases failure %@", sqliteDbName);
        return;
    }

    NSString *strSql = @"INSERT INTO STUDENT VALUES ( 3,'GUANGHUI', 25, 'LUOHE', 50000.00, 'M', '1990-3-24')";
    NSString *strSql1 = @"INSERT INTO STUDENT VALUES (4, 'SHAOFENG', 20, 'ZHUMADIAN', 30000.00, 'M', '1992-2-3')";
    char *error = NULL;
    result = sqlite3_exec(sqliteTest, [strSql UTF8String], NULL, NULL, &error);
    if (result != SQLITE_OK) {
        NSLog(@"Insert failure %@, %s", strSql, error);
        return;
    }
    result = sqlite3_exec(sqliteTest, [strSql1 UTF8String], NULL, NULL, &error);
    if (result != SQLITE_OK) {
        NSLog(@"Error:%@", strSql1);
        return;
    }
    NSString *delSql = @"DELETE FROM STUDENT WHERE ID = 1";
    char *error1 = NULL;
    result = sqlite3_exec(sqliteTest, [delSql UTF8String], NULL, NULL, &error1);
    if (result != SQLITE_OK) {
        NSLog(@"Delete Error %@, %s", delSql, error1);
        return;
    }
    sqlite3_close(sqliteTest);
#if 0
    _employee = [[NSMutableArray alloc] initWithCapacity:8];
    
    sqlite3 *sqliteTest = NULL;
    NSString *dbFileName = [[NSBundle mainBundle] pathForResource:@"sqlitetest" ofType:@"sqlite"];
    int result = sqlite3_open([dbFileName UTF8String], &sqliteTest);
    if (result != SQLITE_OK) {
        NSLog(@"Open Error %@",dbFileName);
        return;
    }
//    NSString *selectSql = @"SELECT * FROM STUDENT";
    NSString *selectSql = @"select * from student where salary >= ? and age > ?";
    sqlite3_stmt *stmt = NULL;
    sqlite3_prepare_v2(sqliteTest, [selectSql UTF8String], -1, &stmt, NULL);
    sqlite3_bind_double(stmt, 1, 20000.00);
    sqlite3_bind_int(stmt, 2, 25);
    result = sqlite3_step(stmt);
    while (result == SQLITE_ROW) {
        QYEmployee *emp = [[QYEmployee alloc] init];
        emp.eID = sqlite3_column_int(stmt, 0);
        emp.name = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 1)];
        emp.age = sqlite3_column_int(stmt, 2);
        emp.address = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 3)];
        emp.salary = sqlite3_column_double(stmt, 4);
        emp.sex = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 5)];
        emp.birthday = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 6)];
        [self.employee addObject:emp];
        result = sqlite3_step(stmt);
    }
    sqlite3_finalize(stmt);
    sqlite3_close(sqliteTest);
    NSLog(@"%@", self.employee);
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
