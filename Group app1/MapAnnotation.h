//
//  MapAnnonation.h
//  eveningPlanner
//
//  Created by Musho on 11/04/16.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *subTitle;

- (instancetype)initWithCoordinates:(CLLocationCoordinate2D)coordinate
                              title:(NSString *)title subTitle:(NSString *)subTitle;

@end
