//
//  CoreDataManager.m
//  eveningPlanner
//
//  Created by User on 4/12/16.
//
//

#import "CoreDataManager.h"

static NSString *const kEntityNamePlaces = @"Places";

@interface CoreDataManager ()

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation CoreDataManager

+ (id)defaultManager {
    static CoreDataManager *defaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultManager = [[self alloc] init];
    });
    return defaultManager;
}

- (void)insertPlacesList {
    NSManagedObjectContext *context = [self managedObjectContext];
     //Games
    
    Place *PlayCity = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [PlayCity setName:@"PlayCity"
      descriptionInfo:@"Play City was founded in 2002 originally having the idea of various funny and safe entertainment services in Armenia having the basis of high-quality service, new technologies and unique resting place. The only place in Armenia where you can find various services for your pastime and entertainment are gathered in one place. Karting, Bowling, Buggy, Game Machines, 7D Cinema, Bumper-Car, Mini Golf, Paint Ball, Billiards, as well as restaurant, cafe-bar where you can organize your birthday, parties and corporative events."
                 logo:@"playcity-logo"
                price:@15000
               rating:@3
           imageFirst:@"playcityimg1"
          imageSecond:@"playcityimg2"
           imageThird:@"playcityimg3"
            urlString:@"http://playcity.am"
        contactNumber:@"+374 10 620 999"
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
             imageFirst:@"captainkidimg1"
            imageSecond:@"captainkidimg2"
             imageThird:@"captainkidimg3"
              urlString:@"http://captainkid.am"
          contactNumber:@"+374 11 200 022"
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
       imageFirst:@"aeonimg1"
      imageSecond:@"aeonimg2"
       imageThird:@"aeonimg3"
        urlString:@"http://aeonyerevan.com"
    contactNumber:@"+374 10 538 766 "
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
       imageFirst:@"loftimg1"
      imageSecond:@"loftimg2"
       imageThird:@"loftimg3"
        urlString:@"http://loft.am"
    contactNumber:@"+374 43 408 864 "
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
               imageFirst:@"dalmabowlingimg1"
              imageSecond:@"dalmabowlingimg2"
               imageThird:@"dalmabowlingimg3"
                urlString:@"http://dalma.am"
            contactNumber:@"+374 60 755 555"
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
              imageFirst:@"bouldertownimg1"
             imageSecond:@"bouldertownimg2"
              imageThird:@"bouldertownimg3"
               urlString:@"http://uptherocks.com/"
           contactNumber:@"+374 93 337 937"
                 address:@"1 Kajaznuni Str., Yerevan, Armenia"
               placeType:@"Gym"
               longitude:@44.51967
                latitude:@40.17060];
    
    
    Place *GoldsGym = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [GoldsGym setName:@"Gold's Gym"
      descriptionInfo:@"Established in Venice, California in 1965, Gold’s Gym is the largest full service chain in the world with over 700 locations in 42 states and 28 countries. Gold’s Gym offers state of the art exercise equipment and industry leading fitness programs, including group exercise, personal training, cardiovascular equipment, cycling, Pilates, yoga and Cardio.With over 3.5 million members worldwide, Gold’s Gym helps all kinds of people achieve their individual potential through fitness."
                 logo:@"goldsgym-logo"
                price:@3500
               rating:@4
           imageFirst:@"goldsgymimg1"
          imageSecond:@"goldsgymimg2"
           imageThird:@"goldsgymimg3"
            urlString:@"http://goldsgym.am"
        contactNumber:@"+374 10 322 010"
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
          imageFirst:@"incourtimg1"
         imageSecond:@"incourtimg2"
          imageThird:@"incourtimg3"
           urlString:@"http://incourt.am"
       contactNumber:@"+374 10 565 665"
             address:@"7/1 Tsitsernakaberdi Hwy., Yerevan, Armenia"
           placeType:@"Gym"
           longitude:@44.52141
            latitude:@40.21387];
    
    
    
    Place *GolfArmenia = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [GolfArmenia setName:@"Golf Association"
         descriptionInfo:@"Still in the spring of 1998 during his visit in Armenia Vahagn Hovnanyan gave birth to the idea of founding a golf club and developing golf in Armenia. In 2000 on a small piece of earth, surrounded by majestic Ararat, Aragats and Ara mountains, Vahagn Hovnanyan started the construction of “Ararat Golf Club” having no precedent in Armenia and whole Transcaucasia, consisting of 9 playing fields and an athletic field. In the beginning of 2001 the athletic field was put into operation, while the construction of scheduled 9 playing fields was actively progressing. In 2005 the construction activities were completed and for the first time in Armenia there was provided the occasion to play an aristocratic type of sports, GOLF by name,loved by millions of people all over the world. In parallel to the construction of golf fields, there were constructed also 18 “Mini Golf” fields, two tennis courts, a swimming pool, football and basketball fields, etc. In 2005 “Ararat Golf” club was renamed “Ararat Valley Country Club”, with the scope to gather people around the sport of golf. Within the framework of golf development in Armenia in 2007 the first golf competition was organized in Armenia. In the future the Golf Competition gave start of an annual Golf Tournament named by the founder of Ararat Golf Club and the President of Golf Association Mr. Vahak Hovnanian – “Vahakni Open” Golf Tournament."
                    logo:@"golfarmenia-logo"
                   price:@7000
                  rating:@3
              imageFirst:@"golfarmeniaimg1"
             imageSecond:@"golfarmeniaimg2"
              imageThird:@"golfarmeniaimg3"
               urlString:@"http://golfarmenia.am"
           contactNumber:@"+374 10 565 665"
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
             imageFirst:@"grandsportimg1"
            imageSecond:@"grandsportimg2"
             imageThird:@"grandsportimg3"
              urlString:@"http://grandsport.am"
          contactNumber:@"+374 10 447 766"
                address:@"61 Arshakunyats Av., Yerevan, Armenia"
              placeType:@"Gym"
              longitude:@44.49788
               latitude:@40.14709];
    
    // Restaurants
    
    Place *yerevanPandok = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces
                                                         inManagedObjectContext:context];
    
    [yerevanPandok setName:@"Tavern Yerevan"
           descriptionInfo:@"The cuisine of a region is part of its larger culture and an evidence of the preferences that evolve with time due to contacts and historical developments. Being a unique part of the national identity the cuisine also experiences different influences and cannot be restricted by the traditions of one culture or one nation. Probably this is why since Tavern Yerevan’s foundation we tried to combine the best traditions of Armenian and Caucasian cuisines in our restaurant. Many of the Caucasian dishes have been accepted by Armenians with time and have become an integral part of the Armenian menu. Since, the very beginning our mission was to offer our customers dishes that are palatable for our customer from both culinary and cultural perspective, but are also slightly different. This is, though, only part of our comprehensive approach. At Tavern Yerevan we use the highest quality fresh products supplied by our partner farmers and producers. We are extremely consistent in ensuring highest professionalism and service quality of our serving staff."
                      logo:@"tavernYerevanLogo"
                     price:@7000
                    rating:@4
                imageFirst:@"tavernYerevanOne"
               imageSecond:@"tavernYerevanTwo"
                imageThird:@"tavernYerevanThree"
                 urlString:@"http://pandokyerevan.com"
             contactNumber:@"+374 10 508 800"
                   address:@"91 Teryan St, Yerevan, Armenia"
                 placeType:@"Restaurant"
                 longitude:@44.502000
                  latitude:@40.178764];
    
    Place *villa = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [villa setName:@"Villa"
   descriptionInfo:@"350-seat hall - We have a three hundred and fifty-seat hall on the second floor for your parties. A 100-seat hall - On the first floor we have a hundred-seat hall with quiet interior, where the brick walls are covered with black-and-white photos of old Yerevan. Family private rooms - Alongside the pool there are six to sixteen-seat eight separate small rooms. Above all rises fifty-seat spacious, comfortable and quiet private outdoor balcony. Outdoor pavilions - We also have five roundly wooden pavilions. This is a wonderful place for small groups who prefer the atmosphere of nature, a pleasant murmur of water and sun rays penetrating inside. Kitchen - The restaurant menu is rich in the Caucasus and Mediterranean cuisines, which are represented in Armenian style. It will satisfy every visitor's taste, as the best and tastiest."
              logo:@"villaLogo"
             price:@8000
            rating:@4
        imageFirst:@"villaOne"
       imageSecond:@"villaTwo"
        imageThird:@"villaThree"
         urlString:@"http://vila.am"
     contactNumber:@"+374 10 671 050"
           address:@"10/2 Building, Jrvezh village 15th St, Kotayk Marz, Armenia"
         placeType:@"Restaurant"
         longitude:@44.605951
          latitude:@40.187199];
    
    Place *blackBerry = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [blackBerry setName:@"Blackberry"
        descriptionInfo:@"The BlackBerry is one of the “L’Orange” network cafes opened its doors on March 5, 2005 in downtown Yerevan at 21 Abovyan St. The name L’Orange came from the wish to associate it with something fun and happy."
                   logo:@"blackBerryLogo"
                  price:@10000
                 rating:@5
             imageFirst:@"blackBerryOne"
            imageSecond:@"blackBerryTwo"
             imageThird:@"blackBerryThree"
              urlString:@"http://blackberry.lorange.am"
          contactNumber:@"+374 10 516 711"
                address:@"3 Abovyan St, Yerevan, Armenia"
              placeType:@"Restaurant"
              longitude:@44.515522
               latitude:@40.180855];
    
    Place *dolmama = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [dolmama setName:@"Dolmama"
     descriptionInfo:@"Dolmama was established in 1998. Starting it was simple but there were many problems to resolve, not the least of them was creation of a menu that would be interesting, tasty, good looking and typical Armenian, to be exact - Eastern Armenian. Most of the world familiar with Armenian food has had contacts with western Armenians (territory of Ottoman Empire) who where dispersed all over the world at the beginning of the last century after the tragic events of the Armenian Genocide. Armenia has very rich culinary culture, with many influences of nations surrounding it. In its turn, Armenian culinary has had a great impact on the culinary culture of the neighboring countries. Yogurt is a good example of this. . First time I heard about yogurt in the US, when Colombo yogurt was advertised on the radio in the early 70s. On the other hand, Eastern Armenian cuisine that developed on the current mountainous territory of the Republic of Armenia has overseen many hardships. Being part of the Soviet Union was not the least of them. Now, how boring can that be?"
                logo:@"dolmamaLogo"
               price:@6000
              rating:@3
          imageFirst:@"dolmamaOne"
         imageSecond:@"dolmamaTwo"
          imageThird:@"dolmamaThree"
           urlString:@"http://dolmama.am"
       contactNumber:@"+374 10 561 354"
             address:@"10 Puskin St, Yerevan, Armenia"
           placeType:@"Restaurant"
           longitude:@44.515849
            latitude:@40.180511];
    
    Place *kavkazskayaPlennitsa = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [kavkazskayaPlennitsa setName:@"Caucasian Captive"
                  descriptionInfo:@"Owing to the professional cooks invited from Georgia, Armenia and the countries of caucasian region, you can tasty the most delicious armenian tolma, tavlama, harisa, georgian khachapuries, juicy chaxoxbili,  refined sacivi and other tasty dishes of the caucasian national cuisine."
                             logo:@"plennitsaLogo"
                            price:@5000
                           rating:@4
                       imageFirst:@"plennitsaOne"
                      imageSecond:@"plennitsaTwo"
                       imageThird:@"plennitsaThree"
                        urlString:@"http://kavkazskayaplennitsa.am"
                    contactNumber:@"+374 10 548 291"
                          address:@"4/6 Amiryan St, Yerevan, Armenia"
                        placeType:@"Restaurant"
                        longitude:@44.512023
                         latitude:@40.180990];
    
    Place *blackAngus = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [blackAngus setName:@"Black Angus"
        descriptionInfo:@"Black Angus was founded to bring the people and visitors of Yerevan a multi sensory experience of quality food in a beautiful burger bar environment. Our menu is focused on unique burger recipes, steaks, and traditional breakfasts that pair perfectly with craft cocktails in a boutique setting with free wifi, curated music, and modern interior design. One of the most popular restaurants in Yerevan on Trip Advisor and FourSquare, Black Angus is often called the best burger in Yerevan. Artak invites you to dine at Black Angus and experience it for yourself."
                   logo:@"angusLogo"
                  price:@4000
                 rating:@5
             imageFirst:@"angusOne"
            imageSecond:@"angusTwo"
             imageThird:@"angusThree"
              urlString:@"http://blackangus.am"
          contactNumber:@"+374 96 508 040"
                address:@"39/9 Mashtots Ave, Yerevan, Armenia"
              placeType:@"Restaurant"
              longitude:@44.501243
               latitude:@40.157077];
    
    Place *charles = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [charles setName:@"Charles"
     descriptionInfo:@"The restaurant Charles was established in 2009. With this name we tried to show the connection between two cooperating countries - Armenia and France. Charles is named after not only world famous Aznavour, who is Armenian, but also after many other French people.Charles restaurant is situated in the centre of Erevan, in the most crowded part of Erevan, near Cascade. If you are a lover of European varied cuisine and prefer to enjoy wines of high quality, then we can surely say that restaurant Charles is for you.Our menu also consists of both old traditional Armenian dishes. Pleasing interior, elegant live music, excellent service, and lovely staff. In our restaurant each of our clients can feel comfortable, enjoying his rest in one of our six halls.There are halls for smokers, for non-smokers, lounge bar, where you can enjoy Armenian paintings and warmth your evenings with the fireplace. And finally, you can listen to live music filled with the sounds of violin and piano.Our outdoor café is famous as one of the most pleasant places in Erevan for enjoying the quiet atmosphere of the street and live music."
                logo:@"charlesLogo"
               price:@7000
              rating:@3
          imageFirst:@"charlesOne"
         imageSecond:@"charlesTwo"
          imageThird:@"charlesThree"
           urlString:@"http://charles.am"
       contactNumber:@"+374 10 542 621"
             address:@"3/40 Tamanyan St, Yerevan, Armenia"
           placeType:@"Restaurant"
           longitude:@44.515091
            latitude:@40.190086];
    
    Place *crumbs = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [crumbs setName:@"Crumbs"
    descriptionInfo:@"CRUMBS bread factory specializes in Eu­ropean bread and pastry baking. We use natural, artisan methods and the finest quality ingredients to bake our breads and pastries. All our products are hand-made and baked using reci­pes and techniques perfected over cen­turies. In order to give you a direct access to these treats, CRUMBS has opened café/shops where you can not only have a cup of coffee with your favorite pastry but also enjoy a great meal. Sandwiches, soups, salads and more other delicious products are made right at CRUMBS kitchen."
               logo:@"crumbsLogo"
              price:@10000
             rating:@5
         imageFirst:@"crumbsOne"
        imageSecond:@"crumbsTwo"
         imageThird:@"crumbsThree"
          urlString:@"http://crumbs.am"
      contactNumber:@"+374 10 537 013"
            address:@"37 Mashtots Ave, Yerevan, Armenia"
          placeType:@"Restaurant"
          longitude:@44.503818
           latitude:@40.171277];
    
    Place *theClub = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [theClub setName:@"The Club"
     descriptionInfo:@"Indulge in a daily feast of epicurean delights at the elegant Western Armenian restaurant with a French touch. This warm, unfussy place is very cozy and the signature food, created by Chef Anahit Sargisian and French Guest Chefs, is terrific and affordable."
                logo:@"clubLogo"
               price:@5000
              rating:@3
          imageFirst:@"clubOne"
         imageSecond:@"clubTwo"
          imageThird:@"clubThree"
           urlString:@"http://theclub.am"
       contactNumber:@"+374 10 531 361"
             address:@"40 Tumanyan St, Yerevan, Armenia"
           placeType:@"Restaurant"
           longitude:@44.511992
            latitude:@40.186492];
    
    // Fast Foods
    
    Place *karas = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [karas setName:@"Karas"
   descriptionInfo:@"Karas was founded in 2005 in Aremenia. Currently Karas operates as a national food chain including 13 service points. The chain has 5 restaurants in the Yerevan city, 1 restaurant in Yerevan Mall, 1 drive thru format restaurant in Yerevan and 1 restaurant in Tsaghkadzor. There are also 4 bistros in Yerevan and 1 bistro in Abovyan. In 2008 the chain launched delivery service, which is one of the one of the largest delivery services in Armenia today."
              logo:@"karasLogo"
             price:@1000
            rating:@4
        imageFirst:@"karasOne"
       imageSecond:@"karasTwo"
        imageThird:@"karasThree"
         urlString:@"http://karas.am"
     contactNumber:@"+374 10 325 595"
           address:@"1/1 Leningradyan St, Yerevan, Armenia"
         placeType:@"Fast Food"
         longitude:@44.457230
          latitude:@40.173729];
    
    Place *proshyanShaurma = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [proshyanShaurma setName:@"Proshyan Shaurma"
             descriptionInfo:@"In the fast food industry Proshyan shaurma offers a completely new quality. This was the first company to use innovative technologies, which help to save time and the taste of the food, we use only fresh and local food. The group of highly qualified chefs, who has passed a special trainings offers its customers a complete menu."
                        logo:@"proshyanLogo"
                       price:@800
                      rating:@2
                  imageFirst:@"proshyanOne"
                 imageSecond:@"proshyanTwo"
                  imageThird:@"proshyanThree"
                   urlString:@"http://proshyanshaurma.am"
               contactNumber:@"+374 10 211 111"
                     address:@"42 Proshyan St, Yerevan, Armenia"
                   placeType:@"Fast Food"
                   longitude:@44.504316
                    latitude:@40.187804];
    
    Place *gyros = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [gyros setName:@"Mr. Gyros"
   descriptionInfo:@"First branch of Mr. Gyros greek fast food was founded  on May 1, 2009.  By using well-designed strategy, Mr. Gyros has eight  branches in Yerevan now. The main aim of our company is to create a pleasant atmosphere and to  offer  only fresh and natural product."
              logo:@"gyrosLogo"
             price:@1500
            rating:@5
        imageFirst:@"gyrosOne"
       imageSecond:@"gyrosTwo"
        imageThird:@"gyrosThree"
         urlString:@"http://mrgyros.am"
     contactNumber:@"+374 10 202 203"
           address:@"34 Arshakunyats St, Yerevan, Armenia"
         placeType:@"Fast Food"
         longitude:@44.511721
          latitude:@40.186686];
    
    Place *pizzaHut = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [pizzaHut setName:@"Pizza Hut"
      descriptionInfo:@"In 1958, Frank and Dan Carney had an idea for a great local pizza restaurant in Wichita Kansas. When a friend suggested opening a pizza parlor--then a rarity--they agreed that the idea could prove successful, and they borrowed $600 from their mother to start a business with partner John Bender.Renting a small building at 503 South Bluff in downtown Wichita and purchasing secondhand equipment to make pizzas, the Carneys and Bender opened the first Pizza Hut restaurant; on opening night, they gave pizza away to encourage community interest. The small 25 seat restaurant only had room for 9 letters on the sign… the building looked like a hut… so 'Pizza Hut' was born!A year later, in 1959, Pizza Hut was incorporated in Kansas, and Dick Hassur opened the first franchise unit in Topeka, Kansas. Fifteen years later, we opened the first UK restaurant and since then we've become the biggest Pizza Company on the planet!A subsidiary of PepsiCo, Inc., the company oversees more than 11,000 pizza restaurants and delivery outlets in 90 countries worldwide."
                 logo:@"hutLogo"
                price:@3000
               rating:@4
           imageFirst:@"hutOne"
          imageSecond:@"hutTwo"
           imageThird:@"hutThree"
            urlString:@"http://pizza-hut.am"
        contactNumber:@"+374 10 501 504"
              address:@"34 Hyusisayin Ave, Yerevan, Armenia"
            placeType:@"Fast Food"
            longitude:@44.515336
             latitude:@40.183742];
    
    Place *tashirPizza = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces
                                                       inManagedObjectContext:context];
    
    [tashirPizza setName:@"Tashir Pizza"
         descriptionInfo:@"The first pizzeria Tashir Pizza was opened on March 22, 1999 in RF, in  Kaluga city. Since 1999 there are more than 270 pizzerias as in Russia as in CIS countries. Nowadays you can find Tashir Pizza in Moscow, Balashikha, Kaluga, Obninsk, Tula, Kursk, Belgorod, Serpukhov, Voronezh, Korolyov, Ryazan, Lipetsk, Saratov, Engels, Rostov-in-Done, Penza, Nizhny Novgorod, Pyatigorsk, Stavropol, Nevinnomissk, Yerevan,Vanadzor, Gyumri and so on."
                    logo:@"tashirLogo"
                   price:@2000
                  rating:@3
              imageFirst:@"tashirOne"
             imageSecond:@"tashirTwo"
              imageThird:@"tashirThree"
               urlString:@"http://tashirpizza.am"
           contactNumber:@"+374 10 511 117"
                 address:@"69 Teryan St, Yerevan, Armenia"
               placeType:@"Fast Food"
               longitude:@44.445260
                latitude:@40.173404];
    
    Place *mamaMia = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    
    [mamaMia setName:@"Mama Mia"
     descriptionInfo:@"The network of “Mama Mia” pizzerias offers its visitors the best combination of recreation and entertainment. Here you can enjoy a wide range of pizzas, family hamburgers, hot dishes, khachapury, soups, garnish, salads, appetizers, as well as dessert, alcoholic and non-alcoholic beverages, fresh, coffee tea, beer, cocktails and cigarettes. Your “tasty time” spent here will be intensified through piano, jazz and other music played in the hall."
                logo:@"miaLogo"
               price:@3000
              rating:@2
          imageFirst:@"miaOne"
         imageSecond:@"miaTwo"
          imageThird:@"miaThree"
           urlString:@"http://mamamia.am"
       contactNumber:@"+374 10 538 181"
             address:@"1/1 Aleq Manukyan St, Yerevan, Armenia"
           placeType:@"Fast Food"
           longitude:@44.523940
            latitude:@40.177413];
    
    //Museums list
    
    Place *cafesjianMuseum = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [cafesjianMuseum setName:@"Cafesjian Center"
             descriptionInfo:@"The Cafesjian Center for the Arts is dedicated to bringing the best of contemporary art to Armenia and presenting the best of Armenian culture to the world. Inspired by the vision of  its founder, Gerard L. Cafesjian, the Center offers a wide variety of exhibitions, derived from the Gerard L. Cafesjian Collection of contemporary art. Having celebrated its grand opening in November 2009, CCA continues to exhibit unique works of modern art and offers a diverse program of lectures, films, concerts, and numerous educational initiatives for adults and children. Over one million people have visited the Center annually since its opening."
                        logo:@"cafesjian-logo"
                       price:@5000
                      rating:@4
                  imageFirst:@"cafesjian1"
                 imageSecond:@"cafesjian2"
                  imageThird:@"cafesjian3"
                   urlString:@"http://cmf.am"
               contactNumber:@"+374 10 567 262"
                     address:@"10 Tamanyan St, Yerevan, Armenia"
                   placeType:@"Museum"
                   longitude:@44.515706
                    latitude:@40.190045];
    
    Place *nationalGallery = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [nationalGallery setName:@"National Gallery" descriptionInfo:@"The National Gallery of Armenia is the country’s major art gallery. Its collection is displayed in 56 galleries, which allow the Gallery to tell the story of national visual arts, decorative-applied arts as well as world culture from ancient times to our days. In the galleries of European, Russian, Armenian and Oriental art the visitors are introduced to the art of Aivazovsky, Sarian, Kandinsky, Donatello and other distinguished artists."
                        logo:@"natGallery-logo"
                       price:@3000
                      rating:@5
                  imageFirst:@"natGallery1"
                 imageSecond:@"natGallery2"
                  imageThird:@"natGallery3"
                   urlString:@"http://gallery.am"
               contactNumber:@"+374 10 580 812"
                     address:@"1 Aram St, Yerevan, Armenia"
                   placeType:@"Museum"
                   longitude:@44.512325
                    latitude:@40.180735];
    
    Place *erebuniMuseum = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [erebuniMuseum setName:@"Erebuni" descriptionInfo:@"Erebuni Fortress also known as Arin Berd is a fortified city from the ancient kingdom of Urartu, located in what is present-day Yerevan, Armenia. It was one of several fortresses built along the northern Urartu border and was one of the most important political, economic and cultural centers of the vast kingdom. The name Yerevan itself is derived from Erebuni. Erebuni was founded by King Argishti I (r. ca. 785–753 B.C.) in 782 B.C. It was built on top of a hill called Arin Berd overlooking the Arax! River Valley to serve as a military stronghold to protect the kingdom's northern borders."
                      logo:@"erebuni-logo"
                     price:@2000
                    rating:@4
                imageFirst:@"erebuni1"
               imageSecond:@"erebuni2"
                imageThird:@"erebuni3"
                 urlString:@"http://erebuni.am"
             contactNumber:@"+374 10 458 207"
                   address:@"38 Erebuni St, Yerevan, Armenia"
                 placeType:@"Museum"
                 longitude:@44.531549
                  latitude:@40.141420];
    
    Place *modernArtMuseum = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [modernArtMuseum setName:@"Modern Art" descriptionInfo:@"Modern Art Museum was established in 1972 by the art critic Henrik Igityan, who was the director of the museum for 37 years. H. Igityan received a great support from the mayor of Yerevan of those years Grigor Hasratyan, as well as from the best Armenian artists of 1960s. Recently the collection of the Museum was enriched with the works of both Armenian and foreign masters, such as: Taline Zabounian (France), Sam Grigoryan (Germany), Harutyun Jinanyan (Jino) (Russia), Vatche Demirdjian (France), Lorent Nissou Soon (France), SYB (France), Christine Hagopian (France), Dibasar (France), Sharis Garabedian (France), Sebastiano (USA), Ziba Afshar (USA), Michael Gorman (USA), Garry John (USA), Karen Bistedt and Chris Brown (USA),  Haik Mesropian (Switzerland), Onik Atamyan (England) etc."
                        logo:@"modernArt-logo"
                       price:@2500
                      rating:@3
                  imageFirst:@"modernArt1"
                 imageSecond:@"modernArt2"
                  imageThird:@"modernArt3"
                   urlString:@"http://mamy.am"
               contactNumber:@"+374 10 539 637"
                     address:@"7 Mashtots Ave, Yerevan, Armenia"
                   placeType:@"Museum"
                   longitude:@44.506211
                    latitude:@40.180263];
    
    Place *genocideMuseum = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [genocideMuseum setName:@"Genocide Museum" descriptionInfo:@"The Armenian Genocide Museum opened its doors in 1995, concurrently commemorating the eightieth anniversary of the Genocide. The Museum structure, planned by architects S. Kalashian, A. Tarkhanyan and sculptor F. Araqelyan, has a unique design. During the decennial activity the Museum received many visitors including schoolchildren, college students and an unprecedented number of tourists both local and abroad. The Genocide Monument is designed to memorialize the innocent victims of the first Genocide of the 20th century. The Genocide Museum’s mission statement is rooted in the fact that understanding the Armenian Genocide is an important step in preventing similar future tragedies, in keeping with the notion that those who forget the past are condemned to repeat it."
                       logo:@"genocide-logo"
                      price:@3000
                     rating:@5
                 imageFirst:@"genocide1"
                imageSecond:@"genocide2"
                 imageThird:@"genocide3"
                  urlString:@"http://genocide-museum.am"
              contactNumber:@"+374 10 390 981"
                    address:@"Tsitsernakaberd memorial complex, Yerevan, Armenia"
                  placeType:@"Museum"
                  longitude:@44.490303
                   latitude:@40.185821];
    
    Place *parajanovMuseum = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [parajanovMuseum setName:@"Parajanov Museum" descriptionInfo:@"The Sergej Parajanov Museum is a tribute to one of the greatest figures [or auteurs] of 20th-century world cinema. Comprising some 1,400 exhibits, the museum’s collection includes installations, collages, assemblages, drawings, dolls, and hats. The museum also showcases unpublished screenplays, librettos, and various artworks which Parajanov created while in prison. Parajanov’s visionary films, such as “The Shadows of Forgotten Ancestors,” “Sayat-Nova,” and “The Legend of Suram Fortress,” earned him international acclaim and led to lifelong persecution by the Soviet regime."
                        logo:@"parajanov-logo"
                       price:@2000
                      rating:@4
                  imageFirst:@"parajanov1"
                 imageSecond:@"parajanov2"
                 imageThird:@"parajanov3"
                   urlString:@"http://parajanovmuseum.am"
               contactNumber:@"+374 10 538 473"
                     address:@"Dzoragyugh, 15-16 eth. qrt. Yerevan, Armenia"
                   placeType:@"Museum"
                   longitude:@44.499103
                    latitude:@40.179186];
    
    Place *matenadaran = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [matenadaran setName:@"Matenadaran" descriptionInfo:@"In behaviors of our medieval famous bibliographers and workers are especially emphasized also their bibliography activities, which consist of gathering the old journals and creating the new others, combining past spiritual heritage and reviewing their great efforts, that became spiritual heroic lessons for future generations. Mesrop Mashtots (the first creator of the Matenadaran) and our specialists have created many matenadarans from early medieval to the new period of time by branching and connecting in the heart of the centuries. As eternal treasures they confronted to all disasters and led our people as a reasonable light. Like this was created also Mashtots Matenadaran. The illuminators of our culture and all generations participated for the creation, the whole nation as a spiritual unity. It is strong instinct result of our unity, collectivism, existence and our pledge of eternity. Matenadaran is our identity, flag, the State Emblem. It is, of course, a hymn that will sound forever."
                    logo:@"matenadaran-logo"
                   price:@1500
                  rating:@5
              imageFirst:@"matenadaran1"
             imageSecond:@"matenadaran2"
              imageThird:@"matenadaran3"
               urlString:@"http://matenadaran.am"
           contactNumber:@"+374 10 513 014"
                 address:@"Mashtots Avenue 53, Yerevan, Armenia"
               placeType:@"Museum"
               longitude:@44.521098
                latitude:@40.192125];
    
    //Cinemas Theaters List
    
    Place *moscowCinema = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [moscowCinema setName:@"Moscow Cinema" descriptionInfo:@"Cinema has four halls, the Red hal- 491 seats, the Blue hall - 350 seats, Red small hall - 49 seats, Videohall -  35 seats. The halls are equipped with modern technics. In parallel with film screenings Moscow cinema organizes various events and festivals. Some of them include 'Golden Apricot' Yerevan International Film Festival, 'British Film Festival', 'Rolan' International Film Festival', 'ReAnimania'  International Animation Film Festival of Yerevan, as well as screenings of Japanese, Indian, French and other films.Moreover, various events undertaken by different embassies are organized here. In parallel with film screenings different exhibitions are organized in the waiting hall of the cinema."
                     logo:@"moscowCinema-logo"
                    price:@2000
                   rating:@4
               imageFirst:@"moscowCinema1"
              imageSecond:@"moscowCinema2"
               imageThird:@"moscowCinema3"
                urlString:@"http://moscowcinema.com"
            contactNumber:@"+374 10 521 210"
                  address:@"18 Abovyan St, Yerevan, Armenia"
                placeType:@"TheatreCinema"
                longitude:@44.517365
                 latitude:@40.182076];
    
    Place *cinemaStar = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [cinemaStar setName:@"Cinema Star" descriptionInfo:@"The 'Cinema Star' multiplex cinema theatre was opened with 6 halls on 18 November 2013. It is part of Dalma Garden Mall shopping complex, located near the Tsitsernakaberd hill in Yerevan, which is the first mall opened in Armenia. The center also includes food outlets and cafeterias for family relaxation. This is a good entertainment center, having kids club, number of cinema halls, bowling, restaurant and much more."
                   logo:@"cinemaStar-logo"
                  price:@3000
                 rating:@5
             imageFirst:@"cinemaStar1"
            imageSecond:@"cinemaStar2"
             imageThird:@"cinemaStar3"
              urlString:@"http://cinemastar.ru"
          contactNumber:@"+374 60 755 555"
                address:@"3 Tsitsernakaberd highway, Yerevan, Armenia"
              placeType:@"TheatreCinema"
              longitude:@44.484441
               latitude:@40.181554];
    
    Place *dramaticTheater = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [dramaticTheater setName:@"Dramatic Theater" descriptionInfo:@"Hrachya Ghaplanyan Drama Theatre is a theatre based in Yerevan, the capital of Armenia. It was founded in 1967. It is located on Avetik Isahakyan 28 street of the Kentron district. It was opened with a performance of Hovhannes Tumanian's 'Anush' opera, directed by Hrachya Ghaplanyan. Since 1986, the artistic director at the theatre is Armen Khandikyan."
                        logo:@"drama-logo"
                       price:@4000
                      rating:@4
                  imageFirst:@"drama1"
                 imageSecond:@"drama2"
                  imageThird:@"drama3"
                   urlString:@"http://ydt.am"
               contactNumber:@"+374 10 524 703"
                     address:@"28 Isahakyan St, Yerevan, Armenia"
                   placeType:@"TheatreCinema"
                   longitude:@44.520304
                    latitude:@40.188555];
    
    Place *sundukyanTheater = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [sundukyanTheater setName:@"Sundukyan Theater" descriptionInfo:@"Gabriel Sundukyan National Academic Theater is presently one of the most loved and visited theaters on the territory of the Republic of Armenia. Being the first state theater in Armenia it was founded in 1921 and officially opened in 1922. The theater was named after dramatist Gabriel Sundukyan in 1937, and was awarded the status of Academic Theater only thirty years later, in 1967. The first performance played in the theater was the comedy “Pepo.” In regard to the establishment of the theater, the efforts of two people should be mentioned; they were artist Isahak Alikhanyan and operator Levon Qalantar. They managed to create a theater where the modern and the traditional were combined, and where for the first time the actor's and directorial theaters harmonized."
                         logo:@"sundukyan-logo"
                        price:@4500
                       rating:@4
                   imageFirst:@"sundukyan1"
                  imageSecond:@"sundukyan2"
                   imageThird:@"sundukyan3"
                    urlString:@"http://nationaltheater.am"
                contactNumber:@"+374 10 527 670"
                      address:@"6 Gr. Lusavorich St, Yerevan, Armenia"
                    placeType:@"TheatreCinema"
                    longitude:@44.507363
                     latitude:@40.173426];
    
    Place *paronyanTheater = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [paronyanTheater setName:@"Paronyan Theater" descriptionInfo:@"The Theatre was opened on June 22, 1942. The first artistic director was Shara Talyan. Many well-known persons worked in theatre, including Artemi Ayvazyan, Vardan Ajemian, Mikael Arutchian, Karp Khachvankyan, Svetlana Grigoryan, Armen Elbakyan, Yervand Ghazanchyan and others. Musical Comedy Theatre participated at international theatre festivals in Armenia, Georgia, Iran, England, the UnitedStates.In February 2009, the Best Presentation Award of Armenian Artavazd - 2009 festival was given to Yervand Ghazanchyan, who is the artistic director of theatre since 1993."
                        logo:@"paronyan-logo"
                       price:@3500
                      rating:@4
                  imageFirst:@"paronyan1"
                 imageSecond:@"sundukyan2"
                  imageThird:@"sundukyan3"
                   urlString:@"http://comedytheater.am"
               contactNumber:@"+374 10 580 101"
                     address:@"7 Vazgen Sargsyan St, Yerevan, Armenia"
                   placeType:@"TheatreCinema"
                   longitude:@44.510894
                    latitude:@40.177424];
    
    Place *pantomimeTheater = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [pantomimeTheater setName:@"Pantomime Theater" descriptionInfo:@"Yerevan State Pantomime theatre was founded in 1974. The status of the State Theatre received in 1983. Not having own building, theater performances are presented in Yerevan State Youth Theatre, the lease basis. In the summer of 2012, the Municipality of Yerevan, made decision to provide space in North Avenue for the construction of the building for the theatre. 1974 is considered to be the year of Pantomime Theatre establishment. In its first program the style of the theatre was evident. Later, several performances and etudes were staged, such as “Heroic Ballad”, “Stone, Eagle and Man”, “Blinds”, “The Robber and the Child”, “Autumn”, “Virus of Laugh” etudes and Saroyan’s “Who is there?”, Gogol’s “Overcoat” performances."
                         logo:@"pantomime-logo"
                        price:@2000
                       rating:@3
                   imageFirst:@"pantomime1"
                  imageSecond:@"pantomime2"
                   imageThird:@"pantomime3"
                    urlString:@"http://pantomime.am"
                contactNumber:@"+374 10 531 398"
                      address:@"3 Moskovyan St, Yerevan, Armenia"
                    placeType:@"TheatreCinema"
                    longitude:@44.522182
                     latitude:@40.183943];
    
    Place *operaBalletTheater = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [operaBalletTheater setName:@"Opera and Ballet" descriptionInfo:@"The pride of the Armenian nation, the Opera theatre, is located at the heart of the capital Yerevan. It is not simply a cultural structure, but an architectural masterpiece as well, whose creator is world-renowned Academician-Architect Alexander Tamanyan. It is not a coincidence that Tamanyan was honored first place in 1937 in Paris, during the world architecture exhibition. Today Armenia’s Opera and Ballet Theatre is taking practical steps to enlarge its playlist of both Armenian and International opera and ballet masterpieces, with the goal of representing them on Armenian stage."
                           logo:@"opera-logo"
                          price:@10000
                         rating:@5
                     imageFirst:@"opera1"
                    imageSecond:@"opera2"
                     imageThird:@"opera3"
                      urlString:@"http://opera.am"
                  contactNumber:@"+374 10 533 391"
                        address:@"54 Tumanyan St, Yerevan, Armenia"
                      placeType:@"TheatreCinema"
                      longitude:@44.513372
                       latitude:@40.185292];
    
    Place *kinopark = [NSEntityDescription insertNewObjectForEntityForName:kEntityNamePlaces inManagedObjectContext:context];
    [kinopark setName:@"Kinopark" descriptionInfo:@"Cinema has four halls, the Red hal- 491 seats, the Blue hall - 350 seats, Red small hall - 49 seats, Videohall -  35 seats. The halls are equipped with modern technics. In parallel with film screenings Moscow cinema organizes various events and festivals. Some of them include 'Golden Apricot' Yerevan International Film Festival, 'British Film Festival', 'Rolan' International Film Festival', 'ReAnimania'  International Animation Film Festival of Yerevan, as well as screenings of Japanese, Indian, French and other films.Moreover, various events undertaken by differente mbassies are organizedhere. In parallel with film screenings different exhibitions are organizedin the waiting hall of the cinema."
                 logo:@"kinopark-logo"
                price:@5000
               rating:@5
           imageFirst:@"kinopark1"
          imageSecond:@"kinopark2"
           imageThird:@"kinopark3"
            urlString:@"http://yerevanmall.am"
        contactNumber:@"+374 11 888 888"
              address:@"134/2 Arshakunyats Ave, Yerevan, Armenia"
            placeType:@"TheatreCinema"
            longitude:@44.507838
             latitude:@40.170474];
    
    
    [self saveContext];
}
- (NSArray *)fetchPlaceWith:(NSString *)placeType {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:kEntityNamePlaces];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"placeType == %@", placeType]];
    
    return [context executeFetchRequest:fetchRequest error:nil];
}

- (NSArray *)fetchPlaceWith:(NSString *)placeTypeOne and:(NSString *)placeTypeTwo {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:kEntityNamePlaces];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"placeType == %@ OR placeType == %@", placeTypeOne,
                                placeTypeTwo]];
    
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
