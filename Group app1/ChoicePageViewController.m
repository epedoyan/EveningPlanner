//
//  ChoicePageViewController.m
//  Group app1
//
//  Created by User on 4/9/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "ChoicePageViewController.h"
#import "TableViewCell.h"
#import "SecondViewController.h"
#import "MapViewController.h"

@interface  ChoicePageViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;

@property (nonatomic) BOOL shouldHideRemoveBtn;


@end

@implementation ChoicePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shouldHideRemoveBtn = YES;
    self.clearButton.hidden = YES;
    
    /*if(!self.selectedPlacesIDs.count) {
        //CGRect labelFrame = CGRectMake(0.0f, 0.0f, 100.0f, 23.0f);
        UILabel *myLabel = [[UILabel alloc]init];
        myLabel.text = @"You don't have any places";
        myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
        myLabel.center = self.view.center;
        [myLabel sizeToFit];
        [self.view addSubview:myLabel];

    }*/
}

- (IBAction)clearButtonAction {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *alertActionClear = [UIAlertAction actionWithTitle:@"Clear All" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        [self.selectedPlacesIDs removeAllObjects];
        [self.myTableView reloadData];
    }];
    
    UIAlertAction *alertActionCancel = [ UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:alertActionClear];
    [alert addAction:alertActionCancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)editButtonAction:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"Edit"]) {
        self.shouldHideRemoveBtn = NO;
        self.clearButton.hidden = NO;
        [sender setTitle:@"Done"];
    } else {
        self.shouldHideRemoveBtn = YES;
        self.clearButton.hidden = YES;
        [sender setTitle:@"Edit"];
    }
    [self.myTableView reloadData];
}


- (IBAction)mapButtonTouched {
    NSManagedObjectContext *context = [[CoreDataManager defaultManager] managedObjectContext];
    NSMutableArray *tempLatitudes = [[NSMutableArray alloc] init];
    NSMutableArray *tempLongitudes = [[NSMutableArray alloc] init];
    for (NSManagedObjectID *placeID in self.selectedPlacesIDs) {
        Place *place = [context objectWithID:placeID];
        [tempLatitudes addObject:place.latitude];
        [tempLongitudes addObject:place.longitude];
    }
    MapViewController *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mapVC"];
    mapVC.latitudes = tempLatitudes;
    mapVC.longitudes = tempLongitudes;
    [self showViewController:mapVC sender:self];
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.selectedPlacesIDs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSManagedObjectContext *context = [[CoreDataManager defaultManager] managedObjectContext];
    Place *place = [context objectWithID:self.selectedPlacesIDs[indexPath.row]];    
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    [[cell logo] setImage:[UIImage imageNamed:place.logo]];
    [[cell name] setText:place.name];
    [[cell price] setText:[NSString stringWithFormat:@"%@",place.price]];
    [[cell addOrRemoveButton] setHidden:YES];
    [cell showRating:place.rating];
    
    //cell.addOrRemoveButton.tag = indexPath.row;
    
    [cell.addOrRemoveButton addTarget:self action:@selector(removeButtonActionForTableView:)
     forControlEvents:UIControlEventTouchUpInside];
    
    if (self.shouldHideRemoveBtn) {
        [UIButton animateWithDuration:0.5 animations:^{
        cell.addOrRemoveButton.hidden = YES;
        }];
    }
    else {
        [UIButton animateWithDuration:0.5 animations:^{
            cell.addOrRemoveButton.hidden = NO;
        }];
    }
    
    return cell;
}

- (void)removeButtonActionForTableView: (UIButton *) sender{
    //NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(long)sender.tag inSection:0];
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:(TableViewCell *)[[sender superview] superview]];
    
    [self tableView:self.myTableView commitEditingStyle: UITableViewCellEditingStyleDelete forRowAtIndexPath: indexPath];    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0;
}

#pragma mark - UITableViewDelegate methods

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.shouldHideRemoveBtn) {
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.selectedPlacesIDs removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.myTableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
