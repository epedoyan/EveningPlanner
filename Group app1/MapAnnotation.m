//
//  MapAnnonation.m
//  eveningPlanner
//
//  Created by Musho on 11/04/16.
//
//

#import "MapAnnotation.h"

@implementation MapAnnotation

-(instancetype)initWithCoordinates:(CLLocationCoordinate2D)coordinate title:(NSString *)title subTitle:(NSString *)subTitle {
    self = [super init];
    
    if (self) {
        _coordinate = coordinate;
        _title = title;
        _subTitle = subTitle;
    }
    return self;
}

@end