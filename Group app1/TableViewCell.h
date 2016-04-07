//
//  TableViewCell.h
//  Group app1
//
//  Created by Musho on 06/04/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIButton *addOrRemoveButton;

@end
