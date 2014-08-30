//
//  Teacher.h
//  CoreDataDemo
//
//  Created by qingyun on 14-8-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Grades, Student;

@interface Teacher : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *rel_student;
@property (nonatomic, retain) Grades *rel_grades;
@end

@interface Teacher (CoreDataGeneratedAccessors)

- (void)addRel_studentObject:(Student *)value;
- (void)removeRel_studentObject:(Student *)value;
- (void)addRel_student:(NSSet *)values;
- (void)removeRel_student:(NSSet *)values;

@end
