//
//  QYViewController.m
//  SQLDemo
//
//  Created by qingyun on 14-8-7.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import <sqlite3.h>

@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	sqlite3 *qingyunDb = NULL;
    NSString *dbFilesName = [[NSBundle mainBundle] pathForResource:@"qingyun" ofType:@"sqlite"];
    int result = sqlite3_open([dbFilesName UTF8String], &qingyunDb);
    if (result != SQLITE_OK) {
        NSLog(@"Open db %@ failure.",dbFilesName);
        return;
    }
#if 0
    NSString *strSql = @"INSERT INTO COMPANY VALUES (1, 'WANGDELONG', 20, 'ZHENGZHOU', 50000.00, 'M', '1992-03-04')";
    char *error = NULL;
    result = sqlite3_exec(qingyunDb, [strSql UTF8String], NULL, NULL, &error);
    if (result != SQLITE_OK) {
        NSLog(@"insert into table failure:%@,%s", strSql,error);
        return;
    }
#endif
    NSString *delSql = @"DELETE FROM COMPANY WHERE ID = 1";
    char *error = NULL;
    result = sqlite3_exec(qingyunDb, [delSql UTF8String], NULL, NULL, &error);
    if (result != SQLITE_OK) {
        NSLog(@"Del data failure :%@,%s", delSql, error);
        return;
    }
    sqlite3_close(qingyunDb);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
