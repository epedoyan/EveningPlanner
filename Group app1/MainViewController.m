//
//  MainViewController.m
//  Group app1
//
//  Created by Musho on 05/04/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "MainViewController.h"
#import "UIColor+EveningPlannerColor.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UISlider *rangSlider;
@property (weak, nonatomic) IBOutlet UILabel *rangeLabel;
@property (weak, nonatomic) IBOutlet UITextField *moneyField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchButtonBottomLayout;
@property (weak, nonatomic) IBOutlet UILabel *metrLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBarCustomizing];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    if (sender.value < 1) {
        self.rangeLabel.text = [[NSString stringWithFormat:@"%f",(sender.value * 1000)] substringToIndex:3];
        self.metrLabel.text = @"Metr";
    } else {
        self.rangeLabel.text = [[NSString stringWithFormat:@"%f",sender.value] substringToIndex:3];
        self.metrLabel.text = @"Kilometr";
    }
}

- (IBAction)searchButtonTouched:(id)sender {
    self.money = [self.moneyField.text integerValue];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [userInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardRect = [keyboardFrameBegin CGRectValue];
    
    self.searchButtonBottomLayout.constant = keyboardRect.size.height + 5;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.text.length > 5) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning!!!" message:@"You can't write more than 6 numbers." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction];
        alert.view.center = self.view.center;
        [self presentViewController:alert animated:YES completion:nil];
        
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
