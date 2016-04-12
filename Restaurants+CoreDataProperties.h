//
//  Restaurants+CoreDataProperties.h
//  eveningPlanner
//
//  Created by User on 4/11/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Restaurants.h"

NS_ASSUME_NONNULL_BEGIN

@interface Restaurants (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *descriptionInfo;
@property (nullable, nonatomic, retain) NSString *logo;
@property (nullable, nonatomic, retain) NSNumber *price;
@property (nullable, nonatomic, retain) NSNumber *rating;
@property (nullable, nonatomic, retain) NSString *image1;
@property (nullable, nonatomic, retain) NSString *image2;
@property (nullable, nonatomic, retain) NSString *image3;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *contactNumber;

@end

NS_ASSUME_NONNULL_END
