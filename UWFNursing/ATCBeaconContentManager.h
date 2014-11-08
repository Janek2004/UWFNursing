//
//  ATCBeaconContentManager.h
//  UWFNursing
//
//  Created by Janusz Chudzynski on 9/30/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//
@import CoreLocation;

@interface ATCBeaconContentManager : NSObject
@property (nonatomic,strong) NSDictionary * data; //contains raw data
@property (nonatomic,strong) NSMutableDictionary * stations; //current stations
@property (nonatomic,strong) NSMutableDictionary * stationsCompleteDictionary;


-(NSArray *)contentForBeaconID:(NSString *)beaconId andMajor:(NSNumber *)major andMinor:(NSNumber *)minor proximity:(CLProximity)pr;
-(NSArray *)setNearbyBeacons:(NSArray*)beacons;
-(NSArray *)removeBeacon:(NSString *)pid;
-(NSArray *)addBeacon:(NSString *)pid;

-(id)initWithCompletion:(void (^)(NSArray *))stationsBlock;

@end
