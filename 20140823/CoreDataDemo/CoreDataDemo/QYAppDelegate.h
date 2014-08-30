//
//  QYAppDelegate.h
//  CoreDataDemo
//
//  Created by qingyun on 14-8-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
