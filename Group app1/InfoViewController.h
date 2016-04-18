//
//  InfoViewController.h
//  eveningPlanner
//
//  Created by Musho on 19/04/16.
//
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectID *placeObjectID;
@property (nonatomic, strong) NSMutableArray *selectedPlacesIDs;

@property (nonatomic) NSInteger currentMoney;

@end