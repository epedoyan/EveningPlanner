//
//  MainViewController.m
//  Group app1
//
//  Created by Musho on 05/04/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "MainViewController.h"
#import "UIColor+EveningPlannerColor.h"
#import "SecondViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UISlider *rangSlider;
@property (weak, nonatomic) IBOutlet UILabel *rangeLabel;
@property (weak, nonatomic) IBOutlet UITextField *moneyField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchButtonBottomLayout;
@property (weak, nonatomic) IBOutlet UILabel *metrLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconTopLayout;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBarCustomizing];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    [self.moneyField resignFirstResponder];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    if (sender.value < 1) {
        self.rangeLabel.text = [[NSString stringWithFormat:@"%f",(sender.value * 1000)] substringToIndex:3];
        self.metrLabel.text = @"Meter";
    } else {
        self.rangeLabel.text = [[NSString stringWithFormat:@"%f",sender.value] substringToIndex:3];
        self.metrLabel.text = @"Kilometer";
    }
}

- (IBAction)searchButtonTouched:(id)sender {
    SecondViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"secondVC"];
    secondVC.money = [self.moneyField.text integerValue];
    if ([self.rangeLabel.text floatValue] < 100) {
        secondVC.distanceLimit = [self.rangeLabel.text floatValue];
    } else {
        secondVC.distanceLimit = [self.rangeLabel.text floatValue] / 1000;
    }
    
    if (secondVC.money <= 500 || secondVC.money >= 100000) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning!!!" message:@"Please, write in the range from 500 to 100000" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction];
        alert.view.center = self.view.center;
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        [self showViewController:secondVC sender:self];
    }
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [userInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardRect = [keyboardFrameBegin CGRectValue];
    
    self.searchButtonBottomLayout.constant = keyboardRect.size.height + 5;
    
    self.iconTopLayout.constant = -(self.view.frame.size.height / 3.0);
    
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];

}

- (void)keyboardWillHide:(NSNotification *)notification {
    
    self.searchButtonBottomLayout.constant = 30;
    self.iconTopLayout.constant = 0;
    
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.text.length > 6) {
        textField.text = [textField.text substringToIndex:6];
    }
    return YES;
}

- (void)navigationBarCustomizing {
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor eveningPlannerGreenColor];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UILabel *barTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 48)];
    barTitle.textColor = [UIColor blackColor];
    barTitle.text = @"eveningPlanner";
    barTitle.font = [UIFont fontWithName:@"Party LET" size:40.0];
    
    [self.navigationItem setTitleView:barTitle];
}

@end
