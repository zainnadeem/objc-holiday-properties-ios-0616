//
//  FISAppDelegate.h
//  objc-holiday-properties
//
//  Created by iOS Staff on 8/5/15
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 *  Add a new property here.
 
 */

@property (strong, nonatomic) NSDictionary *database;

- (NSArray *)holidaysInSeason:(NSString *)season;

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season;

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season;

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season;

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season;

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season;

@end
