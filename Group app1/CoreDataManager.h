//
//  CoreDataManager.h
//  eveningPlanner
//
//  Created by User on 4/12/16.
//
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Place.h"

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (id)defaultManager;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (void)insertRestaurantsList;

- (NSArray *)fetchFastFood;
- (NSArray *)fetchMuseum;
- (NSArray *)fetchCinemaTheatre;

@end
