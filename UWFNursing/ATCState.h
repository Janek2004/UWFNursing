//
//  ATCState.h
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/9/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@class ATCBeacon;
@interface ATCState : NSObject
    @property(nonatomic, readonly) NSInteger session;
    @property(nonatomic, readonly)BOOL primaryNurse;
    @property (readonly) BOOL loggedIn;
    @property (nonatomic, readonly) NSInteger nurse;
    @property (nonatomic, readonly)BOOL warning;
    @property(nonatomic) NSInteger location;
    @property (strong, nonatomic) NSArray * patients;
    @property (nonatomic,strong) NSArray * regionEvents;
    -(void)registerProximity:(ATCBeacon*)beacon andProximity:(CLProximity)proximity;

    -(void)registerSinkProximityEvent:(NSInteger)proximity;
    -(void)registerPatientProximityEvent:(NSInteger)proximity;
    -(void)registerRoomProximityEvent:(NSInteger)proximity;
    -(void)registerBriefingRoomProximityEvent:(NSInteger)proximity;

    -(void)registerSinkRegionEvent:(NSInteger)region;
    -(void)registerPatientRegionEvent:(NSInteger)region;
    -(void)registerRoomRegionEvent:(NSInteger)region;
    -(void)registerBriefingRoomRegionEvent:(NSInteger)region;

    -(BOOL)logicFor:(ATCBeacon *)beacon;
    -(void)logout;



@end
