//
//  Student.h
//  CoreDataDemo
//
//  Created by qingyun on 14-8-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Grades, Teacher;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Grades *rel_grades;
@property (nonatomic, retain) NSSet *rel_teacher;
@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addRel_teacherObject:(Teacher *)value;
- (void)removeRel_teacherObject:(Teacher *)value;
- (void)addRel_teacher:(NSSet *)values;
- (void)removeRel_teacher:(NSSet *)values;

@end
