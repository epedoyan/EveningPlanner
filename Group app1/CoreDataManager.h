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

static NSString *const kPlaceTypeFastFood = @"Fast Food";
static NSString *const kPlaceTypeRestaurant = @"Restaurant";
static NSString *const kPlaceTypeGame = @"Games";
static NSString *const kPlaceTypeGym = @"Gym";
static NSString *const kPlaceTypeMuseum = @"Museum";
static NSString *const kPlaceTypeCinema = @"TheatreCinema";

@interface CoreDataManager : NSObject 

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
+ (id)defaultManager;

- (void)saveContext;
- (void)insertPlacesList;

- (NSArray *)fetchPlaceWith:(NSString *)placeType;
- (NSArray *)fecthPlaceWith:(NSString *)placeTypeOne and:(NSString *)placeTypeTwo;

@end
