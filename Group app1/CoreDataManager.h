//
//  CoreDataManager.h
//  eveningPlanner
//
//  Created by User on 4/12/16.
//
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Restaurants.h"

@interface CoreDataManager : NSObject

- (void)insertRestaurantsList;
- (NSArray *)fetchAllRestaurants;

@end
