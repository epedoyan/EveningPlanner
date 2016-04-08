//
//  ChoicePageViewController.m
//  Group app1
//
//  Created by User on 4/9/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "ChoicePageViewController.h"

@interface  ChoicePageViewController () <UITableViewDataSource, UITextViewDelegate>
@end

@implementation ChoicePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"choiceCell"
                                                            forIndexPath:indexPath];
  //  [ (TableViewCell *)cell minus.hidden]= NO;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0;
}

@end
