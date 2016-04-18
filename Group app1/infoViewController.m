//
//  InfoViewController.m
//  eveningPlanner
//
//  Created by Musho on 10/04/16.
//
//

#import "InfoViewController.h"
#import "CoreDataManager.h"
#import "MapViewController.h"
#import "WebViewController.h"

@interface InfoViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingStars;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *urlButton;
@property (weak, nonatomic) IBOutlet UIButton *mapButton;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSManagedObjectContext *context = [[CoreDataManager defaultManager] managedObjectContext];
    Place *place = [context objectWithID:self.placeObjectID];
    
    self.imageScrollView.frame = CGRectMake(self.imageScrollView.frame.origin.x, self.imageScrollView.frame.origin.y, self.view.frame.size.width, self.imageScrollView.frame.size.height);
    self.imageScrollView.contentSize = CGSizeMake(self.imageScrollView.frame.size.width * 3, self.imageScrollView.frame.size.height);
    CGRect imageViewRect = self.imageScrollView.bounds;
    
     UIImageView *firstImage = [self newImageViewWithImage:[UIImage imageNamed:place.imageFirst] frame:imageViewRect];
        imageViewRect.origin.x += imageViewRect.size.width;
        UIImageView *seconfImage = [self newImageViewWithImage:[UIImage imageNamed:place.imageSecond] frame:imageViewRect];
        imageViewRect.origin.x += imageViewRect.size.width;
        UIImageView *thirdImage = [self newImageViewWithImage:[UIImage imageNamed:place.imageThird] frame:imageViewRect];
    
    self.priceLabel.text = [place.price.stringValue stringByAppendingString:@" AMD"];
    self.descriptionTextView.text = place.descriptionInfo;
    [self.urlButton setTitle:[place.urlString stringByReplacingOccurrencesOfString:@"http://" withString:@""]forState:UIControlStateNormal];
    [self.mapButton setTitle:[place.address stringByReplacingOccurrencesOfString:@", Yerevan, Armenia" withString:@""]forState:UIControlStateNormal];
    [self.callButton setTitle:place.contactNumber forState:UIControlStateNormal];
   
    self.callButton.titleLabel.text = place.contactNumber;
    
    [self.imageScrollView addSubview:firstImage];
    [self.imageScrollView addSubview:seconfImage];
    [self.imageScrollView addSubview:thirdImage];
    
    self.navigationItem.title = place.name;

    // rating part
    for ( NSInteger i = 0; i < 5; ++i ) {
        if( i < [place.rating integerValue] ) {
            [self.ratingStars[i] setImage:[UIImage imageNamed:@"star_active"]];
        }
        else {
            [self.ratingStars[i] setImage:[UIImage imageNamed:@"star_inactive"]];
        }
    }
    
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@""
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    
    UIImage* image = [UIImage imageNamed:@"basketadd"];
    CGRect frameimg = CGRectMake(0, 0, 32, 32);
    UIButton *myChoicesButton = [[UIButton alloc] initWithFrame:frameimg];
    [myChoicesButton setBackgroundImage:image forState:UIControlStateNormal];
    [myChoicesButton addTarget:self action:@selector(segueToMyChoice)
         forControlEvents:UIControlEventTouchUpInside];
    [myChoicesButton setShowsTouchWhenHighlighted:NO];
    UIBarButtonItem *button =[[UIBarButtonItem alloc] initWithCustomView:myChoicesButton];
    self.navigationItem.rightBarButtonItem = button;
    
}


- (IBAction)addOrRemoveButtonTouched:(UIButton *)sender {
    if (![sender.currentBackgroundImage isEqual:[UIImage imageNamed:@"minussymbol"]]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"minussymbol"] forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"plussymbol"] forState:UIControlStateNormal];
    }
}

- (UIImageView *) newImageViewWithImage:(UIImage *)image frame:(CGRect)frame{
    UIImageView *result = [[UIImageView alloc] initWithFrame:frame];
    result.contentMode = UIViewContentModeScaleAspectFit;
    result.image = image;
    return result;
}

- (IBAction)mapButtonTouched:(id)sender {
    
    NSManagedObjectContext *context = [[CoreDataManager defaultManager] managedObjectContext];
    Place *place = [context objectWithID:self.placeObjectID];
    
    MapViewController *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mapVC"];
    mapVC.latitudes = [NSArray arrayWithObject:place.latitude];
    mapVC.longitudes = [NSArray arrayWithObject:place.longitude];
    [self showViewController:mapVC sender:self];
    
}
- (IBAction)callPhone:(UIButton *)sender {
    
    NSString *numberWithoutSpaces = [sender.titleLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *phoneNumber = [NSString stringWithFormat:@"tel://%@", numberWithoutSpaces];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction)webButtonTouched:(id)sender {
    NSManagedObjectContext *context = [[CoreDataManager defaultManager] managedObjectContext];
    Place *place = [context objectWithID:self.placeObjectID];
    
    WebViewController *webVC = [self.storyboard instantiateViewControllerWithIdentifier:@"webVC"];
    webVC.urlString = [NSString stringWithString:place.urlString];
    
    NSString *urlWithoutHTTP = [place.urlString stringByReplacingOccurrencesOfString:@"http://" withString:@""];
    webVC.navigationItem.title = [NSString stringWithString:urlWithoutHTTP];

    [self showViewController:webVC sender:self];
}

- (void) segueToMyChoice {
    [self performSegueWithIdentifier:@"SegueToMyChoice" sender:self];
}
- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.imageScrollView.frame.size.width;
    int page = floor((self.imageScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}
- (IBAction)pageControllTouched:(id)sender {
    CGFloat pageWidth = self.imageScrollView.frame.size.width;
    int page = floor((self.imageScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}
@end
