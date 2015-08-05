//
//  FISAppDelegateSpec.m
//  objc-holiday-properties
//
//  Created by Mark Murray on 8/5/15.
//  Copyright 2015 The Flatiron School. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISAppDelegate.h"


SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{
    
    __block FISAppDelegate *appDelegate;
    
    beforeEach(^{
        
        appDelegate = [[FISAppDelegate alloc] init];
        
        appDelegate.database =
        @{ @"Winter" : [@{ @"Christmas Day"    : [@[ @"plastic tree"   ,
                                                     @"tinsel"         ,
                                                     @"lights"         ,
                                                     @"presents"       ,
                                                     @"wreath"         ,
                                                     @"mistletoe"      ,
                                                     @"Christmas music"
                                                     ] mutableCopy],
                           @"New Year's Day"   : [@[ @"party hats"     ,
                                                     @"kazoos"         ,
                                                     @"champagne"
                                                     ] mutableCopy]
                           } mutableCopy],
           @"Spring" : [@{ @"Memorial Day"     : [@[ @"American flag"  ,
                                                     @"memoirs"
                                                     ] mutableCopy]
                           } mutableCopy],
           @"Summer" : [@{ @"Independence Day" : [@[ @"fireworks"      ,
                                                     @"barbeque"       ,
                                                     @"picnic blanket" ,
                                                     @"sunscreen"
                                                     ] mutableCopy],
                           @"Labor Day"        : [@[ @"white jeans"    ,
                                                     @"shopping bag"
                                                     ] mutableCopy]
                           } mutableCopy],
           @"Fall"   : [@{ @"Veteran's Day"    : [@[ @"barbeque"       ,
                                                     @"American flag"
                                                     ] mutableCopy],
                           @"Thanksgiving Day" : [@[ @"turkey"         ,
                                                     @"gravy"          ,
                                                     @"mashed potatoes",
                                                     @"acorn squash"   ,
                                                     @"cranberry sauce",
                                                     @"napkins"
                                                     ] mutableCopy]
                           } mutableCopy]
           };


    });
    
    describe(@"1 holidaysInSeason:", ^{
        it(@"returns an array with the correct holidays in the winter season", ^{
            expect([appDelegate holidaysInSeason:@"Winter"]).to.haveCountOf(2);
            expect([appDelegate holidaysInSeason:@"Winter"]).to.contain(@"Christmas Day");
            expect([appDelegate holidaysInSeason:@"Winter"]).to.contain(@"New Year's Day");
        });
        
        it(@"returns an array with the correct holidays in the summer season", ^{
            expect([appDelegate holidaysInSeason:@"Summer"]).to.haveCountOf(2);
            expect([appDelegate holidaysInSeason:@"Summer"]).to.contain(@"Independence Day");
            expect([appDelegate holidaysInSeason:@"Summer"]).to.contain(@"Labor Day");
        });
    });
    
    describe(@"2 suppliesInHoliday:inSeason:", ^{
        it(@"returns an array of the correct supplies for New Year's Day in Winter ", ^{
            NSMutableArray *newYearsSupplies = [@[ @"party hats",
                                                   @"kazoos"    ,
                                                   @"champagne"
                                                   ] mutableCopy];
            
            expect([appDelegate suppliesInHoliday:@"New Year's Day"
                                         inSeason:@"Winter"]).to.equal(newYearsSupplies);
        });
        
        it(@"returns an array of the correct supplies for Independence Day in Summer ", ^{
            NSMutableArray *independenceDaySupplies = [@[ @"fireworks"      ,
                                                          @"barbeque"       ,
                                                          @"picnic blanket" ,
                                                          @"sunscreen"
                                                          ] mutableCopy];
            
            expect([appDelegate suppliesInHoliday:@"Independence Day"
                                         inSeason:@"Summer"]).to.equal(independenceDaySupplies);
        });
    });
    
    describe(@"3 holiday:isInSeason:", ^{
        it(@"returns YES that Christmas Day is in Winter", ^{
            expect([appDelegate holiday:@"Christmas Day"
                             isInSeason:@"Winter"]).to.beTruthy();
        });
        
        it(@"returns YES that Labor Day is in Summer", ^{
            expect([appDelegate holiday:@"Labor Day"
                             isInSeason:@"Summer"]).to.beTruthy();
        });
        
        it(@"returns NO that Christmas Day is in Summer", ^{
            expect([appDelegate holiday:@"Christmas Day"
                             isInSeason:@"Summer"]).to.beFalsy();
        });
    });
    
    describe(@"4 supply:isInHoliday:inSeason:", ^{
        it(@"returns YES that barbeque is in Veteran's Day in Fall", ^{
            expect([appDelegate supply:@"barbeque"
                           isInHoliday:@"Veteran's Day"
                              inSeason:@"Fall"]).to.beTruthy();
        });
        
        it(@"returns YES that sunscreen is in Independence Day in Summer", ^{
            expect([appDelegate supply:@"sunscreen"
                           isInHoliday:@"Independence Day"
                              inSeason:@"Summer"]).to.beTruthy();
        });
        
        it(@"returns NO that sunscreen is not in New Year's Day in Winter", ^{
            expect([appDelegate supply:@"sunscreen"
                           isInHoliday:@"New Year's Day"
                              inSeason:@"Winter"]).to.beFalsy();
        });
        
    });
    
    
    describe(@"5 addHoliday:toSeason:", ^{
        it (@"returns the database with President's Day added as a key to Winter", ^{
            NSString *presidentsDay = @"President's Day";
            NSString *winter = @"Winter";
            
            [appDelegate addHoliday:presidentsDay
                           toSeason:winter         ];
            
            expect([appDelegate.database[winter] allKeys]).to.contain(presidentsDay);
        });
        
        it (@"returns the database with President's Day added as a key to Winter that points to the value of an empty NSMutableArray", ^{
            NSString *presidentsDay = @"President's Day";
            NSString *winter = @"Winter";
            
            [appDelegate addHoliday:presidentsDay
                           toSeason:winter         ];
            
            expect(appDelegate.database[winter][presidentsDay]).to.haveCountOf(0);
        });
        
        it (@"returns the database with President's Day not added as a key to another season", ^{
            NSString *presidentsDay = @"President's Day";
            NSString *winter = @"Winter";
            
            [appDelegate addHoliday:presidentsDay
                           toSeason:winter         ];
            
            expect([appDelegate.database[@"Spring"] allKeys]).toNot.contain(presidentsDay);
        });
        
    });
    
    describe(@"6 addSupply:toHoliday:inSeason:", ^{
        it (@"returns the database with sunscreen added to Veteran's Day in Fall", ^{
            NSString *sunscreen = @"sunscreen";
            NSString *veteransDay = @"Veteran's Day";
            NSString *fall = @"Fall";
            
            [appDelegate addSupply:sunscreen
                         toHoliday:veteransDay
                          inSeason:fall         ];
            
            expect(appDelegate.database[fall][veteransDay]).to.contain(sunscreen);
        });
        
        it (@"returns the database with sunscreen not added to another holiday", ^{
            NSString *sunscreen = @"sunscreen";
            NSString *veteransDay = @"Veteran's Day";
            NSString *fall = @"Fall";
            
            [appDelegate addSupply:sunscreen
                         toHoliday:veteransDay
                          inSeason:fall         ];
            
            expect(appDelegate.database[fall][@"Thanksgiving Day"]).toNot.contain(sunscreen);
        });
    });
});

SpecEnd
