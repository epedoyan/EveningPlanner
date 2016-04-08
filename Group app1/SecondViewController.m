//
//  SecondViewController.m
//  Group app1
//
//  Created by Musho on 06/04/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "SecondViewController.h"
#import "TableViewCell.h"
#import "UIColor+EveningPlannerColor.h"
#import "MainViewController.h"

@interface SecondViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bottomButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *topButtons;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *tableViewLabel;

@end



@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainViewController *mainVC = self.navigationController.viewControllers[0];
    self.navigationItem.title = [NSString stringWithFormat:@"%ld AMD", (long)mainVC.money];
    for (UIButton *button in self.bottomButtons) {
        button.hidden = YES;
    }
    self.tableView.hidden = YES;
    self.tableViewLabel.hidden = YES;
    // Updates back button title on ChoicePageViewController
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    [[(TableViewCell *)cell logo] setImage:[UIImage imageNamed:@"kfc-logo"]];
    [[(TableViewCell *)cell name] setText:@"KFC"];
    [[(TableViewCell *)cell price] setText:@"3000"];
    
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
    }
    for (UIButton *button in self.bottomButtons) {
        [UIView animateWithDuration:0.5 animations:^{
            button.hidden = NO;
        }];
    }
}

- (IBAction)bottomButtonTouched:(UIButton *)sender {
    if ([sender.backgroundColor isEqual:self.view.backgroundColor]) {
        [UIView animateWithDuration:0.2 animations:^{
            sender.backgroundColor = [UIColor eveningPlannerGreenColor];
            [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }];
    }
    if ([sender isEqual:self.bottomButtons[0]]) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.bottomButtons[1] setBackgroundColor:self.view.backgroundColor];
            [self.bottomButtons[1] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
        }];
    }
    if ([sender isEqual:self.bottomButtons[1]]) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.bottomButtons[0] setBackgroundColor:self.view.backgroundColor];
            [self.bottomButtons[0] setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
        }];
    }
    self.tableView.hidden = NO;
    self.tableViewLabel.hidden = NO;
}

@end
