//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    NSArray *holidaysInSeason = [self.database objectForKey:season];
    return holidaysInSeason;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {

    NSMutableArray *mutableSuppliesInHoliday = [[NSMutableArray alloc]initWithArray:[self.database[season][holiday] allObjects]];
    
    return mutableSuppliesInHoliday;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    BOOL isAValidholiday;
    NSArray *allKeysForSeason = [self.database[season] allKeys];
    if ([allKeysForSeason containsObject:holiday]){
        isAValidholiday = true;
    }else{
        isAValidholiday = false;
    }
    return isAValidholiday;
}


- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    BOOL isAValidSupply;
    NSArray *allKeysForHoliday = [self.database[season][holiday] allObjects];
    if ([allKeysForHoliday containsObject:supply]){
        isAValidSupply = true;
    }else{
        isAValidSupply = false;
    }
    return isAValidSupply;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    self.database[season][holiday] = [[NSMutableArray alloc] init];
    
    
    
    
    
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
     [self.database[season][holiday] addObject:supply];
    // no return
}

@end
