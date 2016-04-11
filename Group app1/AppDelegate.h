//
//  AppDelegate.h
//  Group app1
//
//  Created by Paruyr Danielian on 4/6/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDelegate;

@interface UIApplication (Additions)

+ (AppDelegate *)appDelegate;

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
