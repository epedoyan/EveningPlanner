//
//  CoreDataManager.m
//  eveningPlanner
//
//  Created by User on 4/12/16.
//
//

#import "CoreDataManager.h"
#import "CDConstants.m"


@implementation CoreDataManager

+ (id)defaultManager {
    static CoreDataManager *defaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultManager = [[self alloc] init];
    });
    return defaultManager;
}

- (void)insertRestaurantsList {
    NSManagedObjectContext *context = [self managedObjectContext];
    

//Games
    
    
    Place *PlayCity = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [PlayCity setName:@"PlayCity"
      descriptionInfo:@"Play City was founded in 2002 originally having the idea of various funny and safe entertainment services in Armenia having the basis of high-quality service, new technologies and unique resting place. The only place in Armenia where you can find various services for your pastime and entertainment are gathered in one place. Karting, Bowling, Buggy, Game Machines, 7D Cinema, Bumper-Car, Mini Golf, Paint Ball, Billiards, as well as restaurant, cafe-bar where you can organize your birthday, parties and corporative events."
                 logo:@"playcity-logo"
                price:@15000
               rating:@3
               image1:@"playcityimg1"
               image2:@"playcityimg2"
               image3:@"playcityimg3"
//               image4:@"playcityimg4"
//               image5:@"playcityimg5"
//               image6:@"playcityimg6"
//               image7:@"playcityimg7"
//               image8:@"playcityimg8"
                  url:@"www.playcity.am"
        contactNumber:@"+37410 620-999"
              address:@"35 Acharyan Str., Yerevan, Armenia"
            placeType:@"Games and Restaurant"
            longitude:@44.55773
             latitude:@40.21896];
    
    
    
    Place *CaptainKid = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [CaptainKid setName:@"Captain Kid"
        descriptionInfo:@"Captain Kid's Treasure Island is a huge indoor playground situated in Yerevan Mall. Captain Kid's Entertainment Centre, provides a safe and affordable fun environment for children ages 3 to 18 years old. Families with small children to teenagers are welcom to enjoy range of entirely indoor facilities such as laberint, bumper cars, climbing wall, big variety of gaming machins, 7D theatre etc."
                   logo:@"captainkid-logo"
                  price:@8000
                 rating:@4
                 image1:@"captainkidimg1"
                 image2:@"captainkidimg2"
                 image3:@"captainkidimg3"
//                 image4:@"captainkidimg4"
//                 image5:@"captainkidimg5"
                    url:@"www.captainkid.am"
          contactNumber:@"+37411 200-022"
                address:@"34 Arshakunyats Av., Yerevan, Armenia"
              placeType:@"Games"
              longitude:@44.50008
               latitude:@40.15389];
    
    Place *Aeon = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [Aeon setName:@"Aeon"
        descriptionInfo:@"AEON, Yerevan’s first ever anti-café, first opened its doors in the unbelievably cold winter of 2014. The unfamiliar word 'anti-café', its unique name and its hard-to-find location quickly grabbed the interest of social networks and the media. Now it feels like AEON has always been here, at the corner of Teryan and Pushkin streets, in the backyard of the ruins of the destroyed Afrikyans’ Club. AEON, Yerevan’s first ever anti-café, first opened its doors in the unbelievably cold winter of 2014. The unfamiliar word 'anti-café', its unique name and its hard-to-find location quickly grabbed the interest of social networks and the media. Now it feels like AEON has always been here, at the corner of Teryan and Pushkin streets, in the backyard of the ruins of the destroyed Afrikyans’ Club."
                   logo:@"aeon-logo"
                  price:@2000
                 rating:@5
                 image1:@"aeonimg1"
                 image2:@"aeonimg2"
                 image3:@"aeonimg3"
//                 image4:@"aeonimg4"
//                 image5:@"aeonimg5"
//                 image6:@"aeonimg6"
                    url:@"www.aeonyerevan.com"
          contactNumber:@"+37410 538-766 "
                address:@"3A Teryan Str., Yerevan, Armenia"
              placeType:@"Games"
              longitude:@44.51198
               latitude:@40.18113];
    
    Place *Loft = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [Loft setName:@"Loft"
  descriptionInfo:@"Loft is unique multifunctional center with different functional zones (art and music, healthy lifestyle, games, leisure and rest, cinema hall, kitchen, etc.). It's great place to spend time with family and friends watching movies, cooking, playing various types of intellectual or board games, enjoying ethnic, jazz concerts, dancing events (with coffee, tea and cookies for free). For all up-mentioned you pay 10 AMD per minute (daytime tariff), 17 AMD per minute (evening tariff) and for the whole night- 999 AMD."
             logo:@"loft-logo"
            price:@2000
           rating:@4
           image1:@"loftimg1"
           image2:@"loftimg2"
           image3:@"loftimg3"
//           image4:@"loftimg4"
//           image5:@"loftimg5"
              url:@"www.loft.am"
    contactNumber:@"+37443 408-864 "
          address:@"3 Moskovyan Str., Yerevan, Armenia"
        placeType:@"Games"
        longitude:@44.52235
         latitude:@40.18415];
    
    
    Place *DalmaBowling = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [DalmaBowling setName:@"Bowling"
  descriptionInfo:@"Having the latest models of bowling equipment, our bowling halls are the best choice for the rest with family and friends."
             logo:@"dalmabowling-logo"
            price:@6000
           rating:@3
           image1:@"dalmabowlingimg1"
           image2:@"dalmabowlingimg2"
           image3:@"dalmabowlingimg3"
                url:@"www.dalma.am"
    contactNumber:@"+37460 755-555"
          address:@"3 Tsitsernakaberd Hwy, Yerevan, Armenia"
        placeType:@"Games"
        longitude:@44.48862
         latitude:@40.17903	];
    
    
    
//Gyms
    
    
    
    Place *BoulderTown = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [BoulderTown setName:@"Boulder Town"
         descriptionInfo:@"Boulder town is the first specified climbing gym in Armenia. Either if you are already a climber looking for a place to train or if you are a beginner interested in learning practical and theoretical skills, Boulder Town is your place!. We plan to offer you not only a place to do sport and improve your climbing skills, but also an area to meet other climbers, hang out and share projects and activities. Feel free to propose what you would like us to do for you! We are waiting for you seven days a week from 4 pm to 10:00 pm! Everybody is welcome!"
             logo:@"bouldertown-logo"
            price:@3500
           rating:@5
           image1:@"bouldertownimg1"
           image2:@"bouldertownimg2"
           image3:@"bouldertownimg3"
//           image4:@"bouldertownimg2"
              url:@"www.upthrocks.com"
    contactNumber:@"+37493 337-937"
          address:@"1 Kajaznuni Str., Yerevan, Armenia"
        placeType:@"Gym"
        longitude:@44.51967
         latitude:@40.17060];
    

    Place *GoldsGym = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [GoldsGym setName:@"Gold's Gym"
      descriptionInfo:@"Established in Venice, California in 1965, Gold’s Gym is the largest full service chain in the world with over 700 locations in 42 states and 28 countries. Gold’s Gym offers state of the art exercise equipment and industry leading fitness programs, including group exercise, personal training, cardiovascular equipment, cycling, Pilates, yoga and Cardio.With over 3.5 million members worldwide, Gold’s Gym helps all kinds of people achieve their individual potential through fitness."
                    logo:@"bouldertown-logo"
                   price:@3500
                  rating:@4
                  image1:@"goldsgymimg1"
                  image2:@"goldsgymimg2"
                  image3:@"goldsgymimg3"
//                  image4:@"goldsgymimg4"
                     url:@"www.goldsgym.am"
           contactNumber:@"+37410 322-010"
                 address:@"40/1 Komitas Av., Yerevan, Armenia"
               placeType:@"Gym"
               longitude:@44.50827
                latitude:@40.20554];
    

    Place *Incourt = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [Incourt setName:@"Incourt tennis club"
     descriptionInfo:@"Incourt tennis club operates since 1974. Over 40 years our club has become the best choice for, professional tennis players, tennis amateurs and active recreation funs. In 2014 the club was rebranded becoming Incourt tennis club the only professional institution to promote tennis in Armenia. The mission of our club is to form and spread tennis culture turning it to a trendy lifestyle. Incourt tennis club operates within the framework of Kinetic Sports company which also includes Orange Fitness club. "
                 logo:@"incourt-logo"
                price:@3500
               rating:@5
               image1:@"incourtimg1"
               image2:@"incourtimg2"
               image3:@"incourtimg3"
//               image3:@"incourtimg3"
                  url:@"www.incourt.am"
        contactNumber:@"+37410 565-665"
              address:@"7/1 Tsitsernakaberdi Hwy., Yerevan, Armenia"
            placeType:@"Gym"
            longitude:@44.52141
             latitude:@40.21387];


    
    Place *GolfArmenia = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [GolfArmenia setName:@"National Golf Association of Armenia"
     descriptionInfo:@"Incourt tennis club operates since 1974. Over 40 years our club has become the best choice for, professional tennis players, tennis amateurs and active recreation funs. In 2014 the club was rebranded becoming Incourt tennis club the only professional institution to promote tennis in Armenia. The mission of our club is to form and spread tennis culture turning it to a trendy lifestyle. Incourt tennis club operates within the framework of Kinetic Sports company which also includes Orange Fitness club. "
                logo:@"golfarmenia-logo"
               price:@3500
              rating:@3
              image1:@"golfarmeniaimg1"
              image2:@"golfarmeniaimg2"
              image3:@"golfarmeniaimg3"
                 url:@"www.goldarmenia.am"
       contactNumber:@"+37410 565-665"
             address:@"151/2 Z. Sarkavagi Str., Yerevan, Armenia"
           placeType:@"Gym"
           longitude:@44.456928
            latitude:@40.219745];

    Place *GrandSport = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [GrandSport setName:@"Grand Sport"
        descriptionInfo:@"Grand Sport is an international standard sport complex which opened its doors to customers in May 2011. With its high integration, the complex offers a variety of services to win the trust of customers. Our clients visit Grand Sport not only for training, but also to have fun. Grand Sport’s mission is to guide Armenian society and family to a healthy lifestyle, with its huge recreated rooms, professional approach and high quality equipment. We value the customers’ comfort and health, and by using modern methods, we always keep a high level of cleanliness and hygiene. Grand Sport offers its customers’ not only taking care of their appearance and beauty but also their health. The complex offers state of the art equipment, comfortable conditions; moreover, it employs professional trainers who treat each customer with great respect. The complex restores and improves your physical structure with its necessary conditions. It has more than a dozen sport types."
                    logo:@"grandsport-logo"
                   price:@5000
                  rating:@5
                  image1:@"grandsportimg1"
                  image2:@"grandsportimg2"
                  image3:@"grandsportimg3"
                     url:@"www.grandsport.am"
           contactNumber:@"+374(10) 447766"
                 address:@"61 Arshakunyats Av., Yerevan, Armenia"
               placeType:@"Gym"
               longitude:@44.49788
                latitude:@40.14709];
    
    [self saveContext];
}

- (NSArray *)fetchFastFood {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:kEntityNamePlaces];
    
    return [context executeFetchRequest:fetchRequest error:nil];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
