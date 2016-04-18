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

@interface MapViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) MKPolylineRenderer *polylineRenderer;
@property (strong, nonatomic) MKPolyline *polyline;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MKMapView alloc];
    
    for (int i = 0; i < self.latitudes.count; i++) {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([self.latitudes[i] doubleValue],
                                                                       [self.longitudes[i] doubleValue]);
        MapAnnotation *annotation = [[MapAnnotation alloc] initWithCoordinates:coordinate title:@"KFC" subTitle:@"Fast Food"];
        [self.mapView addAnnotation:annotation];
    }
    if (self.latitudes.count == 1) {
        self.mapView.showsUserLocation = YES;
        [self getCurrentCoordinates];
        CLLocationCoordinate2D coordinate[2];
        coordinate[0] = CLLocationCoordinate2DMake([self.latitudes[0] doubleValue], [self.longitudes[0] doubleValue]);
        coordinate[1] = CLLocationCoordinate2DMake(self.locationManager.location.coordinate.latitude,
                                                   self.locationManager.location.coordinate.longitude);
        self.mapView.region = MKCoordinateRegionMakeWithDistance(coordinate[1], 5000,5000);
        self.polyline = [MKPolyline polylineWithCoordinates:coordinate count:2];
        self.polylineRenderer = [[MKPolylineRenderer alloc] initWithPolyline:self.polyline];
        
    } else {
        
    }

}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer *renderer =[[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor orangeColor];
    renderer.lineWidth = 3.0;
    
    return renderer;}

- (void)getCurrentCoordinates {
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations{
    [self.locationManager stopUpdatingLocation];
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
