//
//  SecondViewController.m
//  Group app1
//
//  Created by Musho on 06/04/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "SecondViewController.h"
#import "MainViewController.h"
#import "ChoicePageViewController.h"
#import "TableViewCell.h"
#import "UIColor+EveningPlannerColor.h"
#import "CoreDataManager.h"
#import "InfoViewController.h"

@interface SecondViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bottomButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *topButtons;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *tableViewLabel;

@property (strong, nonatomic) NSArray *places;

@property (nonatomic) BOOL isTheFirstBottomButtonTouched;
@property (nonatomic) NSInteger numberOfSelectedTopButton;

@end



@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.placesObjectIDs = [[NSMutableArray alloc] init];
    
    for (UIButton *button in self.bottomButtons) {
        button.hidden = YES;
    }
    self.tableView.hidden = YES;
    self.tableViewLabel.hidden = YES;
    
    self.navigationItem.title = [NSString stringWithFormat:@"%ld AMD", (long)self.money];
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
}

- (void)addOrRemoveButtonTouched:(UIButton *)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(TableViewCell *)[sender superview]];
    NSManagedObjectID *placeID = [self.places[indexPath.row] objectID];
    
    if (![sender.currentBackgroundImage isEqual:[UIImage imageNamed:@"minus"]]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
        [self.placesObjectIDs removeObject:placeID];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
        [self.placesObjectIDs addObject:placeID];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    Place *place = self.places[indexPath.row];
    [cell.logo setImage:[UIImage imageNamed:place.logo]];
    [cell.name setText:place.name];
    [cell.price setText:[NSString stringWithFormat:@"%@",place.price]];
    [cell.addOrRemoveButton setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    for (Place *temp in self.places) {
        if ([temp.objectID isEqual:place.objectID]) {
            [cell.addOrRemoveButton setBackgroundImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
        }
    }
    [[cell addOrRemoveButton] addTarget:nil
                                 action:@selector(addOrRemoveButtonTouched:)
                       forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0;
}


- (IBAction)topButtonTouched:(UIButton *)sender {
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
        [self.bottomButtons[0] setTitle:@"Fast Food" forState:UIControlStateNormal ];
        [self.bottomButtons[1] setTitle:@"Restaurant" forState:UIControlStateNormal];
        
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
        self.numberOfSelectedTopButton = 2;

    }
    if ([sender isEqual:self.topButtons[2]]) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.topButtons[0] setBackgroundColor:self.view.backgroundColor];
            [self.topButtons[0] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
            [self.topButtons[1] setBackgroundColor:self.view.backgroundColor];
            [self.topButtons[1] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
        }];
        [self.bottomButtons[0] setTitle:@"Cinema, Theatre" forState:UIControlStateNormal];
        [self.bottomButtons[1] setTitle:@"Museum" forState:UIControlStateNormal];
        self.numberOfSelectedTopButton = 3;    }
    for (UIButton *button in self.bottomButtons) {
        [UIView animateWithDuration:0.5 animations:^{
            button.hidden = NO;
        }];
    }
    [self choosingPlaceType];
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
    self.tableView.hidden = NO;
    self.tableViewLabel.hidden = NO;
    [self choosingPlaceType];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoViewController *infoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"infoVC"];
    infoVC.placeObjectID = [self.places[indexPath.row] objectID];
    [self showViewController:infoVC sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)choosingPlaceType {
    if (self.isTheFirstBottomButtonTouched) {
        switch (self.numberOfSelectedTopButton) {
            case 1:
                self.places = [[CoreDataManager defaultManager] fetchFastFood];
                break;
            case 2:
                self.places = [[CoreDataManager defaultManager] fetchGames];
                break;
            case 3:
                self.places = [[CoreDataManager defaultManager] fetchCinemaTheatre];
                break;
                
            default:
                break;
        }
    } else {
        switch (self.numberOfSelectedTopButton) {
            case 1:
                self.places = [[CoreDataManager defaultManager] fetchRestaurants];
                break;
            case 2:
                self.places = [[CoreDataManager defaultManager] fetchGyms];
                break;
            case 3:
                self.places = [[CoreDataManager defaultManager] fetchMuseum];
                break;
                
            default:
                break;
        }
    }
    [self.tableView reloadData];
}


@end
