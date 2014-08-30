//
//  HYDataBaseManager.m
//  CoreDataDemo
//
//  Created by qingyun on 14-8-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "HYDataBaseManager.h"
#import "QYAppDelegate.h"

#import "Student.h"
#import "Teacher.h"
#import "Grades.h"

@implementation HYDataBaseManager

+ (void)writeDefaultData
{
    QYAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    Grades *grades = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:delegate.managedObjectContext];
    grades.name = @"计算机一班";
    
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:delegate.managedObjectContext];
    student.name = @"张三";
    student.number = @1;
//    for (int i = 0; i < 7; i++) {
//        Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:delegate.managedObjectContext];
//        student.name = [NSString stringWithFormat:@"赵%d", i+1];
//        student.number = [NSNumber numberWithInteger:i];
//    }
    
    Teacher *teacher = [NSEntityDescription insertNewObjectForEntityForName:@"Teacher" inManagedObjectContext:delegate.managedObjectContext];
    teacher.name = @"李四";
    teacher.number = @1;
    
    student.rel_grades = grades;
    [student addRel_teacherObject:teacher];
    teacher.rel_grades = grades;
    
    [delegate saveContext];
}

+ (void)queryDataBase
{
    QYAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = '赵1' and number = 1"];
    request.predicate = predicate;
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = @[sort];
    
    NSError *error;
    NSArray *students = [delegate.managedObjectContext executeFetchRequest:request error:&error];
    for (Student *stu in students) {
        stu.name = @"王五";
    }
    [delegate saveContext];
#if 1
    for (Student *stu in students) {
        [delegate.managedObjectContext deleteObject:stu];
    }
    [delegate saveContext];
#endif
}

@end
