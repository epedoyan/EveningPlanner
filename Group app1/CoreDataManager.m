//
//  CoreDataManager.m
//  eveningPlanner
//
//  Created by User on 4/12/16.
//
//

#import "CoreDataManager.h"
#import "CDConstants.m"


@implementation CoreDataManager

- (void)insertRestaurantsList {
    NSManagedObjectContext *context = [[UIApplication appDelegate] managedObjectContext];
    
    Place *rest_Blackberry = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [rest_Blackberry setName:@"Blackberry" descriptionInfo:@"The BlackBerry is one of the “L’Orange” network cafes opened its doors on March 5, 2005 in downtown Yerevan at 21 Abovyan St. The name L’Orange came from the wish to associate it with something fun and happy." logo:@"blackberry-logo" price:@10000 rating:@4 image1:@"blackberryImage1" image2:@"blackberryImage2" image3:@"blackberryImage3" url:@"www.blackberry.lorange.am" contactNumber:@"+37410 516711" address:@"3 Abovyan St, Yerevan, Armenia" placeType:@"Restaurant" longitude:@678 latitude:@765];
    
    // other restaurants
    
    [[UIApplication appDelegate] saveContext];
}

- (NSArray *)fetchAllRestaurants {
    NSManagedObjectContext *context = [[UIApplication appDelegate] managedObjectContext];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:kEntityNamePlaces];
    
    return [context executeFetchRequest:fetchRequest error:nil];
}

@end
