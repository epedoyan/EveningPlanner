//
//  MapViewController.h
//  eveningPlanner
//
//  Created by Musho on 10/04/16.
//
//

#import <UIKit/UIKit.h>
#import "Place.h"

@interface MapViewController : UIViewController

@property (nonatomic, strong) NSArray *latitudes;
@property (nonatomic, strong) NSArray *longitudes;

@property (nonatomic, strong) NSArray <Place *> *places;

@end
