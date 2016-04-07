//
//  choicePageVC.m
//  Group app1
//
//  Created by User on 4/7/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "choicePageVC.h"

@interface  choicePageVC () <UITableViewDataSource>

@end

@implementation choicePageVC

- (void)viewDidLoad {
    	[super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"choiceCell"
                                                            forIndexPath:indexPath];
    return cell;
}

@end
