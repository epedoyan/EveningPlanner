//
//  MapViewController.m
//  eveningPlanner
//
//  Created by Musho on 10/04/16.
//
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "MapAnnotation.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MKMapView alloc];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(40.1838083, 44.515267100000074);
    MapAnnotation *annotation = [[MapAnnotation alloc] initWithCoordinates:coordinate title:@"KFC" subTitle:@"Fast Food"];
    [self.mapView addAnnotation:annotation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView *pinView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"current"];
    if (pinView == nil) {
        pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"current"];
    }
    
    UIImage *pinImage = [UIImage imageNamed:@"pin"];
    pinView.image = pinImage;
    pinView.canShowCallout = YES;
    
    return pinView;
}

@end
