//
//  GreenButton.m
//  Group app1
//
//  Created by Musho on 07/04/16.
//  Copyright © 2016 Paruyr Danielian. All rights reserved.
//

#import "GreenButton.h"
#import "UIColor+EveningPlannerColor.h"

@implementation GreenButton

- (void)awakeFromNib {
    [self setTitleColor:[UIColor eveningPlannerGreenColor] forState:UIControlStateNormal];
    self.layer.borderWidth = 0.8;
    self.layer.borderColor = [[UIColor eveningPlannerGreenColor] CGColor];
    self.layer.cornerRadius = 2.5;

    
}

@end
