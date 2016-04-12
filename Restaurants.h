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

@interface Restaurants : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *descriptionInfo;
@property (nonatomic, retain) NSString *logo;
@property (nonatomic, retain) NSNumber *price;
@property (nonatomic, retain) NSNumber *rating;
@property (nonatomic, retain) NSString *image1;
@property (nonatomic, retain) NSString *image2;
@property (nonatomic, retain) NSString *image3;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *contactNumber;
@property (nonatomic, retain) NSString *address;

- (void)setName:(NSString *)name
descriptionInfo:(NSString *)descriptionInfo
           logo:(NSString *)logo
          price:(NSNumber *)price
         rating:(NSNumber *)rating
         image1:(NSString *)image1
         image2:(NSString *)image2
         image3:(NSString *)image3
            url:(NSString *)url
 contactNumber:(NSString *)contactNumber
       address:(NSString *)address;

@end

//NS_ASSUME_NONNULL_END

