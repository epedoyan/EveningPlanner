//
//  CoreDataManager.m
//  eveningPlanner
//
//  Created by User on 4/12/16.
//
//

#import "CoreDataManager.h"


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
//    
//    Place *rest_Blackberry = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
//    
//    [rest_Blackberry setName:@"Blackberry" descriptionInfo:@"The BlackBerry is one of the “L’Orange” network cafes opened its doors on March 5, 2005 in downtown Yerevan at 21 Abovyan St. The name L’Orange came from the wish to associate it with something fun and happy." logo:@"blackberry-logo" price:@10000 rating:@4 image1:@"blackberryImage1" image2:@"blackberryImage2" image3:@"blackberryImage3" url:@"www.blackberry.lorange.am" contactNumber:@"+37410 516711" address:@"3 Abovyan St, Yerevan, Armenia" placeType:@"Restaurant" longitude:@678 latitude:@765];
//    
    //Museums list
    
    Place *cafesjianMuseum = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
    [cafesjianMuseum setName:@"Cafesjian Center" descriptionInfo:@"The Cafesjian Center for the Arts is dedicated to bringing the best of contemporary art to Armenia and presenting the best of Armenian culture to the world. Inspired by the vision of  its founder, Gerard L. Cafesjian, the Center offers a wide variety of exhibitions, derived from the Gerard L. Cafesjian Collection of contemporary art. Having celebrated its grand opening in November 2009, CCA continues to exhibit unique works of modern art and offers a diverse program of lectures, films, concerts, and numerous educational initiatives for adults and children. Over one million people have visited the Center annually since its opening." logo:@"cafesjian-logo" price:@5000 rating:@4 image1:@"cafesjian1" image2:@"cafesjian2" image3:@"cafesjian3" url:@"http://cmf.am" contactNumber:@"+374 10 567262" address:@"10 Tamanyan St, Yerevan, Armenia" placeType:@"Museum" longitude:@44.515706 latitude:@40.190045];
    
    Place *nationalGallery = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
    [nationalGallery setName:@"National Gallery" descriptionInfo:@"The National Gallery of Armenia is the country’s major art gallery. Its collection is displayed in 56 galleries, which allow the Gallery to tell the story of national visual arts, decorative-applied arts as well as world culture from ancient times to our days. In the galleries of European, Russian, Armenian and Oriental art the visitors are introduced to the art of Aivazovsky, Sarian, Kandinsky, Donatello and other distinguished artists." logo:@"natGallery-logo" price:@3000 rating:@5 image1:@"natGallery1" image2:@"natGallery2" image3:@"natGallery3" url:@"http://gallery.am" contactNumber:@"+374 10 580812" address:@"1 Aram St, Yerevan, Armenia" placeType:@"Museum" longitude:@44.512325 latitude:@40.180735];
    
    Place *erebuniMuseum = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
    [erebuniMuseum setName:@"Erebuni Museum" descriptionInfo:@"Erebuni Fortress also known as Arin Berd is a fortified city from the ancient kingdom of Urartu, located in what is present-day Yerevan, Armenia. It was one of several fortresses built along the northern Urartu border and was one of the most important political, economic and cultural centers of the vast kingdom. The name Yerevan itself is derived from Erebuni. Erebuni was founded by King Argishti I (r. ca. 785–753 B.C.) in 782 B.C. It was built on top of a hill called Arin Berd overlooking the Arax! River Valley to serve as a military stronghold to protect the kingdom's northern borders." logo:@"erebuni-logo" price:@2000 rating:@4 image1:@"erebuni1" image2:@"erebuni2" image3:@"erebuni3" url:@"http://erebuni.am" contactNumber:@"+374 10 458207" address:@"38 Erebuni St, Yerevan, Armenia" placeType:@"Museum" longitude:@44.531549 latitude:@40.141420];
    
    Place *modernArtMuseum = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
    [modernArtMuseum setName:@"Modern Art Museum" descriptionInfo:@"Modern Art Museum was established in 1972 by the art critic Henrik Igityan, who was the director of the museum for 37 years. H. Igityan received a great support from the mayor of Yerevan of those years Grigor Hasratyan, as well as from the best Armenian artists of 1960s. Recently the collection of the Museum was enriched with the works of both Armenian and foreign masters, such as: Taline Zabounian (France), Sam Grigoryan (Germany), Harutyun Jinanyan (Jino) (Russia), Vatche Demirdjian (France), Lorent Nissou Soon (France), SYB (France), Christine Hagopian (France), Dibasar (France), Sharis Garabedian (France), Sebastiano (USA), Ziba Afshar (USA), Michael Gorman (USA), Garry John (USA), Karen Bistedt and Chris Brown (USA),  Haik Mesropian (Switzerland), Onik Atamyan (England) etc." logo:@"modernArt-logo" price:@2500 rating:@3 image1:@"modernArt1" image2:@"modernArt2" image3:@"modernArt3" url:@"http://mamy.am" contactNumber:@"+374 10 539637" address:@"7 Mashtots Ave, Yerevan, Armenia" placeType:@"Museum" longitude:@44.506211 latitude:@40.180263];
    
   Place *genocideMuseum = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
   [genocideMuseum setName:@"Genocide Museum" descriptionInfo:@"The Armenian Genocide Museum opened its doors in 1995, concurrently commemorating the eightieth anniversary of the Genocide. The Museum structure, planned by architects S. Kalashian, A. Tarkhanyan and sculptor F. Araqelyan, has a unique design. During the decennial activity the Museum received many visitors including schoolchildren, college students and an unprecedented number of tourists both local and abroad. The Genocide Monument is designed to memorialize the innocent victims of the first Genocide of the 20th century. The Genocide Museum’s mission statement is rooted in the fact that understanding the Armenian Genocide is an important step in preventing similar future tragedies, in keeping with the notion that those who forget the past are condemned to repeat it." logo:@"genocide-logo" price:@3000 rating:@5 image1:@"genocide1" image2:@"genocide2" image3:@"genocide3" url:@"http://genocide-museum.am" contactNumber:@"+374 10 390981" address:@"Tsitsernakaberd memorial complex, Yerevan, Armenia" placeType:@"Museum" longitude:@44.490303 latitude:@40.185821];
    
    Place *parajanovMuseum = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
    [parajanovMuseum setName:@"Sergey Parajanov Museum" descriptionInfo:@"The Sergej Parajanov Museum is a tribute to one of the greatest figures [or auteurs] of 20th-century world cinema. Comprising some 1,400 exhibits, the museum’s collection includes installations, collages, assemblages, drawings, dolls, and hats. The museum also showcases unpublished screenplays, librettos, and various artworks which Parajanov created while in prison. Parajanov’s visionary films, such as “The Shadows of Forgotten Ancestors,” “Sayat-Nova,” and “The Legend of Suram Fortress,” earned him international acclaim and led to lifelong persecution by the Soviet regime." logo:@"parajanov-logo" price:@2000 rating:@4 image1:@"parajanov1" image2:@"parajanov2" image3:@"parajanov3" url:@"http://parajanovmuseum.am" contactNumber:@"+374 10 538473" address:@"Dzoragyugh, 15-16 eth. qrt. Yerevan, Armenia" placeType:@"Museum" longitude:@44.499103 latitude:@40.179186];
    
    Place *matenadaran = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
    [matenadaran setName:@"Matenadaran" descriptionInfo:@"In behaviors of our medieval famous bibliographers and workers are especially emphasized also their bibliography activities, which consist of gathering the old journals and creating the new others, combining past spiritual heritage and reviewing their great efforts, that became spiritual heroic lessons for future generations. Mesrop Mashtots (the first creator of the Matenadaran) and our specialists have created many matenadarans from early medieval to the new period of time by branching and connecting in the heart of the centuries. As eternal treasures they confronted to all disasters and led our people as a reasonable light. Like this was created also Mashtots Matenadaran. The illuminators of our culture and all generations participated for the creation, the whole nation as a spiritual unity. It is strong instinct result of our unity, collectivism, existence and our pledge of eternity. Matenadaran is our identity, flag, the State Emblem. It is, of course, a hymn that will sound forever." logo:@"matenadaran-logo" price:@1500 rating:@5 image1:@"matenadaran1" image2:@"matenadaran2" image3:@"matenadaran3" url:@"http://matenadaran.am" contactNumber:@"+374 10 513014" address:@"Mashtots Avenue 53, Yerevan, Armenia" placeType:@"Museum" longitude:@44.521098 latitude:@40.192125];
    
    //Cinemas Theatres List
    
    Place *moscowCinema = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
    [moscowCinema setName:@"Moscow Cinema" descriptionInfo:@"Cinema has four halls, the Red hal- 491 seats, the Blue hall - 350 seats, Red small hall - 49 seats, Videohall -  35 seats. The halls are equipped with modern technics. In parallel with film screenings Moscow cinema organizes various events and festivals. Some of them include 'Golden Apricot' Yerevan International Film Festival, 'British Film Festival', 'Rolan' International Film Festival', 'ReAnimania'  International Animation Film Festival of Yerevan, as well as screenings of Japanese, Indian, French and other films.Moreover, various events undertaken by differente mbassies are organizedhere. In parallel with film screenings different exhibitions are organizedin the waiting hall of the cinema." logo:@"moscowCinema-logo" price:@2000 rating:@4 image1:@"moscowCinema1" image2:@"moscowCinema2" image3:@"moscowCinema3" url:@"http://moscowcinema.com" contactNumber:@"+374 10 521210" address:@"18 Abovyan St, Yerevan, Armenia" placeType:@"TheatreCinema" longitude:@44.517365 latitude:@40.182076];
    
    Place *cinemaStar = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
    [cinemaStar setName:@"Cinema Star" descriptionInfo:@"The 'Cinema Star' multiplex cinema theatre was opened with 6 halls on 18 November 2013. It is part of Dalma Garden Mall shopping complex, located near the Tsitsernakaberd hill in Yerevan, which is the first mall opened in Armenia. The center also includes food outlets and cafeterias for family relaxation. This is a good entertainment center, having kids club, number of cinema halls, bowling, restaurant and much more." logo:@"cinemaStar-logo" price:@3000 rating:@5 image1:@"cinemaStar1" image2:@"cinemaStar2" image3:@"cinemaStar3" url:@"http://cinemastar.ru" contactNumber:@"+374 60 755555" address:@"3 Tsitsernakaberd highway, Yerevan, Armenia" placeType:@"TheatreCinema" longitude:@44.484441 latitude:@40.181554];
    
    Place *dramaticTheatre = [NSEntityDescription insertNewObjectForEntityForName:@"Places" inManagedObjectContext:context];
    [dramaticTheatre setName:@"Dramatic Theater" descriptionInfo:@"Hrachya Ghaplanyan Drama Theatre is a theatre based in Yerevan, the capital of Armenia. It was founded in 1967. It is located on Avetik Isahakyan 28 street of the Kentron district. It was opened with a performance of Hovhannes Tumanian's 'Anush' opera, directed by Hrachya Ghaplanyan. Since 1986, the artistic director at the theatre is Armen Khandikyan." logo:@"dramaTheatre-logo" price:@4000 rating:@4 image1:@"dramaTheatre1" image2:@"dramaTheatre2" image3:@"dramaTheatre3" url:@"http://ydt.am" contactNumber:@"+374 10 524703" address:@"28 Isahakyan St, Yerevan, Armenia" placeType:@"TheatreCinema" longitude:@44.520304 latitude:@40.188555];
    
    [self saveContext];
}

- (NSArray *)fetchFastFood {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Places"];
    
    return [context executeFetchRequest:fetchRequest error:nil];
}

- (NSArray *)fetchMuseum {
    
    NSString *placeType = @"Museum";
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Places"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"placeType == %@", placeType]];
    
    return [context executeFetchRequest:fetchRequest error:nil];
}

//
//- (NSArray *)fetchCinemaTheatre {
//   //
//}


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
