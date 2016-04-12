//
//  Restaurants.m
//  eveningPlanner
//
//  Created by User on 4/11/16.
//
//

#import "Place.h"

@implementation Place

@dynamic name, descriptionInfo, logo, price, rating, image1, image2, image3, url, contactNumber, address, placeType;

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
        address:(NSString *)address
      placeType:(NSString *)placeType{
    
    self.name = name;
    self.descriptionInfo = descriptionInfo;
    self.logo = logo;
    self.price = price;
    self.rating = rating;
    self.image1 = image1;
    self.image2 = image2;
    self.image3 = image3;
    self.url = url;
    self.contactNumber = contactNumber;
    self.address = address;
    self.placeType = placeType;
}

@end
