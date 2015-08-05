//
//  FISAppDelegate.m
//  objc-holiday-properties
//
//  Created by iOS Staff on 8/5/15
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISAppDelegate.h"

@interface FISAppDelegate ()

@end


@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    return nil;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    return nil;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    return nil;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    return nil;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
}



@end
