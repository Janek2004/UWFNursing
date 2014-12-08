//
//  ATCState.h
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/9/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
typedef NS_ENUM(NSUInteger, kWarningStatus) {
    kNoWarnings,
    kPositiveWarnings,
    kNegativeWarnings,
    kAllWarnings
};

@class ATCBeacon;
@class ATCStation;
@interface ATCState : NSObject
    @property (nonatomic, readonly) NSInteger session;
    @property (nonatomic, readonly)BOOL primaryNurse;
    @property (readonly) BOOL loggedIn;
    @property (nonatomic, readonly) NSInteger user;
    @property (nonatomic, readonly)BOOL warning;
    @property (nonatomic) NSInteger location;
    @property (strong, nonatomic) NSArray * stations;
    @property (nonatomic,strong) NSMutableArray * regionEvents;
    @property kWarningStatus warningStatus;

    -(NSInteger)locationCheckForProximityEvents:(NSArray *)proximityEvents andDate:(NSDate *)date;
    -(void)registerProximity:(ATCBeacon*)beacon andProximity:(CLProximity)proximity;
    -(void)registerRegionEvent:(ATCStation*)beacon andState:(CLRegionState)state;
    -(BOOL)logicFor:(ATCBeacon *)beacon;
    -(void)logout;



@end
