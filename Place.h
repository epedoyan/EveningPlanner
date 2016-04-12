//
//  Restaurants.h
//  eveningPlanner
//
//  Created by User on 4/11/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

//NS_ASSUME_NONNULL_BEGIN

@interface Place : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *descriptionInfo;
@property (nonatomic, retain) NSString *logo;
@property (nonatomic, retain) NSNumber *price;
@property (nonatomic, retain) NSNumber *rating;
@property (nonatomic, retain) NSString *imageFirst;
@property (nonatomic, retain) NSString *imageSecond;
@property (nonatomic, retain) NSString *imageThird;
@property (nonatomic, retain) NSString *urlString;
@property (nonatomic, retain) NSString *contactNumber;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *placeType;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, retain) NSNumber *latitude;


- (void)setName:(NSString *)name
descriptionInfo:(NSString *)descriptionInfo
           logo:(NSString *)logo
          price:(NSNumber *)price
         rating:(NSNumber *)rating
         image1:(NSString *)imageFirst
         image2:(NSString *)imageSecond
         image3:(NSString *)imageThird
            url:(NSString *)urlString
 contactNumber:(NSString *)contactNumber
       address:(NSString *)address
      placeType:(NSString *)placeType
      longitude:(NSNumber *)longitude
      latitude:(NSNumber *)latitude;
@end

//NS_ASSUME_NONNULL_END

