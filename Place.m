//
//  Restaurants.m
//  eveningPlanner
//
//  Created by User on 4/11/16.
//
//

#import "Place.h"

@implementation Place

@dynamic name, descriptionInfo, logo, price, rating, imageFirst, imageSecond, imageThird, urlString, contactNumber, address, placeType, latitude, longitude;

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
       latitude:(NSNumber *)latitude {
    
    self.name = name;
    self.descriptionInfo = descriptionInfo;
    self.logo = logo;
    self.price = price;
    self.rating = rating;
    self.imageFirst = imageFirst;
    self.imageSecond = imageSecond;
    self.imageThird = imageThird;
    self.urlString = urlString;
    self.contactNumber = contactNumber;
    self.address = address;
    self.placeType = placeType;
    self.latitude = latitude;
    self.longitude = longitude;
}

@end
