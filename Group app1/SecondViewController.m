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

@interface SecondViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bottomButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *topButtons;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *tableViewLabel;

@property (strong, nonatomic) NSArray *places;
@property (nonatomic) BOOL isTheFirstButtonTouched;


@end



@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isTheFirstButtonTouched = YES;
    
    MainViewController *mainVC = self.navigationController.viewControllers[0];
    self.navigationItem.title = [NSString stringWithFormat:@"%ld AMD", (long)mainVC.money];
    for (UIButton *button in self.bottomButtons) {
        button.hidden = YES;
    }
    self.tableView.hidden = YES;
    self.tableViewLabel.hidden = YES;
    
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
}

- (void)addOrRemoveButtonTouched:(UIButton *)sender {
    if (![sender.currentBackgroundImage isEqual:[UIImage imageNamed:@"minus"]]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    [[cell logo] setImage:[UIImage imageNamed:[self.places[indexPath.row] logo]]];
    [[cell name] setText:[self.places[indexPath.row] name]];
    [[cell price] setText:[NSString stringWithFormat:@"%@",[self.places[indexPath.row] price]]];
    [[cell addOrRemoveButton] addTarget:nil
                                 action:@selector(addOrRemoveButtonTouched:)
                       forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0;
}


- (IBAction)topButtonTouched:(UIButton *)sender {
    self.tableView.hidden = YES;
    self.tableViewLabel.hidden = YES;
    [self.bottomButtons[0] setBackgroundColor:self.view.backgroundColor];
    [self.bottomButtons[1] setBackgroundColor:self.view.backgroundColor];
    [self.bottomButtons[0] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
    [self.bottomButtons[1] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];

    
    [self.tableView reloadData];
    
    
    if ([sender.backgroundColor isEqual:self.view.backgroundColor]) {
        [UIView animateWithDuration:0.2 animations:^{
            sender.backgroundColor = [UIColor eveningPlannerGreenColor];
            [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }];
    }
    [self.tableView reloadData];
    if ([sender isEqual:self.topButtons[0]]) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.topButtons[1] setBackgroundColor:self.view.backgroundColor];
            [self.topButtons[1] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
            [self.topButtons[2] setBackgroundColor:self.view.backgroundColor];
            [self.topButtons[2] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
        }];
        [self.bottomButtons[0] setTitle:@"Fast Food" forState:UIControlStateNormal ];
        [self.bottomButtons[1] setTitle:@"Restaurant" forState:UIControlStateNormal];
        
        if (self.isTheFirstButtonTouched) {
            self.places = [[CoreDataManager defaultManager] fetchFastFood];
            NSLog(@"Count%lu", (unsigned long)[self.places count]);

        } else {
            self.places = [[CoreDataManager defaultManager] fetchRestaurants];
           // NSLog(@"Count%lu", (unsigned long)[self.places count]);
        }

        
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
        if (self.isTheFirstButtonTouched) {
            self.places = [[CoreDataManager defaultManager] fetchGames];
        } else {
            self.places = [[CoreDataManager defaultManager] fetchGyms];
        }

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
        if (self.isTheFirstButtonTouched) {
            self.places = [[CoreDataManager defaultManager] fetchCinemaTheatre];
        } else {
            self.places = [[CoreDataManager defaultManager] fetchMuseum];
        }
    }
    for (UIButton *button in self.bottomButtons) {
        [UIView animateWithDuration:0.5 animations:^{
            button.hidden = NO;
        }];
    }
    
    //[self.tableView reloadData];
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
            //self.isTheFirstButtonTouched = YES;
        }];
    }
    if ([sender isEqual:self.bottomButtons[1]]) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.bottomButtons[0] setBackgroundColor:self.view.backgroundColor];
            [self.bottomButtons[0] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
            self.isTheFirstButtonTouched = NO;
        }];
    }
    self.tableView.hidden = NO;
    self.tableViewLabel.hidden = NO;
    [self.tableView reloadData];
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.placeObjectID = [self.places[indexPath.row] objectID];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
