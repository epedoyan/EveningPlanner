//
//  TableViewCell.m
//  Group app1
//
//  Created by Musho on 06/04/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (IBAction)addOrRemoveButtonTouched:(UIButton *)sender {
}

- (void)showRating:(NSNumber *)activeStarsQty {
    for ( NSInteger i = 0; i < 5; ++i ) {
        if( i < [activeStarsQty integerValue] ) {
            [self.starIcons[i] setImage:[UIImage imageNamed:@"star_active"]];
        }
        else {
            [self.starIcons[i] setImage:[UIImage imageNamed:@"star_inactive"]];
        }
    }
}

@end
