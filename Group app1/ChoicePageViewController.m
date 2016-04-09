//
//  ChoicePageViewController.m
//  Group app1
//
//  Created by User on 4/9/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "ChoicePageViewController.h"
#import "MyChoiceCell.h"

static NSUInteger cellsCount; //temprorary solution, till have DB

@interface  ChoicePageViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIButton *removeButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;

@property (nonatomic) BOOL shouldHideRemoveBtn;

@end

@implementation ChoicePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cellsCount = 3;
    self.shouldHideRemoveBtn = YES;
    self.clearButton.hidden = YES;
}

- (IBAction)clearButtonAction {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *alertActionClear = [UIAlertAction actionWithTitle:@"Clear All" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        cellsCount = 0;
        [self.myTableView reloadData];
    }];
    [alert addAction:alertActionClear];
    
    UIAlertAction *alertActionCancel = [ UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

    [alert addAction:alertActionCancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)editButtonAction:(UIBarButtonItem *)sender {
    
    //NSLog(@"Edit title %@", sender.title);
    
    if ([sender.title isEqualToString:@"Edit"]) {
        self.shouldHideRemoveBtn = NO;
        self.clearButton.hidden = NO;
        [sender setTitle:@"Done"];
    }
    else {
        self.shouldHideRemoveBtn = YES;
        self.clearButton.hidden = YES;
        [sender setTitle:@"Edit"];
    }
    
    [self.myTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cellsCount;
}

#pragma mark - UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    self.myTableView = tableView;
    MyChoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"choiceCell"
                                                            forIndexPath:indexPath];
    
    self.removeButton = cell.removeButton;
    self.removeButton.tag = indexPath.row;
    
    [self.removeButton addTarget:self action:@selector(removeButtonActionForTableView:)
     forControlEvents:UIControlEventTouchUpInside];
    
    if (self.shouldHideRemoveBtn) {
        [UIButton animateWithDuration:0.5 animations:^{
        cell.removeButton.hidden = YES;
        }];
    }
    else {
        [UIButton animateWithDuration:0.5 animations:^{
            cell.removeButton.hidden = NO;
        }];
    }
    
    return cell;
}

- (void)removeButtonActionForTableView: (UIButton *) sender{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(long)sender.tag inSection:0];
    
    [self tableView:self.myTableView commitEditingStyle: UITableViewCellEditingStyleDelete
          forRowAtIndexPath: indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0;
}

#pragma mark - UITextViewDelegate methods

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.shouldHideRemoveBtn) {
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleNone;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                                             forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        cellsCount--;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

@end
