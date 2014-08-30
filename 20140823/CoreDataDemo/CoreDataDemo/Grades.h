//
//  Grades.h
//  CoreDataDemo
//
//  Created by qingyun on 14-8-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student, Teacher;

@interface Grades : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *rel_student;
@property (nonatomic, retain) NSSet *rel_teacher;
@end

@interface Grades (CoreDataGeneratedAccessors)

- (void)addRel_studentObject:(Student *)value;
- (void)removeRel_studentObject:(Student *)value;
- (void)addRel_student:(NSSet *)values;
- (void)removeRel_student:(NSSet *)values;

- (void)addRel_teacherObject:(Teacher *)value;
- (void)removeRel_teacherObject:(Teacher *)value;
- (void)addRel_teacher:(NSSet *)values;
- (void)removeRel_teacher:(NSSet *)values;

@end
