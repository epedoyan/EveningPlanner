//
//  SecondViewController.m
//  Group app1
//
//  Created by Musho on 06/04/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "SecondViewController.h"
#import "ChoicePageViewController.h"
#import "TableViewCell.h"
#import "UIColor+EveningPlannerColor.h"
#import "InfoViewController.h"
#import <MapKit/MapKit.h>

@interface SecondViewController () <UITableViewDelegate,UITableViewDataSource, UIPickerViewDataSource, CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bottomButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *topButtons;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *tableViewLabel;

@property (nonatomic) BOOL isTheFirstBottomButtonTouched;
@property (nonatomic) NSInteger numberOfSelectedTopButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewBottomLayout;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *sortingButtons;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *sortByViews;


@property (strong, nonatomic) id sortingType;
@property (nonatomic) SEL sortingMethod;
@property (nonatomic) NSInteger currentMoney;
@property (strong, nonatomic) NSArray *places;
@property (strong, nonatomic) NSDictionary *distances;

@end



@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getCurrentCoordinates];
    [self customizeViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    [self basketButtonCustomizing];
    NSManagedObjectContext *context = [[CoreDataManager defaultManager] managedObjectContext];
    for (NSManagedObjectID *temp in self.placesObjectIDs) {
        Place *place = [context objectWithID:temp];
        self.currentMoney = self.money - [place.price integerValue];
    }
    self.navigationItem.title = [NSString stringWithFormat:@"%ld AMD", (long)self.currentMoney];
    
}

- (void)basketButtonCustomizing {
    UIImage* image = nil;
    if (self.placesObjectIDs.count == 0) {
        image = [UIImage imageNamed:@"basket"];
    } else {
        image = [UIImage imageNamed:@"basketadd"];
    }
    CGRect frameimg = CGRectMake(0, 0, 30, 30);
    UIButton *myChoicesButton = [[UIButton alloc] initWithFrame:frameimg];
    [myChoicesButton addTarget:self action:@selector(basketButtonTouched)
              forControlEvents:UIControlEventTouchUpInside];
    [myChoicesButton setShowsTouchWhenHighlighted:NO];
    [myChoicesButton setBackgroundImage:image forState:UIControlStateNormal];
    UIBarButtonItem *button =[[UIBarButtonItem alloc] initWithCustomView:myChoicesButton];
    self.navigationItem.rightBarButtonItem = button;
    
}

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

- (void)customizeViewController {
    self.currentMoney = self.money;
    self.sortingMethod = @selector(sortByRating);
    self.placesObjectIDs = [[NSMutableArray alloc] init];
    [self makeDistanceLimit:[[CoreDataManager defaultManager] fetchPlaceWith:kPlaceTypeGym and:kPlaceTypeGame]];
    [self.topButtons[1] setBackgroundColor:[UIColor eveningPlannerGreenColor]];
    [self.topButtons[1] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.numberOfSelectedTopButton = 2;
    [self.bottomButtons[0] setTitle:@"Cinema, Theater" forState:UIControlStateNormal];
    [self.bottomButtons[1] setTitle:@"Museum" forState:UIControlStateNormal];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%ld AMD", (long)self.currentMoney];
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    [self basketButtonCustomizing];
}

- (void)makeDistanceLimit:(NSArray *)array {
    CLLocationCoordinate2D userCoordinate = CLLocationCoordinate2DMake(self.locationManager.location.coordinate.latitude,
                                                                       self.locationManager.location.coordinate.longitude);
    NSMutableArray *tempPlaces = [[NSMutableArray alloc] init];
    NSMutableDictionary *tempDistances = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < array.count; i++) {
        CLLocationCoordinate2D placeCoordinate = CLLocationCoordinate2DMake([[array[i] latitude] doubleValue],
                                                                            [[array[i] longitude] doubleValue]);
        MKMapPoint pointOne = MKMapPointForCoordinate(placeCoordinate);
        MKMapPoint pointTwo = MKMapPointForCoordinate(userCoordinate);
        CLLocationDistance distance = MKMetersBetweenMapPoints(pointOne, pointTwo);
        if (self.distanceLimit > distance/1000) {
            [tempPlaces addObject:array[i]];
            [tempDistances setObject:[NSNumber numberWithFloat:distance] forKey:[array[i] name]];
        }
    }
    self.places = [tempPlaces copy];
    self.distances = [tempDistances copy];
    [self performSelector:self.sortingMethod];
}

- (void)addOrRemoveButtonTouched:(UIButton *)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(TableViewCell *)[[sender superview] superview]];
    NSManagedObjectID *placeID = [self.places[indexPath.row] objectID];
    if ([sender.currentBackgroundImage isEqual:[UIImage imageNamed:@"minus"]]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
        [self.placesObjectIDs removeObject:placeID];
        self.currentMoney = self.currentMoney + [[self.places[indexPath.row] price] integerValue];
    } else {
        NSInteger money = self.currentMoney - [[self.places[indexPath.row] price] integerValue];
        if (money < 0) {
            UIAlertController *moneyAlert = [UIAlertController alertControllerWithTitle:@"No Money"
                                                                                message:@"You have not so much money"
                                                                         preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleDefault handler:nil];
            [moneyAlert addAction:okAction];
            [self presentViewController:moneyAlert animated:YES completion:nil];
        } else {
            self.currentMoney = money;
            [sender setBackgroundImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
            [self.placesObjectIDs addObject:placeID];
        }
        
    }
    self.navigationItem.title = [NSString stringWithFormat:@"%ld AMD", (long)self.currentMoney];
    [self basketButtonCustomizing];
}

- (void)basketButtonTouched {
    ChoicePageViewController *myChoiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"myChoiceVC"];
    myChoiceVC.selectedPlacesIDs = self.placesObjectIDs;
    [self showViewController:myChoiceVC sender:self];
}

#pragma mark - GreenButtons methods

- (IBAction)topButtonTouched:(UIButton *)sender {
    [self.bottomButtons[0] setBackgroundColor:self.view.backgroundColor];
    [self.bottomButtons[1] setBackgroundColor:self.view.backgroundColor];
    [self.bottomButtons[0] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
    [self.bottomButtons[1] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
    
    if ([sender.backgroundColor isEqual:self.view.backgroundColor]) {
        [UIView animateWithDuration:0.2 animations:^{
            sender.backgroundColor = [UIColor eveningPlannerGreenColor];
            [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }];
    }
    if ([sender isEqual:self.topButtons[0]]) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.topButtons[1] setBackgroundColor:self.view.backgroundColor];
            [self.topButtons[1] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
            [self.topButtons[2] setBackgroundColor:self.view.backgroundColor];
            [self.topButtons[2] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
        }];
        [self.bottomButtons[0] setTitle:@"Fast Food" forState:UIControlStateNormal];
        [self.bottomButtons[1] setTitle:@"Restaurant" forState:UIControlStateNormal];
        [self makeDistanceLimit:[[CoreDataManager defaultManager] fetchPlaceWith:kPlaceTypeFastFood and:kPlaceTypeRestaurant]];
        
        self.numberOfSelectedTopButton = 1;
        
    }
    if ([sender isEqual:self.topButtons[1]]) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.topButtons[0] setBackgroundColor:self.view.backgroundColor];
            [self.topButtons[0] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
            [self.topButtons[2] setBackgroundColor:self.view.backgroundColor];
            [self.topButtons[2] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
        }];
        [self.bottomButtons[0] setTitle:@"Game" forState:UIControlStateNormal];
        [self.bottomButtons[1] setTitle:@"Gym" forState:UIControlStateNormal];
        [self makeDistanceLimit:[[CoreDataManager defaultManager] fetchPlaceWith:kPlaceTypeGym and:kPlaceTypeGame]];
        
        self.numberOfSelectedTopButton = 2;
        
    }
    if ([sender isEqual:self.topButtons[2]]) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.topButtons[0] setBackgroundColor:self.view.backgroundColor];
            [self.topButtons[0] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
            [self.topButtons[1] setBackgroundColor:self.view.backgroundColor];
            [self.topButtons[1] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
        }];
        [self.bottomButtons[0] setTitle:@"Cinema, Theater" forState:UIControlStateNormal];
        [self.bottomButtons[1] setTitle:@"Museum" forState:UIControlStateNormal];
        [self makeDistanceLimit:[[CoreDataManager defaultManager] fetchPlaceWith:kPlaceTypeCinema and:kPlaceTypeMuseum]];
        
        self.numberOfSelectedTopButton = 3;    }

    [self.tableView reloadData];
}

- (IBAction)bottomButtonTouched:(UIButton *)sender {
    if ([sender.backgroundColor isEqual:self.view.backgroundColor]) {
        [UIView animateWithDuration:0.2 animations:^{
            sender.backgroundColor = [UIColor eveningPlannerGreenColor];
            [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }];
    }
    [self.tableView reloadData];
    if ([sender isEqual:self.bottomButtons[0]]) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.bottomButtons[1] setBackgroundColor:self.view.backgroundColor];
            [self.bottomButtons[1] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
            
            self.isTheFirstBottomButtonTouched = YES;
        }];
    }
    if ([sender isEqual:self.bottomButtons[1]]) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.bottomButtons[0] setBackgroundColor:self.view.backgroundColor];
            [self.bottomButtons[0] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
            self.isTheFirstBottomButtonTouched = NO;
        }];
    }

    [self choosingPlaceType];
}

- (void)choosingPlaceType {
    if (self.isTheFirstBottomButtonTouched) {
        switch (self.numberOfSelectedTopButton) {
            case 1:
                [self makeDistanceLimit:[[CoreDataManager defaultManager] fetchPlaceWith:kPlaceTypeFastFood]];
                break;
            case 2:
                [self makeDistanceLimit:[[CoreDataManager defaultManager] fetchPlaceWith:kPlaceTypeGame]];
                break;
            case 3:
                [self makeDistanceLimit:[[CoreDataManager defaultManager] fetchPlaceWith:kPlaceTypeCinema]];
                break;
                
            default:
                break;
        }
    } else {
        switch (self.numberOfSelectedTopButton) {
            case 1:
                [self makeDistanceLimit:[[CoreDataManager defaultManager] fetchPlaceWith:kPlaceTypeRestaurant]];
                break;
            case 2:
                [self makeDistanceLimit:[[CoreDataManager defaultManager] fetchPlaceWith:kPlaceTypeGym]];
                break;
            case 3:
                [self makeDistanceLimit:[[CoreDataManager defaultManager] fetchPlaceWith:kPlaceTypeMuseum]];
                break;
                
            default:
                break;
        }
    }
    [self.tableView reloadData];
}
#pragma mark - TableView Delegate and DataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    Place *place = self.places[indexPath.row];
    [cell.logo setImage:[UIImage imageNamed:place.logo]];
    [cell.name setText:place.name];
    [cell.price setText:[NSString stringWithFormat:@"%@",place.price]];

    [cell.distanceLabel setText:[NSString stringWithFormat:@"%.01f kilometer from current position.",
                                 [self.distances[place.name] floatValue]/1000]];
    [cell.addOrRemoveButton setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    for (NSManagedObjectID *temp in self.placesObjectIDs) {
        if ([temp isEqual:place.objectID]) {
            [cell.addOrRemoveButton setBackgroundImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
        }
    }
    [[cell addOrRemoveButton] addTarget:nil
                                 action:@selector(addOrRemoveButtonTouched:)
                       forControlEvents:UIControlEventTouchUpInside];
    [cell showRating:place.rating];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoViewController *infoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"infoVC"];
    infoVC.placeObjectID = [self.places[indexPath.row] objectID];
    infoVC.selectedPlacesIDs = self.placesObjectIDs;
    infoVC.currentMoney = self.currentMoney;
    [self showViewController:infoVC sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Methods for sorting
- (IBAction)sortReverseButtonTouched:(id)sender {
    self.places = [[self.places reverseObjectEnumerator] allObjects];
    [self.tableView reloadData];
}

- (IBAction)sortByButtonTouched:(id)sender {
    if ([self.sortingButtons[0] alpha] == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            for (int i = 0; i < self.sortByViews.count; i++) {
                [self.sortingButtons[i] setAlpha:1];
                [self.sortByViews[i] setAlpha:1];
            }
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            for (int i= 0; i < self.sortingButtons.count; i++) {
                [self.sortingButtons[i] setAlpha:0];
                [self.sortByViews[i] setAlpha:0];
            }
        }];
    }
}
- (IBAction)sortByRatingButtonTouched:(id)sender {
    [self sortByRating];
    [UIView animateWithDuration:0.5 animations:^{
        for (int i= 0; i < self.sortingButtons.count; i++) {
            [self.sortingButtons[i] setAlpha:0];
            [self.sortByViews[i] setAlpha:0];
        }
    }];
}
- (IBAction)sortByPriceButtonTouched:(id)sender {
    [self sortByPrice];
    [UIView animateWithDuration:0.5 animations:^{
        for (int i= 0; i < self.sortingButtons.count; i++) {
            [self.sortingButtons[i] setAlpha:0];
            [self.sortByViews[i] setAlpha:0];
        }
    }];
}
- (IBAction)sortByDistanceButtonTouched:(id)sender {
    [self sortByDistance];
    [UIView animateWithDuration:0.5 animations:^{
        for (int i= 0; i < self.sortingButtons.count; i++) {
            [self.sortingButtons[i] setAlpha:0];
            [self.sortByViews[i] setAlpha:0];
        }
    }];
}
- (IBAction)sortByNameButtonTouched:(id)sender {
    [self sortByName];
    [UIView animateWithDuration:0.5 animations:^{
        for (int i= 0; i < self.sortingButtons.count; i++) {
            [self.sortingButtons[i] setAlpha:0];
            [self.sortByViews[i] setAlpha:0];
        }
    }];
}



- (void)sortByRating {
    self.sortingMethod = @selector(sortByRating);
    self.places = [self.places sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        return [[(Place *)a rating] compare:[(Place *)b rating]];
    }];
    [self.tableView reloadData];

}

- (void)sortByName {
    self.sortingMethod = @selector(sortByName);
    self.places = [self.places sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        return [[(Place *)a name] compare:[(Place *)b name]];
    }];
    [self.tableView reloadData];

}

- (void)sortByPrice {
    self.sortingMethod = @selector(sortByPrice);
    self.places = [self.places sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        return [[(Place *)a price] compare:[(Place *)b price]];
    }];
    [self.tableView reloadData];

}

- (void)sortByDistance {
    NSArray *names;
    self.sortingMethod = @selector(sortByDistance);
    names = [self.distances keysSortedByValueUsingComparator:^NSComparisonResult(id a, id b) {
        return [a compare:b];
    }];
    NSMutableArray *sortedPlaces = [[NSMutableArray alloc] init];
    for (NSString *name in names) {
        for (Place *place in self.places) {
            if ([place.name isEqualToString:name]) {
                [sortedPlaces addObject:place];
                break;
            }
        }
    }
    self.places = [sortedPlaces copy];
    [self.tableView reloadData];

}

@end
