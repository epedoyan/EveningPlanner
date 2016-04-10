//
//  InfoViewController.m
//  eveningPlanner
//
//  Created by Musho on 10/04/16.
//
//

#import "InfoViewController.h"

@interface InfoViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingStars;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageScrollView.contentSize = CGSizeMake(self.imageScrollView.frame.size.width * 3, self.imageScrollView.frame.size.height);
    CGRect imageViewRect = self.imageScrollView.bounds;
    UIImageView *firstImage = [self newImageViewWithImage:[UIImage imageNamed:@"kfc1"] frame:imageViewRect];
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *seconfImage = [self newImageViewWithImage:[UIImage imageNamed:@"kfc2"] frame:imageViewRect];
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *thirdImage = [self newImageViewWithImage:[UIImage imageNamed:@"kfc3"] frame:imageViewRect];
    
    [self.imageScrollView addSubview:firstImage];
    [self.imageScrollView addSubview:seconfImage];
    [self.imageScrollView addSubview:thirdImage];
}
- (IBAction)addOrRemoveButtonTouched:(UIButton *)sender {
    if (![sender.currentBackgroundImage isEqual:[UIImage imageNamed:@"minus"]]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    }
}

- (UIImageView *) newImageViewWithImage:(UIImage *)image frame:(CGRect)frame{
    UIImageView *result = [[UIImageView alloc] initWithFrame:frame];
    result.contentMode = UIViewContentModeScaleAspectFit;
    result.image = image;
    return result;
}

@end
