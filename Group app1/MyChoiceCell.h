//
//  MyChoiceCell.h
//  eveningPlanner
//
//  Created by User on 4/9/16.
//
//

#import <UIKit/UIKit.h>

@interface MyChoiceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;

@end
